class SdcTest
  class << self
    def sauce_edge
      caps = Selenium::WebDriver::Remote::Capabilities.edge
      caps['platform'] = 'Windows 10'
      caps['version'] = '16.16299'
      client = Selenium::WebDriver::Remote::Http::Default.new
      client.timeout = 180

      Watir::Browser.new :remote, { desired_capabilities: caps, http_client: client, url: sauce_endpoint }
    end

    def capabilities(device)
      case device
      when :macos_safari
        capabilities_config = {
            :version => '11.0',
            :platform => 'macOS 10.13',
            :name => "#{SdcEnv.scenario.feature.name} - #{SdcEnv.scenario.name}"
        }
        browser = :safari

      when :macos_chrome
        capabilities_config = {
            :version => '54.0',
            :platform => 'macOS 10.13',
            :name => "#{SdcEnv.scenario.feature.name} - #{SdcEnv.scenario.name}"
        }
        browser = :chrome

      when :temp_device
        capabilities_config = {
            :version => '16.16299',
            :platform => 'Windows 10',
            :name => "#{SdcEnv.scenario.feature.name} - #{SdcEnv.scenario.name}"
        }
        browser = :edge
      else
        message = "Unsupported device. DEVICE=#{device}"
        error = ArgumentError
        raise error, message
      end

      build_name = ENV['JENKINS_BUILD_NUMBER'] || ENV['SAUCE_BAMBOO_BUILDNUMBER'] || ENV['SAUCE_TC_BUILDNUMBER'] || ENV['SAUCE_BUILD_NAME']
      capabilities_config[:build] = build_name unless build_name.nil?
      Selenium::WebDriver::Remote::Capabilities.send(browser, capabilities_config)
    end

    def win10_edge_sauce
      capabilities_config = {
          :version => '16.16299',
          :platform => 'Windows 10',
          :name => "#{SdcEnv.scenario.feature.name} - #{SdcEnv.scenario.name}"
      }

      build_name = ENV['JENKINS_BUILD_NUMBER'] || ENV['SAUCE_BAMBOO_BUILDNUMBER'] || ENV['SAUCE_TC_BUILDNUMBER'] || ENV['SAUCE_BUILD_NAME']
      capabilities_config[:build] = build_name unless build_name.nil?
      caps = Selenium::WebDriver::Remote::Capabilities.send(:edge, capabilities_config)

      client = Selenium::WebDriver::Remote::Http::Default.new
      client.timeout = 120

      Watir::Browser.new(:remote, { desired_capabilities: caps, http_client: client, url: sauce_endpoint })
    end

    def macos_chrome_sauce
      capabilities_config = {
          :version => '65.0',
          :platform => 'macOS 10.13',
          :name => "#{SdcEnv.scenario.feature.name} - #{SdcEnv.scenario.name}"
      }

      build_name = ENV['JENKINS_BUILD_NUMBER'] || ENV['SAUCE_BAMBOO_BUILDNUMBER'] || ENV['SAUCE_TC_BUILDNUMBER'] || ENV['SAUCE_BUILD_NAME']
      capabilities_config[:build] = build_name unless build_name.nil?
      caps = Selenium::WebDriver::Remote::Capabilities.send(:chrome, capabilities_config)

      client = Selenium::WebDriver::Remote::Http::Default.new
      client.timeout = 120

      Watir::Browser.new(:remote, { desired_capabilities: caps, http_client: client, url: sauce_endpoint })
    end

    def iphonex_sauce
      desired_caps = {
          caps: {
              appiumVersion: '1.7.2',
              deviceName:    'iPhone X Simulator',
              deviceOrientation: 'portrait',
              platformVersion: '11.2',
              platformName:  'iOS',
              browserName: 'Safari',
              name: "#{SdcEnv.scenario.feature.name} - #{SdcEnv.scenario.name}"
          },
          appium_lib: {
              sauce_username:   'robcruz', #nil, # don't run on Sauce
              sauce_access_key: '0e60dbc9-5bbf-425a-988b-f81c42d6b7ef', #nil,
              wait: 120
          }
      }

      Appium::Driver.new(desired_caps, false).start_driver
    end

    def samsung_galaxy_sauce
      desired_caps = {
          caps: {
              appiumVersion: '1.7.2',
              deviceName:    'Samsung Galaxy S8 GoogleAPI Emulator',
              deviceOrientation: 'portrait',
              platformVersion: '7.1',
              platformName:  'Android',
              browserName: 'Chrome',
              name: "test name"
          },
          appium_lib: {
              sauce_username:   nil, # don't run on Sauce 'robcruz',
              sauce_access_key: nil, # '0e60dbc9-5bbf-425a-988b-f81c42d6b7ef', #
              wait: 120
          }
      }

      Appium::Driver.new(desired_caps, false).start_driver
    end

    def configure
      SdcLogger.debug "Initializing test driver...\n"

      if TestSession.env.selenium_browser
        SdcPage.browser = TestSession.cloud_browser
        SdcLogger.debug TestSession.session_info(SdcPage.browser.driver.session_id)
        SdcEnv.width = SdcPage.browser.window.size.width
        SdcEnv.height = SdcPage.browser.window.size.height

      elsif TestSession.env.selenium_device
        SdcPage.browser = TestSession.cloud_device
        SdcLogger.debug TestSession.session_info(SdcPage.browser.session_id)

      elsif TestSession.env.local_browser
        SdcPage.browser = TestSession.local_browser
        SdcEnv.width = SdcPage.browser.window.size.width
        SdcEnv.height = SdcPage.browser.window.size.height
      else
        # do nothing
      end

    end

    def start
      require_gems

      ::SdcEnv.log_level ||= ENV['LOG_LEVEL']
      ::SdcEnv.driver_log_level ||= ENV['DRIVER_LOG_LEVEL']

      begin
        SdcLogger.level = if SdcEnv.log_level
                            SdcEnv.log_level
                          else
                            :error
                          end

        Selenium::WebDriver.logger.level = if SdcEnv.driver_log_level
                                             SdcEnv.driver_log_level
                                           else
                                             :error
                                           end
        SdcLogger.progname = SdcEnv.scenario.tags[0].name[1.. -1]

      rescue StandardError => e
        SdcLogger.error e.message
        SdcLogger.error e.backtrace.join("\n")
        raise e
      end
      SdcLogger.debug "\n"
      SdcLogger.debug "Begin test...\n"
      SdcLogger.debug "Feature: #{SdcEnv.scenario.feature}"
      SdcLogger.debug "Scenario: #{SdcEnv.scenario.name}"
      SdcLogger.debug '  Tags:'
      SdcEnv.scenario.tags.each_with_index { |tag, index| SdcLogger.debug "  Tag #{index + 1}: #{tag.name}" }
      SdcLogger.debug '  Steps:'
      SdcEnv.scenario.test_steps.each { |steps| SdcLogger.debug "  #{steps.source.last.keyword}#{steps.text}" }
      SdcLogger.debug "\n"
    end

    def require_gems
      require 'appium_lib'
      require 'appium_lib_core'
      #require 'mysql2' if TestSession.env.usr.nil? || TestSession.env.usr.casecmp('default').zero?

      if /rates/.match(SdcEnv.scenario.tags[0].name)
        require 'spreadsheet'
        require "csv"
        include Spreadsheet
      end
    end

    def legacy_web_apps_param
      @web_apps_param
      @web_apps_param.driver = SdcPage.browser
      @web_apps_param
    end

    def teardown
      # if SdcEnv.sauce_device
      #   sessionid = SdcPage.browser.send(:bridge).session_id
      #   jobname = "#{SdcEnv.scenario.feature.name} - #{SdcEnv.scenario.name}"
      #   if SdcEnv.scenario.passed?
      #     SauceWhisk::Jobs.pass_job sessionid
      #   else
      #     SauceWhisk::Jobs.fail_job sessionid
      #   end
      #
      #   SdcLog.info "SauceOnDemandSessionID=#{sessionid} job-name=#{jobname}"
      # else
      #
      #   SdcUserCredentials.close
      #
      #   SdcLog.info "#{SdcPage.browser} closed."
      # end

      SdcLogger.debug "Tear down...\n"
      SdcPage.browser.quit
      SdcLogger.debug "Done.\n"
    rescue StandardError => e
      SdcLogger.error e.message
      SdcLogger.error e.backtrace.join("\n")
    end

    private

    def browser_emulator_options(browser, device_name)
      prefs = {
          prompt_for_download: false,
          default_directory: "#{Dir.getwd}/download"
      }

      case browser_selection(browser)
      when :chrome
        options = Selenium::WebDriver::Chrome::Options.new
        options.add_emulation(device_name: device_name)
        options.add_preference(:download, prefs)
        return Selenium::WebDriver.for(:chrome, options: options)
      when :firefox
        return Selenium::WebDriver::Remote::Capabilities.firefox #firefox config goes here
      else
        raise ArgumentError, "Unsupported browser. #{browser}"
      end
    end


    def mobile(str)
      str.nil? ? str : str.downcase.delete(' ').to_sym
    end

    def is_ios?(str)
      str.nil? ? str : SdcEnv::IOS.include?(str.to_sym)
    end

    def is_android?(str)
      str.nil? ? str : SdcEnv::ANDROID.include?(str.to_sym)
    end

    def browser_selection(str)
      if str
        case str.downcase
        when /ff|firefox|mozilla/
          return :firefox
        when /chromeb|gcb|googleb/
          return :chromeb
        when /chrome|gc|google/
          return :chrome
        when /ms|me|microsoft|edge/
          return :edge
        when /apple|osx|safari|mac/
          return :safari
        else
          return str.downcase.to_sym
        end
      end
      str
    end

    def test_env(str)
      if str
        case(str.downcase)
        when /stg/
          return :stg
        when /cc/
          return :qacc
        when /sc/
          return :qasc
        when /rat/
          return :rating
        when /prod/
          return :prod
        else
          return str.downcase.to_sym
        end
      end
      str
    end

    def browser_version(str)
      /[\d.]+ Safari|Edge\/.+|Firefox\/.+|Chrome\/[\d\.]+/.match(str)
    end

    def os_version(str)
      /(Mac OS.+?[\d_]+|Windows.+?[\d\.]+)/.match(str)
    end
  end
end

