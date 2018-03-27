module Stamps
  class StampsUserCredentials
    attr_accessor :test_scenario, :cuke_tag
    attr_reader :db_connection, :user_credentials
    def initialize(db_connection)
      @db_connection = db_connection
      @user_credentials = {}
    end

    def fetch(tags)
      @cuke_tag = tags
      # reset old usernames
      result = db_connection.query("select * from user_credentials where in_use=1 and date_add(in_use_time, INTERVAL 2 HOUR) < (CURTIME())")
      if result.size > 0
        result.each do |row|
          db_connection.prepare("UPDATE user_credentials SET user_credentials.in_use=0 where username=?").execute(row['username'])
        end
      end

      case(@cuke_tag)
        when /purchasing/
          random_credentials('purchasing')
        when /comm_plus/
          random_credentials('comm_plus')
        else
          random_credentials('all')
      end
    end

    def random_credentials(test_tag)
      results = db_connection.query("select * from user_credentials where test_env='#{SdcEnv.env.to_s}' and user_status='Active' and test_tag='#{test_tag}' and in_use=0")
      expect(results.size).to be > 0, "No user found in MySQL DB for test tag #{cuke_tag} (#{test_scenario}) in #{SdcEnv.env.to_s.upcase}. Try again later or add more users to the database."
      rand_num = rand(results.size)
      results.each_with_index do |row, index|
        if rand_num == index
          user_credentials[:username] = row['username']
          user_credentials[:password] = row['password']
        end
      end
      db_connection.prepare("UPDATE user_credentials SET user_credentials.in_use=1, user_credentials.in_use_time=CURTIME(), user_credentials.in_use_date=CURDATE() where username=?").execute(user_credentials[:username])
      user_credentials
    end

    def all_user_credentials
      results = db_connection.query("select * from user_credentials where test_env='#{SdcEnv.env}' and user_status='Active'")
      credentials = Array.new(results.size){Hash.new}
      results.each_with_index do |row, index| credentials[index] = {:username => row['username'], :password => row['password']} end
      credentials
    end

    def close
      db_connection.prepare("UPDATE user_credentials SET user_credentials.in_use=0 where username=?").execute(user_credentials[:username])
      db_connection.close
    end
  end
end