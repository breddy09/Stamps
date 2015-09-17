module Stamps
  module Test
    def self.browser
      Stamps::Browser::Browser.instance
    end

    def self.setup *args
      begin
        if args.length == 1
          ENV['BROWSER'] = args[0]
          log "Browser Selection:  #{ENV['BROWSER']}"
        end

        log "Executed Shell Command:  taskkill /im chrome.exe /f Result=[ #{system "gem list"} ]"

        if Stamps.browser.explorer?
          begin
            system "taskkill /im iexplore.exe /f"
          rescue
            #ignore
          end


          browser = Watir::Browser.new :ie
          browser_name = 'Internet Explorer'

        elsif Stamps.browser.chrome?
          begin
            system "taskkill /im chrome.exe /f"
          rescue
            #ignore
          end

          browser_name = 'Google Chrome'
          chrome_data_dir = "C:\\Users\\#{ENV['USERNAME']}\\AppData\\Local\\Google\\Chrome\\User Data\\Default" #	C:\Users\rcruz\AppData\Local\Google\Chrome\User Data\Default
          chrome_driver_path = "C:\\selenium\\drivers\\chromedriver.exe"

          log_param "chrome_driver:  exist?  #{File.exist? chrome_driver_path}  ##", chrome_driver_path
          log_param "chrome_data_dir:  exist?  #{File.exist? chrome_data_dir}  ##", chrome_data_dir

          begin
            raise log "Chrome Data Directory does not exist on this execution node:  #{chrome_data_dir}"
          end unless File.exist? chrome_data_dir

          prefs = {
              :download => {
                  :prompt_for_download => false,
                  :default_directory => chrome_data_dir
              }
          }

          profile = Selenium::WebDriver::Chrome::Profile.new
#
          user_data_dir = "user-data-dir=#{chrome_data_dir}"
#--user-data-dir="C:\Users\rcruz\AppData\Local\Temp\scoped_dir19560_20237"
          Selenium::WebDriver::Chrome.driver_path = chrome_driver_path
          browser = Watir::Browser.new :chrome, :switches => ["--user-data-dir=#{chrome_data_dir}"]
          #browser = Watir::Browser.new :chrome, :switches => ["--user_data_dir=C:\\Users\\#{ENV['USERNAME']}\\AppData\\Local\\Google\\Chrome\\User Data", "--ignore-certificate-errors", "--disable-popup-blocking", "--disable-translate]"]
          #browser = Watir::Browser.new :chrome, :prefs => prefs
        elsif Stamps.browser.firefox?
          begin
            system "taskkill /im firefox.exe /f"
          rescue
            #ignore
          end
          browser = Watir::Browser.new :firefox, :profile => 'selenium'
          browser_name = 'Firefox'
        else
          browser = Watir::Browser.new :ie
          browser_name = 'Internet Explorer'
        end

        log "Browser Selection:  #{browser_name} Launched."
        #browser.window.move_to 0, 0
        #browser.window.resize_to 1250, 850
        @browser = browser
      rescue Exception => e
        log e
        raise e
      end

    end

    def self.teardown
      @browser.quit unless @browser == nil
      @browser = nil
      log "Done!"
    end
  end
end