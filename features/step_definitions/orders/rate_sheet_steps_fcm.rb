Then /^[Rr]un rate test FCM Package$/ do
  param_sheet=data_for(:rates_test, {})['rates_fcm_package']
  step "run rate sheet #{param_sheet}"
end

Then /^[Rr]un rate sheet (.*)$/ do |param_sheet|
  zone=1

  #TestData.store[:starting_time]=Time.now
  #TestData.store[:max_time]=60 #seconds or 4 min

  TestData.store[:result_file]=Spreadsheet::Workbook.new
  TestData.store[:result_sheet]=TestData.store[:result_file].create_worksheet

  @rate_sheet=@rate_file.worksheet param_sheet
  @rate_sheet.should_not be nil

  # Set result sheet name to parameter sheet name
  TestData.store[:result_sheet].name=param_sheet

  @rate_sheet_columns={}
  TestData.store[:result_sheet_columns]={}
  TestData.store[:result_sheet_column_offset]=1

  # map out parameter sheet column location
  @rate_sheet_header=@rate_sheet.row(0)
  #result sheet columns
  @bold=Spreadsheet::Format.new(:weight => :bold)

  @rate_sheet_header.each_with_index do |column_name, row_number|
    if column_name=='weight_oz'
      @rate_sheet_columns[:weight_oz]=row_number
      TestData.store[:result_sheet_columns][:weight_oz]=row_number
      TestData.store[:result_sheet].row(0)[row_number]='weight_oz'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    #AB_ORDERSAUTO_3580 - changes to order of columns. Column=Row_number, not Row_number minus offset
    if column_name=='zone1'
      @rate_sheet_columns[:zone1]=row_number
      TestData.store[:result_sheet_columns][:zone]=row_number
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:zone]]='zone1'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='service'
      @rate_sheet_columns[:service]=row_number
      TestData.store[:result_sheet_columns][:service]=row_number
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:service]]='service'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='tracking'
      @rate_sheet_columns[:tracking]=row_number
      TestData.store[:result_sheet_columns][:tracking]=row_number
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:tracking]]='tracking'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='execution_date'
      @rate_sheet_columns[:execution_date]=row_number
      TestData.store[:result_sheet_columns][:execution_date]=row_number
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:execution_date]]='execution_date'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='username'
      @rate_sheet_columns[:username]=row_number
      TestData.store[:result_sheet_columns][:username]=row_number
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:username]]='username'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='ship_from'
      @rate_sheet_columns[:ship_from]=row_number
      TestData.store[:result_sheet_columns][:ship_from]=row_number
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:ship_from]]='ship_from'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='ship_to_domestic'
      @rate_sheet_columns[:ship_to_domestic]=row_number
      TestData.store[:result_sheet_columns][:ship_to_domestic]=row_number
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:ship_to_domestic]]='ship_to_domestic'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='weight'
      @rate_sheet_columns[:weight]=row_number
      TestData.store[:result_sheet_columns][:weight]=row_number
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:weight]]='weight'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='service_selected'
      @rate_sheet_columns[:service_selected]=row_number
      TestData.store[:result_sheet_columns][:service_selected]=row_number
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:service_selected]]='service_selected'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='tracking_selected'
      @rate_sheet_columns[:tracking_selected]=row_number
      TestData.store[:result_sheet_columns][:tracking_selected]=row_number
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:tracking_selected]]='tracking_selected'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='total_ship_cost'
      @rate_sheet_columns[:total_ship_cost]=row_number
      TestData.store[:result_sheet_columns][:total_ship_cost]=row_number
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:total_ship_cost]]='total_ship_cost'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='results'
      @rate_sheet_columns[:results]=row_number
      TestData.store[:result_sheet_columns][:results]=row_number
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:results]]='results'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='status'
      @rate_sheet_columns[:status]=row_number
      TestData.store[:result_sheet_columns][:status]=row_number
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:status]]='status'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='error_msg'
      @rate_sheet_columns[:error_msg]=row_number
      TestData.store[:result_sheet_columns][:error_msg]=row_number
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:error_msg]]='error_msg'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
  end

  # Verify all columns exists in parameter sheet
  missing_column=false
  # noinspection RubyScope
  if @rate_sheet_columns[:weight_oz].nil?
    missing_column=true
    error_msg="Column weight_oz does not exist in parameter sheet"
  elsif @rate_sheet_columns[:zone1].nil?
    missing_column=true
    error_msg="Column zone1 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:service].nil?
    missing_column=true
    error_msg="Column service does not exist in parameter sheet"
  elsif @rate_sheet_columns[:tracking].nil?
    missing_column=true
    error_msg="Column tracking does not exist in parameter sheet"
  elsif @rate_sheet_columns[:execution_date].nil?
    missing_column=true
    error_msg="Column execution_date does not exist in parameter sheet"
  elsif @rate_sheet_columns[:username].nil?
    missing_column=true
    error_msg="Column username does not exist in parameter sheet"
  elsif @rate_sheet_columns[:execution_date].nil?
    missing_column=true
    error_msg="Column execution_date does not exist in parameter sheet"
  elsif @rate_sheet_columns[:ship_from].nil?
    missing_column=true
    error_msg="Column ship_from does not exist in parameter sheet"
  elsif @rate_sheet_columns[:ship_to_domestic].nil?
    missing_column=true
    error_msg="Column ship_to_domestic does not exist in parameter sheet"
  elsif @rate_sheet_columns[:weight].nil?
    missing_column=true
    error_msg="Column weight does not exist in parameter sheet"
  elsif @rate_sheet_columns[:service_selected].nil?
    missing_column=true
    error_msg="Column service_selected does not exist in parameter sheet"
  elsif @rate_sheet_columns[:tracking_selected].nil?
    missing_column=true
    error_msg="Column tracking_selected does not exist in parameter sheet"
  elsif @rate_sheet_columns[:total_ship_cost].nil?
    missing_column=true
    error_msg="Column total_ship_cost does not exist in parameter sheet"
  elsif @rate_sheet_columns[:results].nil?
    missing_column=true
    error_msg="Column results does not exist in parameter sheet"
  elsif @rate_sheet_columns[:status].nil?
    missing_column=true
    error_msg="Column status does not exist in parameter sheet"
  elsif @rate_sheet_columns[:error_msg].nil?
    missing_column=true
    error_msg="Column error_msg does not exist in parameter sheet"
  end

  expect("Check your parameter sheet: #{@rate_file_loc}").to eql error_msg if missing_column

  zone.should_not be nil
  zone_column=@rate_sheet_columns[:zone1]
  format=Spreadsheet::Format.new :color=> :blue, :pattern_fg_color => :yellow, :pattern => 1
  fail_format=Spreadsheet::Format.new :color=> :red, :weight => :bold
  pass_format=Spreadsheet::Format.new :color=> :green, :weight => :bold
  # Set weight and services
  @rate_sheet.each_with_index do |row, row_number|
    @row=row
    TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:zone]]="zone#{zone}"
    begin
      if row_number > 0
        SdcTest.log.step "#{"#"*80} Rate Sheet: #{param_sheet}: Zone #{zone} - Row #{row_number}"

        # Set address to proper zone
        step "set Order Details Ship-To to random address between zone 1 and 4"  if @modal_param.web_app==:orders
        step "set Print form Mail-To to a random address in zone 1 through 4" if @modal_param.web_app==:mail
        step "save Print Form Mail From" if @modal_param.web_app==:mail
        # spreadsheet price for zone

        if row[zone_column]==nil
          SdcTest.log.step "#{"#"*10} "
          SdcTest.log.step "#{"#"*10} "
          SdcTest.log.step "#{"#"*10} Test Row #{row_number} Skipped. No rates found on sheet."
          SdcTest.log.step "#{"#"*10} "
          SdcTest.log.step "#{"#"*10} "
          SdcTest.log.step "#{"#"*80} "
          TestData.store[:result_sheet].row(row_number).set_format(TestData.store[:result_sheet_columns][:zone], format)
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:weight_oz]]=row[@rate_sheet_columns[:weight_oz]]
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:zone]]=row[zone_column]
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:username]]="--"
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:ship_from]]="--"
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:ship_to_domestic]]="--"
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:weight]]="--"
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:service]]="--"
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:execution_date]]="--"
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:service_selected]]="--"
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:tracking_selected]]="--"
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:total_ship_cost]]="--"
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:status]]="--"
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:results]]="--"
        else
          price=(row[zone_column].to_f * 100).round / 100.0
          # set expectation column for this row to zone price
          TestData.store[:result_sheet].row(row_number).set_format(TestData.store[:result_sheet_columns][:zone], format)
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:zone]]= price
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:username]]=TestData.store[:username]
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:ship_from]]=TestData.store[:ship_from]
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:ship_to_domestic]]=TestData.store[:ship_to_domestic]  if @modal_param.web_app==:orders
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:ship_to_domestic]]=TestData.store[:address]  if @modal_param.web_app==:mail

          # Set weight to 0
          step "set Order Details Pounds to 0" if @modal_param.web_app==:orders
          step "set Order Details Ounces to 0" if @modal_param.web_app==:orders

          step "set Print form Pounds to 0" if @modal_param.web_app==:mail
          step "set Print form Ounces to 0" if @modal_param.web_app==:mail

          # Set weight per spreadsheet

          weight_oz=row[@rate_sheet_columns[:weight_oz]]
          SdcTest.log.step "#{"#"*10} "
          SdcTest.log.step "#{"#"*10} Weight: #{weight_oz}"
          SdcTest.log.step "#{"#"*10} Price: #{TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:zone]]}"
          SdcTest.log.step "#{"#"*10} "
          SdcTest.log.step "#{"#"*50}"


          weight_oz=weight_oz.to_i
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:weight_oz]]=weight_oz
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:weight]]="#{weight_oz} oz."
          step "set Order Details Ounces to #{weight_oz}"  if @modal_param.web_app==:orders
          step "set Print form Ounces to #{weight_oz}"  if @modal_param.web_app==:mail

          sleep(0.025)

          # Set Service
          row[@rate_sheet_columns[:service]].should_not be nil
          service=row[@rate_sheet_columns[:service]]
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:service]]=service

          # record execution time as time service was selected.
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:execution_date]]=Time.now.strftime("%b %d, %Y %H:%M")

          step "set Order Details service to #{service}" if @modal_param.web_app==:orders
          step "select Print form service #{service}" if @modal_param.web_app==:mail

          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:service_selected]]=TestData.store[:service]

          # Set Tracking
          begin
            step "set Order Details Tracking to #{row[@rate_sheet_columns[:tracking]]}"  if @modal_param.web_app==:orders
          end unless row[@rate_sheet_columns[:tracking]].nil?
          # Write tracking to spreadsheet
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:tracking_selected]]=TestData.store[:tracking]
          sleep(0.525)
          # get total cost actual value from UI
          step "Save Order Details data" if @modal_param.web_app==:orders
          step "save Print Form Total Cost" if @modal_param.web_app==:mail
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:total_ship_cost]]=(TestData.store[:total_ship_cost].to_f * 100).round / 100.0

          # Set weight to 0
          if @modal_param.web_app==:mail
            step "set Print form Pounds to 0"
            step "set Print form Ounces to 0"
          elsif @modal_param.web_app==:orders
            step "set Order Details Pounds to 0"
            step "set Order Details Ounces to 0"
          end
          expectation_f=(TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:zone]].to_f * 100).round / 100.0
          total_ship_cost_f=(TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:total_ship_cost]].to_f * 100).round / 100.0

          if expectation_f==total_ship_cost_f
            TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:status]]="Passed"
            TestData.store[:result_sheet].row(row_number).set_format(TestData.store[:result_sheet_columns][:status], pass_format)
            TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:results]]="#{TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:zone]]}==#{TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:total_ship_cost]]}"
          else
            TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:status]]="Failed"
            TestData.store[:result_sheet].row(row_number).set_format(TestData.store[:result_sheet_columns][:status], fail_format)
            TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:results]]="Expected #{TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:zone]]}, Got #{TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:total_ship_cost]]}"
          end
          SdcTest.log.step "#{"#"*10} "
          SdcTest.log.step "#{"#"*10} Weight: #{TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:weight]]}"
          SdcTest.log.step "#{"#"*10} Selected Service: #{TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:service_selected]]}"
          SdcTest.log.step "#{"#"*10} Ship-To Address: #{TestData.store[:address]}" if @modal_param.web_app==:mail
          SdcTest.log.step "#{"#"*10} Ship-To Address: #{TestData.store[:full_name]}, #{TestData.store[:street_address]}, #{TestData.store[:city]}, #{TestData.store[:state]}, #{TestData.store[:zip]}" if @modal_param.web_app==:orders
          SdcTest.log.step "#{"#"*10} #{"*"*5} Test #{TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:status]] } - Expected #{TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:zone]]}, Got #{TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:total_ship_cost]]} #{"*"*5}"
          SdcTest.log.step "#{"#"*10} "
        end

      end
    rescue Exception => e
      SdcTest.log.step e.message
      SdcTest.log.step e.backtrace.join("\n")
      TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:error_msg]]="Zone #{zone} - Row #{row_number}: #{e.message}"
    end
  end

  #if (Time.now - TestData.store[:starting_time]) > TestData.store[:max_time]
   # step "expect Orders Grid Pounds is correct"
  #end

  result_sheet=param_sheet.gsub(/\s+/, "")
  @result_filename="#{data_for(:rates_test, {})['results_dir']}\\#{result_sheet}_#{ENV['WEB_APP'].downcase}_#{ENV['URL'].downcase}_Zone_#{zone}_#{Time.now.strftime("%Y.%m.%d.%H.%M")}.xls"
  TestData.store[:result_file].write @result_filename
  TestData.store[:result_sheet].each_with_index do |row, row_number|
    begin
      if row_number > 0
        if row[TestData.store[:result_sheet_columns][:status]].casecmp("failed")==0 || (row[TestData.store[:result_sheet_columns][:status]].casecmp("passed")!=0 && !row[TestData.store[:result_sheet_columns][:error_msg]].nil?)
          @failed_test_count +=1
          SdcTest.log.step "Zone #{zone} - Row #{row_number} Failed"
        end
      end
    end
  end
  SdcTest.log.step "#{"*"*80}"
  SdcTest.log.step "#{"*"*80}"
  SdcTest.log.step "Number of Failed Tests: #{@failed_test_count}"
  SdcTest.log.step "Number of Failed Tests: #{@failed_test_count}"
  SdcTest.log.step "Number of Failed Tests: #{@failed_test_count}"
  SdcTest.log.step "Number of Failed Tests: #{@failed_test_count}"
  SdcTest.log.step "Number of Failed Tests: #{@failed_test_count}"
  SdcTest.log.step "Number of Failed Tests: #{@failed_test_count}"
  SdcTest.log.step "#{"*"*80}"
  SdcTest.log.step "#{"*"*80}"
end


Then /^Rates: Number of failed test should be less than (\d+)$/ do |count|
  SdcTest.log.step "#{"*"*80}"
  SdcTest.log.step "Rates: Number of failed test should be less than #{count}"
  count=count.to_i
  SdcTest.log.step "Number of Failed Tests: #{@failed_test_count}"
  SdcTest.log.step "Number of Failed Tests: #{@failed_test_count}"
  SdcTest.log.step "Number of Failed Tests: #{@failed_test_count}"
  SdcTest.log.step "Number of Failed Tests: #{@failed_test_count}"
  SdcTest.log.step "Number of Failed Tests: #{@failed_test_count}"
  SdcTest.log.step "Number of Failed Tests: #{@failed_test_count}"
  expect(@failed_test_count).to be < count
  SdcTest.log.step "#{"*"*80}"
end
