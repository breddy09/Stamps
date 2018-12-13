Then /^prepare environment for ratings test$/ do
  step 'select print on Shipping Label - 8 ½" x 11" Paper' if SdcGlobal.web_app == :mail
  step 'add new order' if SdcGlobal.web_app == :orders
end

Then /^excel rate sheet is loaded$/ do
  expect([:orders, :mail]).to include(SdcGlobal.web_app)
  Spreadsheet.client_encoding = 'UTF-8'
  rate_file = data_for(:rates_test, {})['rate_file']
  source_file = "#{data_for(:rates_test, {})['source_dir']}\\#{rate_file}"
  @rate_file_loc = "#{data_for(:rates_test, {})['test_dir']}\\#{rate_file}"
  FileUtils.cp(source_file, @rate_file_loc) if !File.file?(@rate_file_loc) || File.mtime(source_file) > File.mtime(@rate_file_loc)

  SdcLogger.info "Rate File: #{@rate_file_loc}"
  expect("Rate File: #{@rate_file_loc}").to eql "Rate File does not exist!" unless File.exist?(@rate_file_loc)
  begin
    @rate_file = Spreadsheet.open(@rate_file_loc)
  rescue StandardError => e
    SdcLogger.info e.message
    SdcLogger.info e.backtrace.join("\n")
    raise e, 'Cannot load rate sheet'
  end
  @failed_test_count = 0
  @rate_file.should_not be nil
end

# Then /^login and configure rate tests$/ do
#   step 'Start test driver'
#   step 'sign-in to mail' if SdcGlobal.web_app == :mail
#   step 'sign-in to orders' if SdcGlobal.web_app == :order
#   step 'excel rate sheet is loaded'
# end

