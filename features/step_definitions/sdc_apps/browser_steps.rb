
Then /^Teardown$/ do
  SdcTest.teardown
end

Given /^I launched the browser$/ do
  step "Start test driver"
end

Then /^configure saucelabs$/ do
  # SdcLogger.debug "SELENIUM_HOST: #{SauceLabs.host}"
  # SdcLogger.debug "SELENIUM_PORT: #{SauceLabs.port}"
  # SdcLogger.debug "SELENIUM_PLATFORM: #{SauceLabs.platform}"
  # SdcLogger.debug "SELENIUM_VERSION: #{SauceLabs.version}"
  # SdcLogger.debug "SELENIUM_BROWSER: #{SauceLabs.browser}"
  # SdcLogger.debug "SELENIUM_DRIVER: #{SauceLabs.driver}"
  # SdcLogger.debug "SELENIUM_URL: #{SauceLabs.url}"
  # SdcLogger.debug "SAUCE_USERNAME: #{SauceLabs.sauce_username}"
  # SdcLogger.debug "SAUCE_ACCESS_KEY: #{SauceLabs.sauce_access_key}"
  # SdcLogger.debug "SELENIUM_STARTING_URL: #{SauceLabs.selenium_starting_url}"
  # SdcLogger.debug "SAUCE_ONDEMAND_BROWSERS: #{SauceLabs.sauce_on_demand_browsers}"
  # SdcLogger.debug 'Jenkins....'
  # SdcLogger.debug "JOB_NAME: #{ENV['JOB_NAME']}"
  # SdcLogger.debug "JOB_BASE_NAME: #{ENV['JOB_BASE_NAME']}"
  # SdcLogger.debug "BUILD_TAG: #{ENV['BUILD_TAG']}"
  # SdcLogger.debug "BUILD_NUMBER: #{ENV['BUILD_NUMBER']}"
  # SdcLogger.debug "BUILD_ID: #{ENV['BUILD_ID']}"
  # SdcLogger.debug "NODE_NAME: #{ENV['NODE_NAME']}"
  # SdcLogger.debug "EXECUTOR_NUMBER: #{ENV['EXECUTOR_NUMBER']}"
  # SdcLogger.debug "NODE_LABELS: #{ENV['NODE_LABELS']}"
  # SdcLogger.debug "WORKSPACE: #{ENV['WORKSPACE']}"
  # SdcLogger.debug "JENKINS_URL: #{ENV['JENKINS_URL']}"
  # SdcLogger.debug "BUILD_URL: #{ENV['BUILD_URL']}"
  # SdcLogger.debug "JOB_URL: #{ENV['JOB_URL']}"
end

Then /^Start test driver$/ do
  step 'launch the browser'
end

Then /^launch the browser$/ do
  SdcTest.configure
end

Then /^close the browser$/ do
  SdcTest.configure
end

Then /^refresh the browser$/ do
  begin
    SdcDriver.browser.refresh
    sleep(2)
  rescue
    # ignore
  end
end

Then /^go to url (.+)$/ do |str|
  SdcPage.browser.goto str
end

Then /^pause for (\d+) second(?:|s)?$/ do |seconds|
  sleep(seconds.to_i)
end

Then /^confirm print on gif printing dialog$/ do
  browser = SdcPage.browser
  browser.wait_until(timeout: 5) do |browser|
    browser.windows.count.eql?(2)
  end
  begin
    browser.windows.last.use
    browser.send_keys(:enter)
    browser.windows.first.use
  rescue
    # ignore
  end
end


Then /^cancel print on gif printing dialog$/ do
  browser = SdcPage.browser
  browser.wait_until(timeout: 5) do |browser|
    browser.windows.count.eql?(2)
  end
  begin
    browser.windows.last.use
    browser.send_keys(:tab)
    browser.send_keys(:enter)
  rescue
    # ignore
  end
  begin
    browser.windows.first.use
  rescue
    # ignore
  end
end
