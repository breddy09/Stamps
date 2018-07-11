Then /^[Pp]repare environment for ratings test$/ do
  step 'select print on Shipping Label - 8 ½" x 11" Paper' if SdcEnv.sdc_app == :mail
  step "add new order" if SdcEnv.sdc_app == :orders
end

Then /^[Ee]xcel rate sheet is loaded$/ do
  expect([:orders, :mail]).to include(SdcEnv.sdc_app)
  Spreadsheet.client_encoding = 'UTF-8'
  rate_file = data_for(:rates_test, {})['rate_file']
  #copy file tolocal
  expect(Rating.new.spreadsheet.update).to be(true)
  @rate_file_loc = "#{data_for(:rates_test, {})['test_dir']}\\#{rate_file}"
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



