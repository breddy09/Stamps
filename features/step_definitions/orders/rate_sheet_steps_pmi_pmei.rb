Then /^run rate test PMI Comm Base in country price group (\d+)$/ do |group|
  param_sheet = data_for(:rates_test, {})['rates_pmi_comm_base']
  step "run rates sheet #{param_sheet} in country price group #{group}"
end

Then /^run rate test PMI Comm Plus in country price group (\d+)$/ do |group|
  param_sheet = data_for(:rates_test, {})['rates_pmi_comm_plus']
  step "run rates sheet #{param_sheet} in country price group #{group}"
end

Then /^run rate test PMEI Comm Base in country price group (\d+)$/ do |group|
  param_sheet = data_for(:rates_test, {})['rates_pmei_comm_base']
  step "run rates sheet #{param_sheet} in country price group #{group}"
end

Then /^run rate test PMEI Comm Plus in country price group (\d+)$/ do |group|
  param_sheet = data_for(:rates_test, {})['rates_pmei_comm_plus']
  step "run rates sheet #{param_sheet} in country price group #{group}"
end

Then /^run rates sheet (.*) in country price group (\d+)$/ do |param_sheet, group|
  group = group.to_i

  TestData.hash[:result_file] = Spreadsheet::Workbook.new
  TestData.hash[:result_sheet] = TestData.hash[:result_file].create_worksheet

  @rate_sheet = @rate_file.worksheet param_sheet
  @rate_sheet.should_not be nil

  # Set result sheet name to parameter sheet name
  TestData.hash[:result_sheet].name = param_sheet

  @rate_sheet_columns = {}
  TestData.hash[:result_sheet_columns] = {}
  TestData.hash[:result_sheet_column_offset] = 8

  # map out parameter sheet column location
  @rate_sheet_header = @rate_sheet.row(0)
  #result sheet columns
  @bold = Spreadsheet::Format.new(:weight => :bold)

  @rate_sheet_header.each_with_index do |column_name, row_number|

    case column_name
    when 'weight_lb'
          @rate_sheet_columns[:weight_lb] = row_number
          (TestData.hash[:result_sheet_columns])[:weight_lb] = row_number
          TestData.hash[:result_sheet].row(0)[row_number] = 'weight_lb'
          TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'group1'
      @rate_sheet_columns[:group1] = row_number
      TestData.hash[:result_sheet_columns][:group] = 1
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:group]] = 'group1'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'group2'
      @rate_sheet_columns[:group2] = row_number
      TestData.hash[:result_sheet_columns][:group] = 1
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:group]] = 'group2'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'group3'
      @rate_sheet_columns[:group3] = row_number
      TestData.hash[:result_sheet_columns][:group] = 1
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:group]] = 'group3'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'group4'
      @rate_sheet_columns[:group4] = row_number
      TestData.hash[:result_sheet_columns][:group] = 1
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:group]] = 'group4'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'group5'
      @rate_sheet_columns[:group5] = row_number
      TestData.hash[:result_sheet_columns][:group] = 1
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:group]] = 'group5'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'group6'
      @rate_sheet_columns[:group6] = row_number
      TestData.hash[:result_sheet_columns][:group] = 1
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:group]] = 'group6'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'group7'
      @rate_sheet_columns[:group7] = row_number
      TestData.hash[:result_sheet_columns][:group] = 1
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:group]] = 'group7'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'group8'
      @rate_sheet_columns[:group8] = row_number
      TestData.hash[:result_sheet_columns][:group] = 1
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:group]] = 'group8'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'group9'
      @rate_sheet_columns[:group9] = row_number
      TestData.hash[:result_sheet_columns][:group] = 1
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:group]] = 'group9'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'group10'
      @rate_sheet_columns[:group10] = row_number
      TestData.hash[:result_sheet_columns][:group] = 1
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:group]] = 'group10'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'group11'
      @rate_sheet_columns[:group11] = row_number
      TestData.hash[:result_sheet_columns][:group] = 1
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:group]] = 'group11'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'group12'
      @rate_sheet_columns[:group12] = row_number
      TestData.hash[:result_sheet_columns][:group] = 1
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:group]] = 'group12'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'group13'
      @rate_sheet_columns[:group13] = row_number
      TestData.hash[:result_sheet_columns][:group] = 1
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:group]] = 'group13'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'group14'
      @rate_sheet_columns[:group14] = row_number
      TestData.hash[:result_sheet_columns][:group] = 1
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:group]] = 'group14'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'group15'
      @rate_sheet_columns[:group15] = row_number
      TestData.hash[:result_sheet_columns][:group] = 1
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:group]] = 'group15'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'group16'
      @rate_sheet_columns[:group16] = row_number
      TestData.hash[:result_sheet_columns][:group] = 1
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:group]] = 'group16'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'group17'
      @rate_sheet_columns[:group17] = row_number
      TestData.hash[:result_sheet_columns][:group] = 1
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:group]] = 'group17'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'service'
      @rate_sheet_columns[:service] = row_number
      TestData.hash[:result_sheet_columns][:service] = row_number - TestData.hash[:result_sheet_column_offset]
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:service]] = 'service'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'execution_date'
      @rate_sheet_columns[:execution_date] = row_number
      TestData.hash[:result_sheet_columns][:execution_date] = row_number - TestData.hash[:result_sheet_column_offset]
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:execution_date]] = 'execution_date'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'username'
      @rate_sheet_columns[:username] = row_number
      TestData.hash[:result_sheet_columns][:username] = row_number - TestData.hash[:result_sheet_column_offset]
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:username]] = 'username'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'ship_to_country'
      @rate_sheet_columns[:ship_to_country] = row_number
      TestData.hash[:result_sheet_columns][:ship_to_country] = row_number - TestData.hash[:result_sheet_column_offset]
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:ship_to_country]] = 'ship_to_country'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'weight'
      @rate_sheet_columns[:weight] = row_number
      TestData.hash[:result_sheet_columns][:weight] = row_number - TestData.hash[:result_sheet_column_offset]
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:weight]] = 'weight'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'service_selected'
      @rate_sheet_columns[:service_selected] = row_number
      TestData.hash[:result_sheet_columns][:service_selected] = row_number - TestData.hash[:result_sheet_column_offset]
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:service_selected]] = 'service_selected'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'total_ship_cost'
      @rate_sheet_columns[:total_ship_cost] = row_number
      TestData.hash[:result_sheet_columns][:total_ship_cost] = row_number - TestData.hash[:result_sheet_column_offset]
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:total_ship_cost]] = 'total_ship_cost'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'results'
      @rate_sheet_columns[:results] = row_number
      TestData.hash[:result_sheet_columns][:results] = row_number - TestData.hash[:result_sheet_column_offset]
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:results]] = 'results'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'status'
      @rate_sheet_columns[:status] = row_number
      TestData.hash[:result_sheet_columns][:status] = row_number - TestData.hash[:result_sheet_column_offset]
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:status]] = 'status'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)

    when 'error_msg'
      @rate_sheet_columns[:error_msg] = row_number
      TestData.hash[:result_sheet_columns][:error_msg] = row_number - TestData.hash[:result_sheet_column_offset]
      TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:error_msg]] = 'error_msg'
      TestData.hash[:result_sheet].row(0).set_format(row_number, @bold)
    end
  end



  # Verify all columns exists in parameter sheet
  missing_column = false
  # noinspection RubyScope
  if @rate_sheet_columns[:weight_lb].nil?
    missing_column = true
    error_msg = "Column weight_lb does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group1].nil?
    missing_column = true
    error_msg = "Column group1 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group2].nil?
    missing_column = true
    error_msg = "Column group2 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group3].nil?
    missing_column = true
    error_msg = "Column group3 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group4].nil?
    missing_column = true
    error_msg = "Column group4 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group5].nil?
    missing_column = true
    error_msg = "Column group5 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group6].nil?
    missing_column = true
    error_msg = "Column group6 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group7].nil?
    missing_column = true
    error_msg = "Column group7 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group8].nil?
    missing_column = true
    error_msg = "Column group8 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group9].nil?
    missing_column = true
    error_msg = "Column group9 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group10].nil?
    missing_column = true
    error_msg = "Column group10 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group11].nil?
    missing_column = true
    error_msg = "Column group11 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group12].nil?
    missing_column = true
    error_msg = "Column group12 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group13].nil?
    missing_column = true
    error_msg = "Column group13 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group14].nil?
    missing_column = true
    error_msg = "Column group14 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group15].nil?
    missing_column = true
    error_msg = "Column group15 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group16].nil?
    missing_column = true
    error_msg = "Column group16 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group17].nil?
    missing_column = true
    error_msg = "Column group17 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:service].nil?
    missing_column = true
    error_msg = "Column service does not exist in parameter sheet"
  elsif @rate_sheet_columns[:execution_date].nil?
    missing_column = true
    error_msg = "Column execution_date does not exist in parameter sheet"
  elsif @rate_sheet_columns[:username].nil?
    missing_column = true
    error_msg = "Column username does not exist in parameter sheet"
  elsif @rate_sheet_columns[:execution_date].nil?
    missing_column = true
    error_msg = "Column execution_date does not exist in parameter sheet"
  elsif @rate_sheet_columns[:ship_to_country].nil?
    missing_column = true
    error_msg = "Column ship_to_country does not exist in parameter sheet"
  elsif @rate_sheet_columns[:weight].nil?
    missing_column = true
    error_msg = "Column weight does not exist in parameter sheet"
  elsif @rate_sheet_columns[:service_selected].nil?
    missing_column = true
    error_msg = "Column service_selected does not exist in parameter sheet"
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

  # parameter group is set in step
  # where xxx is a number between 1-17
  group.should_not be nil
  expect(group).to be_between(1, 17).inclusive
  group_column = case group
                   when 1
                     @rate_sheet_columns[:group1]
                   when 2
                     @rate_sheet_columns[:group2]
                   when 3
                     @rate_sheet_columns[:group3]
                   when 4
                     @rate_sheet_columns[:group4]
                   when 5
                     @rate_sheet_columns[:group5]
                   when 6
                     @rate_sheet_columns[:group6]
                   when 7
                     @rate_sheet_columns[:group7]
                   when 8
                     @rate_sheet_columns[:group8]
                   when 9
                     @rate_sheet_columns[:group9]
                   when 10
                     @rate_sheet_columns[:group10]
                   when 11
                     @rate_sheet_columns[:group11]
                   when 12
                     @rate_sheet_columns[:group12]
                   when 13
                     @rate_sheet_columns[:group13]
                   when 14
                     @rate_sheet_columns[:group14]
                   when 15
                     @rate_sheet_columns[:group15]
                   when 16
                     @rate_sheet_columns[:group16]
                   when 17
                     @rate_sheet_columns[:group17]
                   else
                     # ignore
                 end

  #TestData.store[:start_time]=Time.now
  #TestData.store[:max_time]=240 #seconds or 4 min

  format = Spreadsheet::Format.new :color => :blue, :pattern_fg_color => :yellow, :pattern => 1
  fail_format = Spreadsheet::Format.new :color => :red, :weight => :bold
  pass_format = Spreadsheet::Format.new :color => :green, :weight => :bold

  # Workaround for selecting international countries. We need to switch domestic form to international
  step 'set order details domestic ship-to country to Mexico' if SdcGlobal.web_app == :orders

  # Set weight and services
  @rate_sheet.each_with_index do |row, row_number|
    @row = row
    TestData.hash[:result_sheet].row(0)[TestData.hash[:result_sheet_columns][:group]] = "group#{group}"
    begin
      if row_number > 0
        SdcLogger.info "#{"#" * 80} Rate Sheet: #{param_sheet}: Group #{group} - Row #{row_number}"

        #Set weight for country weight limit check
        TestData.hash[:pounds] = (row[@rate_sheet_columns[:weight_lb]]).to_i

        # Set country to proper group
        if row[@rate_sheet_columns[:service]].include?('PMEI')
          if row[@rate_sheet_columns[:service]].include?('Flat Rate') && group < 9
            step "set order details international ship-to country to a random country in PMEI Flat Rate price group #{group}" if SdcGlobal.web_app == :orders
            step "set Print Form Ship-To Country to a random country in PMEI Flat Rate price group #{group}" if SdcGlobal.web_app == :mail
          elsif row[@rate_sheet_columns[:service]].include?('Package')
            step "set order details international ship-to country to a random country in PMEI price group #{group}" if SdcGlobal.web_app == :orders
            step "set Print Form Ship-To Country to a random country in PMEI price group #{group}" if SdcGlobal.web_app == :mail
          end
        elsif row[@rate_sheet_columns[:service]].include?('PMI')
          if row[@rate_sheet_columns[:service]].include?('Flat Rate') && group < 9
            step "set order details international ship-to country to a random country in PMI Flat Rate price group #{group}" if SdcGlobal.web_app == :orders
            step "set Print Form Ship-To Country to a random country in PMI Flat Rate price group #{group}" if SdcGlobal.web_app == :mail
          elsif row[@rate_sheet_columns[:service]].include?('Package')
            step "set order details international ship-to country to a random country in PMI price group #{group}" if SdcGlobal.web_app == :orders
            step "set Print Form Ship-To Country to a random country in PMI price group #{group}" if SdcGlobal.web_app == :mail
          end
        end

        # spreadsheet price for group

        if row[group_column] == nil
          # SdcLogger.info "#{"#" * 10} "
          # SdcLogger.info "#{"#" * 10} "
          # SdcLogger.info "#{"#" * 10} Test Row #{row_number} Skipped. No rates found on sheet."
           SdcLogger.info "Test Row #{row_number} Skipped. No rates found on sheet."
          # SdcLogger.info "#{"#" * 10} "
          # SdcLogger.info "#{"#" * 10} "
          # SdcLogger.info "#{"#" * 80} "
          TestData.hash[:result_sheet].row(row_number).set_format(TestData.hash[:result_sheet_columns][:group], format)
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:weight_lb]] = row[@rate_sheet_columns[:weight_lb]]
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:group]] = row[group_column]
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:username]] = "--"
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:ship_to_country]] = "--"
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:weight]] = "--"
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:service]] = "--"
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:execution_date]] = "--"
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:service_selected]] = "--"
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:total_ship_cost]] = "--"
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:status]] = "--"
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:results]] = "--"
        else
          price = (row[group_column].to_f * 100).round / 100.0
          # set expectation column for this row to group price
          TestData.hash[:result_sheet].row(row_number).set_format(TestData.hash[:result_sheet_columns][:group], format)
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:group]] = price
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:username]] = TestData.hash[:username]
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:ship_to_country]] = TestData.hash[:country]

          # Set weight to 0
          SdcLogger.info "#{"#" * 10} Desired Weight: #{row[@rate_sheet_columns[:weight_lb]]}"
          SdcLogger.info "Desired Weight: #{row[@rate_sheet_columns[:weight_lb]]}"
          if SdcGlobal.web_app == :orders
            step "set order details ounces to 0"
          elsif SdcGlobal.web_app == :mail
            step "set print form ounces to 0"
          end


          # Set weight per spreadsheet
          #row[@rate_sheet_columns[:weight_lb]].should_not be nil
          weight_lb = row[@rate_sheet_columns[:weight_lb]]
          SdcLogger.info "#{"#" * 10} "
          SdcLogger.info "#{"#" * 10} Weight: #{weight_lb}"
          SdcLogger.info "#{"#" * 10} Price: #{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:group]]}"
          SdcLogger.info "#{"#" * 10} "
          SdcLogger.info "#{"#" * 50}"

          if TestHelper.is_whole_number?(weight_lb)
            weight_lb = weight_lb.to_i
            TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:weight_lb]] = weight_lb
            TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:weight]] = "#{weight_lb} lb."
            step "set order details pounds to #{weight_lb}" if SdcGlobal.web_app == :orders
            step "set print form pounds to #{weight_lb} by arrows" if SdcGlobal.web_app == :mail
          else
            step 'set order details pounds to 0'  if SdcGlobal.web_app == :orders
            step 'set print form pounds to 0 by arrows'  if SdcGlobal.web_app == :mail
            weight_oz = Measured::Weight.new(weight_lb, "lb").convert_to("oz").value.to_f
            TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:weight]] = "#{weight_oz} oz."
            TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:weight_lb]] = weight_oz
            step "set order details ounces to #{weight_oz}" if SdcGlobal.web_app == :orders
            step "set print form ounces to #{weight_oz}" if SdcGlobal.web_app == :mail
          end
          sleep(0.025)
          # Set Service
          row[@rate_sheet_columns[:service]].should_not be nil
          service = row[@rate_sheet_columns[:service]]
          SdcLogger.info "#{"#" * 10} Desired Service: #{service}"
          SdcLogger.info "#{"#" * 10} Selected Country: #{TestData.hash[:country]}"
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:service]] = service

          # record execution time as time service was selected.
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:execution_date]] = Time.now.strftime("%b %d, %Y %H:%M")

          step "set order details service to #{service}" if SdcGlobal.web_app == :orders
          step "select print form service #{service}" if SdcGlobal.web_app == :mail
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:service_selected]] = TestData.hash[:service]
          sleep(0.525)

          # get total cost actual value from UI
          step 'save order details data' if SdcGlobal.web_app == :orders
          step "save print form total cost" if SdcGlobal.web_app == :mail
          TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:total_ship_cost]] = (TestData.hash[:total_ship_cost].to_f * 100).round / 100.0

          expectation_f = (TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:group]].to_f * 100).round / 100.0
          total_ship_cost_f = (TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:total_ship_cost]].to_f * 100).round / 100.0

          if expectation_f == total_ship_cost_f
            TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:status]] = "Passed"
            TestData.hash[:result_sheet].row(row_number).set_format(TestData.hash[:result_sheet_columns][:status], pass_format)
            TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:results]] = "#{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:group]]}==#{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:total_ship_cost]]}"
          else
            TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:status]] = "Failed"
            TestData.hash[:result_sheet].row(row_number).set_format(TestData.hash[:result_sheet_columns][:status], fail_format)
            TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:results]] = "Expected #{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:group]]}, Got #{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:total_ship_cost]]}"
          end
          SdcLogger.info "#{"#" * 10} "
          SdcLogger.info "#{"#" * 10} Selected Weight: #{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:weight]]}"
          SdcLogger.info "#{"#" * 10} Selected Service: #{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:service_selected]]}"
          SdcLogger.info "#{"#" * 10} #{"*" * 5} Test #{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:status]] } - Expected #{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:group]]}, Got #{TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:total_ship_cost]]} #{"*" * 5}"
          SdcLogger.info "#{"#" * 10} "
        end

      end
    rescue StandardError => e
      SdcLogger.info e.message
      SdcLogger.info e.backtrace.join("\n")
      TestData.hash[:result_sheet][row_number, TestData.hash[:result_sheet_columns][:error_msg]] = "Group #{group} - Row #{row_number}: #{e.message}"
    end
  end

 # if (Time.now - TestData.store[:start_time] > TestData.store[:max_time])
 #   step "click orders toolbar settings button"
 #   step "In Settings modal, Save"
 # end

  result_sheet = param_sheet.gsub(/\s+/, "")
  @result_filename = "#{data_for(:rates_test, {})['results_dir']}\\#{result_sheet}_#{SdcGlobal.web_app.downcase}_#{ENV['URL'].downcase}_Group_#{group}_#{Time.now.strftime("%Y.%m.%d.%H.%M")}.xls"

  TestData.hash[:result_file].write @result_filename
  TestData.hash[:result_sheet].each_with_index do |row, row_number|
    begin
      if row_number > 0
        if row[TestData.hash[:result_sheet_columns][:status]].casecmp("failed").zero? || (row[TestData.hash[:result_sheet_columns][:status]].casecmp("passed") != 0 && !row[TestData.hash[:result_sheet_columns][:error_msg]].nil?)
          @failed_test_count += 1
          SdcLogger.info "Group #{group} - Row #{row_number} Failed"
        end
      end
    end
  end
  SdcLogger.info "#{"*" * 80}"
  SdcLogger.info "Number of Failed Tests: #{@failed_test_count}"
  SdcLogger.info "#{"*" * 80}"
end
