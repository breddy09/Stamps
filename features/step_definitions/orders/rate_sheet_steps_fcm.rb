Then /^run rate test FCM Package$/ do
  param_sheet = data_for(:rates_test, {})['rates_fcm_package']
  step "run rate sheet #{param_sheet}"
end

Then /^run rate sheet (.*)$/ do |param_sheet|
  zone = 1

  #TestData.store[:starting_time]=Time.now
  #TestData.store[:max_time]=60 #seconds or 4 min

  TestData.hash[:result_file] = Spreadsheet::Workbook.new
  TestData.hash[:result_sheet] = TestData.hash[:result_file].create_worksheet

  @rate_sheet = @rate_file.worksheet param_sheet
  @rate_sheet.should_not be nil

  # Set result sheet name to parameter sheet name
  TestData.hash[:result_sheet].name = param_sheet

  @rate_sheet_columns = {}
  TestData.hash[:result_sheet_columns] = {}
  TestData.hash[:result_sheet_column_offset] = 1

  # map out parameter sheet column location
  @rate_sheet_header = @rate_sheet.row(0)
  #result sheet columns
  @bold = Spreadsheet::Format.new(:weight => :bold)

  @rate_sheet_header.each_with_index do |column_name, row_number|
    if column_name == 'weight_oz'
      @rate_sheet_columns[:weight_oz] = row_number
      TestData.hash[:result_sheet_columns][:weight_oz] = row_number
      TestData.hash[:result_sheet].row(0)[row_number] = 'weight_oz'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)
    end
    #AB_ORDERSAUTO_3580 - changes to order of columns. Column=Row_number, not Row_number minus offset
    if column_name == 'zone1'
      @rate_sheet_columns[:zone1] = row_number
      TestData.hash[:result_sheet_columns][:zone] = row_number
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:zone]] = 'zone1'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'service'
      @rate_sheet_columns[:service] = row_number
      TestData.hash[:result_sheet_columns][:service] = row_number
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:service]] = 'service'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'tracking'
      @rate_sheet_columns[:tracking] = row_number
      TestData.hash[:result_sheet_columns][:tracking] = row_number
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:tracking]] = 'tracking'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'execution_date'
      @rate_sheet_columns[:execution_date] = row_number
      TestData.hash[:result_sheet_columns][:execution_date] = row_number
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:execution_date]] = 'execution_date'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'username'
      @rate_sheet_columns[:username] = row_number
      TestData.hash[:result_sheet_columns][:username] = row_number
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:username]] = 'username'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'ship_from'
      @rate_sheet_columns[:ship_from] = row_number
      TestData.hash[:result_sheet_columns][:ship_from] = row_number
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:ship_from]] = 'ship_from'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'ship_to_domestic'
      @rate_sheet_columns[:ship_to_domestic] = row_number
      TestData.hash[:result_sheet_columns][:ship_to_domestic] = row_number
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:ship_to_domestic]] = 'ship_to_domestic'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'weight'
      @rate_sheet_columns[:weight] = row_number
      TestData.hash[:result_sheet_columns][:weight] = row_number
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:weight]] = 'weight'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'service_selected'
      @rate_sheet_columns[:service_selected] = row_number
      TestData.hash[:result_sheet_columns][:service_selected] = row_number
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:service_selected]] = 'service_selected'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'tracking_selected'
      @rate_sheet_columns[:tracking_selected] = row_number
      TestData.hash[:result_sheet_columns][:tracking_selected] = row_number
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:tracking_selected]] = 'tracking_selected'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'total_ship_cost'
      @rate_sheet_columns[:total_ship_cost] = row_number
      TestData.hash[:result_sheet_columns][:total_ship_cost] = row_number
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:total_ship_cost]] = 'total_ship_cost'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'results'
      @rate_sheet_columns[:results] = row_number
      TestData.hash[:result_sheet_columns][:results] = row_number
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:results]] = 'results'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'status'
      @rate_sheet_columns[:status] = row_number
      TestData.hash[:result_sheet_columns][:status] = row_number
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:status]] = 'status'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'error_msg'
      @rate_sheet_columns[:error_msg] = row_number
      TestData.hash[:result_sheet_columns][:error_msg] = row_number
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:error_msg]] = 'error_msg'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)
    end
  end

  # Verify all columns exists in parameter sheet
  missing_column = false
  # noinspection RubyScope
  if @rate_sheet_columns[:weight_oz].nil?
    missing_column = true
    error_msg = "Column weight_oz does not exist in parameter sheet"
  elsif @rate_sheet_columns[:zone1].nil?
    missing_column = true
    error_msg = "Column zone1 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:service].nil?
    missing_column = true
    error_msg = "Column service does not exist in parameter sheet"
  elsif @rate_sheet_columns[:tracking].nil?
    missing_column = true
    error_msg = "Column tracking does not exist in parameter sheet"
  elsif @rate_sheet_columns[:execution_date].nil?
    missing_column = true
    error_msg = "Column execution_date does not exist in parameter sheet"
  elsif @rate_sheet_columns[:username].nil?
    missing_column = true
    error_msg = "Column username does not exist in parameter sheet"
  elsif @rate_sheet_columns[:execution_date].nil?
    missing_column = true
    error_msg = "Column execution_date does not exist in parameter sheet"
  elsif @rate_sheet_columns[:ship_from].nil?
    missing_column = true
    error_msg = "Column ship_from does not exist in parameter sheet"
  elsif @rate_sheet_columns[:ship_to_domestic].nil?
    missing_column = true
    error_msg = "Column ship_to_domestic does not exist in parameter sheet"
  elsif @rate_sheet_columns[:weight].nil?
    missing_column = true
    error_msg = "Column weight does not exist in parameter sheet"
  elsif @rate_sheet_columns[:service_selected].nil?
    missing_column = true
    error_msg = "Column service_selected does not exist in parameter sheet"
  elsif @rate_sheet_columns[:tracking_selected].nil?
    missing_column = true
    error_msg = "Column tracking_selected does not exist in parameter sheet"
  elsif @rate_sheet_columns[:total_ship_cost].nil?
    missing_column = true
    error_msg = "Column total_ship_cost does not exist in parameter sheet"
  elsif @rate_sheet_columns[:results].nil?
    missing_column = true
    error_msg = "Column results does not exist in parameter sheet"
  elsif @rate_sheet_columns[:status].nil?
    missing_column = true
    error_msg = "Column status does not exist in parameter sheet"
  elsif @rate_sheet_columns[:error_msg].nil?
    missing_column = true
    error_msg = "Column error_msg does not exist in parameter sheet"
  end

  expect("Check your parameter sheet: #{@rate_file_loc}").to eql error_msg if missing_column

  zone.should_not be nil
  zone_column = @rate_sheet_columns[:zone1]
  format = Spreadsheet::Format.new :color => :blue, :pattern_fg_color => :yellow, :pattern => 1
  fail_format = Spreadsheet::Format.new :color => :red, :weight => :bold
  pass_format = Spreadsheet::Format.new :color => :green, :weight => :bold
  # Set weight and services

  # Set address to proper zone
  step 'set order details ship-to to random address between zone 1 and 4'  if SdcGlobal.web_app == :orders
  step 'set print form mail-to to a random address in zone 1 through 4' if SdcGlobal.web_app == :mail
  step 'save print form mail from' if SdcGlobal.web_app == :mail
  step 'save order details data' if SdcGlobal.web_app == :orders


  @rate_sheet.each_with_index do |row, row_number|
    @row = row
    TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:zone]] = "zone#{zone}"
    begin
      if row_number > 0
        SdcLogger.info "#{"#" * 80} Rate Sheet: #{param_sheet}: Zone #{zone} - Row #{row_number}"

        # Set address to proper zone
        # step "set order details ship-to to random address between zone 1 and 4"  if SdcEnv.sdc_app == :orders
        # step "set print form mail-to to a random address in zone 1 through 4" if SdcEnv.sdc_app == :mail
        # step "save print form mail from" if SdcEnv.sdc_app == :mail
        # spreadsheet price for zone

        if row[zone_column] == nil
          #SdcLogger.info "#{"#" * 10} "
          #SdcLogger.info "#{"#" * 10} "
          #SdcLogger.info "#{"#" * 10} Test Row #{row_number} Skipped. No rates found on sheet."
          SdcLogger.info "Test Row #{row_number} Skipped. No rates found on sheet."
          #SdcLogger.info "#{"#" * 10} "
          #SdcLogger.info "#{"#" * 10} "
          #SdcLogger.info "#{"#" * 80} "
          TestData.hash[:result_sheet].row(row_number).set_format(TestData.hash[:result_sheet_columns][:zone], format)
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:weight_oz]] = row[@rate_sheet_columns[:weight_oz]]
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:zone]] = row[zone_column]
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:username]] = "--"
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:ship_from]] = "--"
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:ship_to_domestic]] = "--"
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:weight]] = "--"
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:service]] = "--"
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:execution_date]] = "--"
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:service_selected]] = "--"
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:tracking_selected]] = "--"
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:total_ship_cost]] = "--"
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:status]] = "--"
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:results]] = "--"
        else
          price = (row[zone_column].to_f * 100).round / 100.0
          # set expectation column for this row to zone price
          TestData.hash[:result_sheet].row(row_number).set_format(TestData.hash[:result_sheet_columns][:zone], format)
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:zone]] = price
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:username]] = TestData.hash[:username]
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:ship_from]] = TestData.hash[:ship_from]
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:ship_to_domestic]] = TestData.hash[:ship_to_domestic]  if SdcGlobal.web_app == :orders
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:ship_to_domestic]] = TestData.hash[:address]  if SdcGlobal.web_app == :mail

          # Set weight to 0
          step "set order details pounds to 0" if SdcGlobal.web_app == :orders
          step "set order details ounces to 0" if SdcGlobal.web_app == :orders

          step "set print form pounds to 0" if SdcGlobal.web_app == :mail
          step "set print form ounces to 0" if SdcGlobal.web_app == :mail

          # Set weight per spreadsheet
          weight_oz = row[@rate_sheet_columns[:weight_oz]]
          # SdcLogger.info "#{"#" * 10} "
          # SdcLogger.info "#{"#" * 10} Weight: #{weight_oz}"
           SdcLogger.info "Weight: #{weight_oz}"
          # SdcLogger.info "#{"#" * 10} Price: #{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:zone]]}"
           SdcLogger.info "Price: #{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:zone]]}"
          # SdcLogger.info "#{"#" * 10} "
          # SdcLogger.info "#{"#" * 50}"

          weight_oz = weight_oz.to_f
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:weight_oz]] = weight_oz
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:weight]] = "#{weight_oz} oz."
          step "set order details ounces to #{weight_oz}"  if SdcGlobal.web_app == :orders
          step "set print form ounces to #{weight_oz}"  if SdcGlobal.web_app == :mail

          # Set Service
          row[@rate_sheet_columns[:service]].should_not be nil
          service = row[@rate_sheet_columns[:service]]
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:service]] = service

          # record execution time as time service was selected.
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:execution_date]] = Time.now.strftime("%b %d, %Y %H:%M")

          step "set order details service to #{service}" if SdcGlobal.web_app == :orders
          step "select print form service #{service}" if SdcGlobal.web_app == :mail

          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:service_selected]] = TestData.hash[:service]

          # Set Tracking
          begin
            step "set order details tracking to #{row[@rate_sheet_columns[:tracking]]}"  if SdcGlobal.web_app == :orders
          end unless row[@rate_sheet_columns[:tracking]].nil?
          # Write tracking to spreadsheet
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:tracking_selected]] = TestData.hash[:tracking]
          step 'pause for 1 second'
          # get total cost actual value from UI
          step 'Save order details data' if SdcGlobal.web_app == :orders
          step 'save print form total cost' if SdcGlobal.web_app == :mail
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:total_ship_cost]] = (TestData.hash[:total_ship_cost].to_f * 100).round / 100.0

          expectation_f = (TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:zone]].to_f * 100).round / 100.0
          total_ship_cost_f = (TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:total_ship_cost]].to_f * 100).round / 100.0

          if expectation_f == total_ship_cost_f
            TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:status]] = "Passed"
            TestData.hash[:result_sheet].row(row_number).set_format(TestData.hash[:result_sheet_columns][:status], pass_format)
            TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:results]] = "#{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:zone]]}==#{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:total_ship_cost]]}"
          else
            TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:status]] = "Failed"
            TestData.hash[:result_sheet].row(row_number).set_format(TestData.hash[:result_sheet_columns][:status], fail_format)
            TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:results]] = "Expected #{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:zone]]}, Got #{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:total_ship_cost]]}"
          end
          # SdcLogger.info "#{"#" * 10} "
          # SdcLogger.info "#{"#" * 10} Weight: #{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:weight]]}"
           SdcLogger.info "Weight: #{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:weight]]}"
          # SdcLogger.info "#{"#" * 10} Selected Service: #{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:service_selected]]}"
           SdcLogger.info "Selected Service: #{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:service_selected]]}"
          # SdcLogger.info "#{"#" * 10} Ship-To Address: #{TestData.hash[:address]}" if SdcGlobal.web_app == :mail
           SdcLogger.info "Ship-To Address: #{TestData.hash[:address]}" if SdcGlobal.web_app == :mail
          # SdcLogger.info "#{"#" * 10} Ship-To Address: #{TestData.hash[:full_name]}, #{TestData.hash[:street_address]}, #{TestData.hash[:city]}, #{TestData.hash[:state]}, #{TestData.hash[:zip]}" if SdcGlobal.web_app == :orders
          SdcLogger.info "Ship-To Address: #{TestData.hash[:full_name]}, #{TestData.hash[:street_address]}, #{TestData.hash[:city]}, #{TestData.hash[:state]}, #{TestData.hash[:zip]}" if SdcGlobal.web_app == :orders
          # SdcLogger.info "#{"#" * 10} #{"*" * 5} Test #{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:status]] } - Expected #{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:zone]]}, Got #{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:total_ship_cost]]} #{"*" * 5}"
          SdcLogger.info "Test #{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:status]] } - Expected #{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:zone]]}, Got #{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:total_ship_cost]]} #{"*" * 5}"
          # SdcLogger.info "#{"#" * 10} "
        end

      end
    rescue StandardError => e
      SdcLogger.info e.message
      SdcLogger.info e.backtrace.join("\n")
      TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:error_msg]] = "Zone #{zone} - Row #{row_number}: #{e.message}"
    end
  end

  #if (Time.now - TestData.store[:starting_time]) > TestData.store[:max_time]
   # step "expect orders grid pounds is correct"
  #end

  result_sheet = param_sheet.gsub(/\s+/, "")
  @result_filename = "#{data_for(:rates_test, {})['results_dir']}\\#{result_sheet}_#{SdcGlobal.web_app.downcase}_#{ENV['URL'].downcase}_Zone_#{zone}_#{Time.now.strftime("%Y.%m.%d.%H.%M")}.xls"
  TestData.hash[:result_file].write @result_filename
  TestData.hash[:result_sheet].each_with_index do |row, row_number|
    begin
      if row_number > 0
        if row[TestData.hash[:result_sheet_columns][:status]].casecmp("failed") == 0 || (row[TestData.hash[:result_sheet_columns][:status]].casecmp("passed") != 0 && !row[TestData.hash[:result_sheet_columns][:error_msg]].nil?)
          @failed_test_count += 1
          SdcLogger.info "Zone #{zone} - Row #{row_number} Failed"
        end
      end
    end
  end
  # SdcLogger.info "#{"*" * 80}"
  # SdcLogger.info "#{"*" * 80}"
  # SdcLogger.info "Number of Failed Tests: #{@failed_test_count}"
  # SdcLogger.info "Number of Failed Tests: #{@failed_test_count}"
  # SdcLogger.info "Number of Failed Tests: #{@failed_test_count}"
  # SdcLogger.info "Number of Failed Tests: #{@failed_test_count}"
  # SdcLogger.info "Number of Failed Tests: #{@failed_test_count}"
  # SdcLogger.info "Number of Failed Tests: #{@failed_test_count}"
  # SdcLogger.info "#{"*" * 80}"
  # SdcLogger.info "#{"*" * 80}"
  SdcLogger.info "Number of Failed Tests: #{@failed_test_count}"
end


Then /^Rates: Number of failed test should be less than (\d+)$/ do |count|
  SdcLogger.info "#{"*" * 80}"
  SdcLogger.info "Rates: Number of failed test should be less than #{count}"
  count = count.to_i
  # SdcLogger.info "Number of Failed Tests: #{@failed_test_count}"
  # SdcLogger.info "Number of Failed Tests: #{@failed_test_count}"
  # SdcLogger.info "Number of Failed Tests: #{@failed_test_count}"
  # SdcLogger.info "Number of Failed Tests: #{@failed_test_count}"
  # SdcLogger.info "Number of Failed Tests: #{@failed_test_count}"
  # SdcLogger.info "Number of Failed Tests: #{@failed_test_count}"
  SdcLogger.info "Number of Failed Tests: #{@failed_test_count}"
  expect(@failed_test_count).to be < count
  #SdcLogger.info "#{"*" * 80}"
end
