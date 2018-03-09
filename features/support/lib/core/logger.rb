module Stamps
  ## Deprecated. Use SdcLogger instead
  #
  class Stampslog
    attr_accessor :scenario_name

    def initialize(scenario_name = 'Test Scenario')
      @scenario_name = scenario_name
      @log = Log4r::log.new ":"
      @log.outputters = Outputter.stdout
      #@log.level=Log4r::INFO
    end

    def repeat(char, count)
      str = char
      count.to_i.times {str = str + char}
      str
    end

    def message(message)
      begin
        message = repeat message, 25 if message.size == 1
        @log.info "#{scenario_name} :: #{message}"
      rescue
        # ignore
      end
      message
    end

    def step(message)
      begin
        message = repeat message, 25 if message.size == 1
        (@log.info "#{scenario_name} :: #{message}")
      rescue
        # ignore
      end
      message
    end

    def info(message)
      begin
        message = repeat message, 25 if message.size == 1
        (@log.info "#{scenario_name} :: #{message}") if SdcTest.debug
      rescue
        # ignore
      end
      message
    end

    def warn(message)
      begin
        message = repeat message, 25 if message.size == 1
        (@log.warn "#{scenario_name} :: #{message}")
      rescue
        # ignore
      end
      message
    end

    def error(message)
      begin
        message = repeat message, 25 if message.size == 1
        (@log.error "#{scenario_name} :: #{message}")
      rescue
        # ignore
      end
      message
    end

    def fatal(message)
      begin
        message = repeat message, 25 if message.size == 1
        (@log.fatal "#{scenario_name} :: #{message}")
      rescue
        # ignore
      end
      message
    end

    def debug(message)
      begin
        message = repeat message, 25 if message.size == 1
        @log.debug "#{scenario_name} :: #{message}"
      rescue
        #ignroe
      end
      message
    end
  end
end

