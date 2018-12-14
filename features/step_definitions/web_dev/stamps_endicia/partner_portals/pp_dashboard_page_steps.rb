
Then /^[Pp]P: [Ee]xpect [Dd]ashboard [Pp]age header exist$/ do
  PartnerPortal.dashboard_page.dashboard_header.wait_until_present(timeout: 10)
  expect(PartnerPortal.dashboard_page.dashboard_header).to be_present, 'Dashboard header DOES NOT exist on dashboard page'
end

Then /^PP: blur out on dashboard page$/ do
  PartnerPortal.dashboard_page.dashboard_header.blur_out
end


Then /^[Pp]P: expect dashboard header on left panel exists$/ do
  expect(PartnerPortal.dashboard_page.panel_dashboard).to be_present 'Dashboard header on left panel  DOES NOT exist on dashboard page'
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard [Pp]age the [Cc]ontract header exists$/ do
  PartnerPortal.dashboard_page.contract_header.wait_until_present(timeout: 5)
  expect(PartnerPortal.dashboard_page.contract_header).to be_present, 'Contract header DOES NOT exist on dashboard page'
end


Then /^[Pp]P: [Ee]xpect [Dd]ashboard [Pp]age the correct contract is being displayed for (?:user|(.*))$/ do |user|
  contract_header= PartnerPortal.dashboard_page.contract_header
  TestData.hash[:contract_display_name_actual] = contract_header.text_value.split(':').last.strip

  step 'establish partner portal db connection'
  TestData.hash[:partner_account_id] = PartnerPortal.common_page.user_table_query(((user.nil?) ? (TestSession.env.usr) :user), 'PartnerAccountId')
  TestData.hash[:contract_display_name] = PartnerPortal.common_page.contract_table_query(TestData.hash[:partner_account_id], 'DisplayName')
  step 'Close partner portal db connection'

  expect(TestData.hash[:contract_display_name]).to eql(TestData.hash[:contract_display_name_actual])
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard [Pp]age the Last updated on: field to be present$/ do
  expect(PartnerPortal.dashboard_page.contract_last_updated_on).to be_present, 'Last updated on DOES NOT exist on dashboard page'
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard [Pp]age the Last updated on: field to be not present$/ do
  expect(PartnerPortal.dashboard_page.contract_last_updated_on).not_to be_present, 'Last updated IS PRESENT on dashboard page'
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard [Pp]age the Last updated on: field displays correct date for (?:user|(.*))$/ do |user|
  last_update_on= PartnerPortal.dashboard_page.contract_last_updated_on
  actual_date = last_update_on.text_value.split(':').last.strip
  TestData.hash[:last_update_on_actual]=  Date.strptime(actual_date, '%m/%d/%Y')

  step 'establish partner portal db connection'
  TestData.hash[:partner_account_id] = PartnerPortal.common_page.user_table_query(((user.nil?) ? (TestSession.env.usr) :user), 'PartnerAccountId')
  TestData.hash[:last_update_on] = PartnerPortal.common_page.contract_table_query(TestData.hash[:partner_account_id], 'DateLastUpdated')
  step 'Close partner portal db connection'

  expect(TestData.hash[:last_update_on].to_date).to eql(TestData.hash[:last_update_on_actual])
end

Then /^[Pp]P: expect [Dd]ashboard page the Preferred Rates Qualified Transactions USD Chart to exist$/ do
  expect(PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_usd_chart).to be_present, 'Preferred Rates Qualified Transactions USD(S) chart DOES NOT exist on dashboard page'
end


Then /^[Pp]P: expect [Dd]ashboard page the Preferred Rates Qualified Transactions USD Chart title to be (.*)$/ do |str|
  expect(PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_usd_chart_title.text_value.strip). to eql(str)
end

Then /^[Pp]P: expect [Dd]ashboard page the Preferred Rates Qualified Transactions USD Chart Y-axis label to be (.*)$/ do |str|
  expect(PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_usd_y_axis.text_value.strip). to eql(str)
end

Then /^[Pp]P: expect [Dd]ashboard page the Preferred Rates Qualified Transactions USD Chart has X-axis to be labeled with month abbreviations$/ do |str|
  actual_month = str.split(',')
  expected_month = PartnerPortal.dashboard_page.x_axis_month_abbreviations
  expect(expected_month[0]). to eql( actual_month)
end

Then /^[Pp]P: expect [Dd]ashboard page the Preferred Rates Qualified Transactions Chart USD legends to exist$/ do
  expect(PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_usd_chart_legends).to be_present, 'Preferred Rates Qualified Transactions Chart USD legends DOES NOT exist on dashboard page'
end

Then /^[Pp]P: expect [Dd]ashboard page the Preferred Rates Qualified Transactions Chart USD previous year legend to be last year date$/ do
  last_update_on = PartnerPortal.dashboard_page.contract_last_updated_on
  last_update_date = Date.strptime(last_update_on.text_value.split(':').last.strip, '%m/%d/%Y')
  previous_year = last_update_date - 1.year
  legends = PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_usd_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  expect(legends[0].to_i).to eql(previous_year.year)
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the Preferred Rates Qualified Transactions Chart USD current year legends to be current year$/ do
  last_update_on = PartnerPortal.dashboard_page.contract_last_updated_on
  last_update_date = Date.strptime(last_update_on.text_value.split(':').last.strip, '%m/%d/%Y')
  legends  = PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_usd_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  expect(legends[1].to_i).to eql(last_update_date.year)
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the Preferred Rates Qualified Transactions Chart USD Current Month legends to be (.*)$/ do |str|
  legends  = PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_usd_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  current_month = [] << legends[2] + " " + legends[3]
  expect(current_month[0].to_s).to eql(str)
end

Then /^PP: expect dashboard page the Preferred Rates Qualified Transactions # Chart to exist$/ do
  expect(PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_packages_chart).to be_present, 'Preferred Rates Qualified Transactions # of packages chart DOES NOT exist on dashboard page'
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the Preferred Rates Qualified Transactions # Chart title to be (.*)$/ do |str|
  expect(PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_packages_chart_title.text_value.strip). to eql(str)
end

Then /^[Pp]P: expect [Dd]ashboard page the Preferred Rates Qualified Transactions # Chart Y-axis label to be (.*)$/ do |str|
  expect(PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_packages_chart_y_axis.text_value.strip). to eql(str)
end

Then /^[Pp]P: expect [Dd]ashboard page the Preferred Rates Qualified Transactions # Chart has X-axis to be labeled with month abbreviations$/ do |str|
  actual_month = str.split(',')
  expected_month = PartnerPortal.dashboard_page.x_axis_month_abbreviations
  expect(expected_month[1]). to eql( actual_month)
end

Then /^[Pp]P: expect [Dd]ashboard page the Preferred Rates Qualified Transactions # legends to exist$/ do
  expect(PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_packages_chart_legends).to be_present, 'Preferred Rates Qualified Transactions # Chart legends DOES NOT exist on dashboard page'
end

Then /^[Pp]P: expect [Dd]ashboard page the Preferred Rates Qualified Transactions # previous year legend to be last year date$/ do
  last_update_on = PartnerPortal.dashboard_page.contract_last_updated_on
  last_update_date = Date.strptime(last_update_on.text_value.split(':').last.strip, '%m/%d/%Y')
  previous_year = last_update_date - 1.year
  legends = PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_packages_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  expect(legends[0].to_i).to eql(previous_year.year)
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the Preferred Rates Qualified Transactions # current year legends to be current year$/ do
  last_update_on = PartnerPortal.dashboard_page.contract_last_updated_on
  last_update_date = Date.strptime(last_update_on.text_value.split(':').last.strip, '%m/%d/%Y')
  legends  = PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_packages_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  expect(legends[1].to_i).to eql(last_update_date.year)
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the Preferred Rates Qualified Transactions # Current Month legends to be (.*)$/ do |str|
  legends  = PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_packages_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  current_month = [] << legends[2] + " " + legends[3]
  expect(current_month[0].to_s).to eql(str)
end

Then /^[Pp]P: expect [Dd]ashboard page the Active Customers Chart to exist$/ do
  expect(PartnerPortal.dashboard_page.active_customers_customers_chart).to be_present, 'Active Customers chart DOES NOT exist on dashboard page'
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the Active Customers Chart title to be (.*)$/ do |str|
  expect(PartnerPortal.dashboard_page.active_customers_customers_chart_title.text_value.strip). to eql(str)
end


Then /^[Pp]P: expect [Dd]ashboard page the Active Customers Chart Y-axis label to be (.*)$/ do |str|
  expect(PartnerPortal.dashboard_page.active_customers_customers_chart_y_axis.text_value.strip). to eql(str)
end

Then /^[Pp]P: expect [Dd]ashboard page the Active Customers Chart has X-axis to be labeled with month abbreviations$/ do |str|
  actual_month = str.split(',')
  expected_month = PartnerPortal.dashboard_page.x_axis_month_abbreviations
  expect(expected_month[2]). to eql( actual_month)
end

Then /^[Pp]P: expect [Dd]ashboard page the Active Customers Chart legends to exist$/ do
  expect(PartnerPortal.dashboard_page.active_customers_customers_chart_legends).to be_present, ' Active Customers chart LEGENDS DOES NOT exist on dashboard page'
end

Then /^[Pp]P: expect [Dd]ashboard page the Active Customers Chart previous year legend to be last year date$/ do
  last_update_on = PartnerPortal.dashboard_page.contract_last_updated_on
  last_update_date = Date.strptime(last_update_on.text_value.split(':').last.strip, '%m/%d/%Y')
  previous_year = last_update_date - 1.year
  legends = PartnerPortal.dashboard_page.active_customers_customers_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  expect(legends[0].to_i).to eql(previous_year.year)
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the Active Customers Chart current year legends to be current year$/ do
  last_update_on = PartnerPortal.dashboard_page.contract_last_updated_on
  last_update_date = Date.strptime(last_update_on.text_value.split(':').last.strip, '%m/%d/%Y')
  legends  = PartnerPortal.dashboard_page.active_customers_customers_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  expect(legends[1].to_i).to eql(last_update_date.year)
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the Active Customers Chart Current Month legends to be (.*)$/ do |str|
  legends  = PartnerPortal.dashboard_page.active_customers_customers_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  current_month = [] << legends[2] + " " + legends[3]
  expect(current_month[0].to_s).to eql(str)
end

Then /^[Pp]P: expect [Dd]ashboard page the Revenue Share [Cc]hart to exist$/ do
  expect(PartnerPortal.dashboard_page.revenue_share_chart).to be_present, 'Revenue Share chart DOES NOT exist on dashboard page'
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the Revenue Share Chart to title to be (.*)$/ do |str|
  expect(PartnerPortal.dashboard_page.revenue_share_chart_title.text_value.strip). to eql(str)
end

Then /^[Pp]P: expect [Dd]ashboard page the Revenue Share Chart Y-axis label to be (.*)$/ do |str|
  expect(PartnerPortal.dashboard_page.revenue_share_chart_y_axis.text_value.strip). to eql(str)
end

Then /^[Pp]P: expect [Dd]ashboard page the Revenue Share Chart has X-axis to be labeled with month abbreviations$/ do |str|
  actual_month = str.split(',')
  expected_month = PartnerPortal.dashboard_page.x_axis_month_abbreviations
  expect(expected_month[3]). to eql( actual_month)
end

Then /^[Pp]P: expect [Dd]ashboard page the Revenue Share [Cc]hart legends to exist$/ do
  expect(PartnerPortal.dashboard_page.revenue_share_chart_legends).to be_present, ' Revenue Share chart LEGENDS DOES NOT exist on dashboard page'
end

Then /^[Pp]P: expect [Dd]ashboard page the Revenue Share Chart previous year legend to be last year date$/ do
  last_update_on = PartnerPortal.dashboard_page.contract_last_updated_on
  last_update_date = Date.strptime(last_update_on.text_value.split(':').last.strip, '%m/%d/%Y')
  previous_year = last_update_date - 1.year
  legends = PartnerPortal.dashboard_page.revenue_share_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  expect(legends[0].to_i).to eql(previous_year.year)
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the Revenue Share Chart current year legends to be current year$/ do
  last_update_on = PartnerPortal.dashboard_page.contract_last_updated_on
  last_update_date = Date.strptime(last_update_on.text_value.split(':').last.strip, '%m/%d/%Y')
  legends  = PartnerPortal.dashboard_page.revenue_share_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  expect(legends[1].to_i).to eql(last_update_date.year)
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the Revenue Share Chart Current Month legends to be (.*)$/ do |str|
  legends  = PartnerPortal.dashboard_page.revenue_share_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  current_month = [] << legends[2] + " " + legends[3]
  expect(current_month[0].to_s).to eql(str)
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the (.*) USD chart previous year chart data to be correct$/ do |chart|
  legends = PartnerPortal.dashboard_page.revenue_share_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  previous_year_data = PartnerPortal.common_page.chart_data_window(chart, 'Previous')
  previous_year_data_actual = previous_year_data.reject { |item| item.blank? }

  step 'establish partner portal db connection'
  previous_year_data_expected =  PartnerPortal.common_page.chart_data_query(TestSession.env.usr, chart, legends[0], 'Amount' )
  step 'Close partner portal db connection'

  expect(previous_year_data_expected).to match_array(previous_year_data_actual)
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the (.*) USD chart current year chart data to be correct$/ do |chart|
  legends = PartnerPortal.dashboard_page.revenue_share_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  previous_year_data = PartnerPortal.common_page.chart_data_window(chart, 'Current')
  previous_year_data_actual = previous_year_data.reject { |item| item.blank? }

  step 'establish partner portal db connection'
  previous_year_data_expected =  PartnerPortal.common_page.chart_data_query(TestSession.env.usr, chart, legends[1], 'Amount' )
  step 'Close partner portal db connection'

  expect(previous_year_data_expected).to match_array(previous_year_data_actual)
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the (.*) # chart previous year chart data to be correct$/ do |chart|
  legends = PartnerPortal.dashboard_page.revenue_share_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  previous_year_data = PartnerPortal.common_page.chart_data_window(chart, 'Previous')
  previous_year_data_actual = previous_year_data.reject { |item| item.blank? }

  step 'establish partner portal db connection'
  previous_year_data_expected =  PartnerPortal.common_page.chart_data_query(TestSession.env.usr, chart, legends[0], 'Count' )
  step 'Close partner portal db connection'

  expect(previous_year_data_expected).to match_array(previous_year_data_actual)
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the (.*) # chart current year chart data to be correct$/ do |chart|
  legends = PartnerPortal.dashboard_page.revenue_share_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  previous_year_data = PartnerPortal.common_page.chart_data_window(chart, 'Current')
  previous_year_data_actual = previous_year_data.reject { |item| item.blank? }

  step 'establish partner portal db connection'
  previous_year_data_expected =  PartnerPortal.common_page.chart_data_query(TestSession.env.usr, chart, legends[1], 'Count' )
  step 'Close partner portal db connection'

  expect(previous_year_data_expected).to match_array(previous_year_data_actual)
end

Then /^PP: expect export data header to exists$/ do
  PartnerPortal.dashboard_page.export_data_header.wait_until_present(timeout: 5)
  expect(PartnerPortal.dashboard_page.export_data_header).to be_present, 'Export Data header DOES NOT exist on dashboard page'
end

Then /^PP: expect export data content to be (.*)$/ do |str|
  expect(PartnerPortal.dashboard_page.export_data_content.text_value.strip).to eql(str)
end

Then /^PP: expect export from date label to be (.*)$/ do |str|
  from_label = PartnerPortal.dashboard_page.from_label
  from_label = from_label.delete('""')
  expect(from_label).to eql(str)
end

Then /^PP: expect dashboard page from date field exists$/ do
  expect(PartnerPortal.dashboard_page.from_date_field).to be_present, 'From Date field DOES NOT exist on dashboard page'
end

Then /^PP: expect dashboard page from data field placeholder to be (.*)$/ do |str|
  expect(PartnerPortal.dashboard_page.from_date_field.attribute_value('placeholder')).to eql(str)
end



Then /^PP: expect dashboard page from date date picker exists$/ do
  expect(PartnerPortal.dashboard_page.from_date_date_picker).to be_present, 'From Date Picker DOES NOT exist on dashboard page'
end

Then /^PP: expect export to date label to be (.*)$/ do |str|
  to_label = PartnerPortal.dashboard_page.to_label
  to_label = to_label.delete('""')
  expect(to_label).to eql(str)
end

Then /^PP: expect dashboard page to date field exists$/ do
  expect(PartnerPortal.dashboard_page.to_date_field).to be_present, 'To Date field DOES NOT exist on dashboard page'
end

Then /^PP: expect dashboard page to date field place holder to be (.*)$/ do |str|
  expect(PartnerPortal.dashboard_page.to_date_field.attribute_value('placeholder')).to eql(str)
end



Then /^PP: expect dashboard page to date picker exists$/ do
  expect(PartnerPortal.dashboard_page.to_date_picker).to be_present, 'To Date Picker DOES NOT exist on dashboard page'
end

Then /^PP: expect dashboard page from date field error message index (\d+) to be (.*)$/ do |index, str|
  from_date_error_message = PartnerPortal.dashboard_page.from_date_error_message
  from_date_error_message.wait_until_present(timeout: 5)
  from_date_error_message = from_date_error_message.text_value.strip.split("\n")
  expect(from_date_error_message[index.to_i - 1]).to eql(str)

end

Then /^PP: set dashboard page from date field to (?:random date|(.*))$/ do |str|
  step "PP: generate random date for from and to date fields"

  from_date_field =  PartnerPortal.dashboard_page.from_date_field
  while from_date_field.text_value != ''
    from_date_field.send_keys(:backspace)
  end

  from_date_field.scroll_into_view
  from_date_field.set(TestData.hash[:from_date] = (str.nil?) ? (TestData.hash[:from_date]) : str)
  from_date_field.parent.focus
  from_date_field.parent.click
  SdcLogger.debug "From: #{TestData.hash[:from_date]}\n"
end

Then /^PP: set dashboard page to date field to (?:random date|(.*))$/ do |str|
  to_date_field =  PartnerPortal.dashboard_page.to_date_field

  while to_date_field.text_value != ''
    to_date_field.send_keys(:backspace)
  end
  to_date_field.scroll_into_view
  to_date_field.set(TestData.hash[:to_date] = (str.nil?) ? (TestData.hash[:to_date]) : str)
  to_date_field.parent.focus
  to_date_field.parent.click
  SdcLogger.debug "To:: #{TestData.hash[:to_date]}\n"
end

Then /^PP: expect from date and to date are cleared$/ do
  to_date_field =  PartnerPortal.dashboard_page.to_date_field
  from_date_field =  PartnerPortal.dashboard_page.from_date_field

  expect(to_date_field.text_value).to eql('')
  expect(from_date_field.text_value).to eql('')
end


Then /^PP: expect dashboard page to date field error message index (\d+) to be (.*)$/ do |index, str|
  to_date_error_message = PartnerPortal.dashboard_page.to_date_error_message
  to_date_error_message.wait_until_present(timeout: 5)
  to_date_error_message = to_date_error_message.text_value.strip.split("\n")
  expect(to_date_error_message[index.to_i - 1]).to eql(str)

end

Then /^PP: click on the dashboard page download button$/ do
  PartnerPortal.dashboard_page.download.send_keys(:enter)
end

Then /^PP: expect dashboard page download button exists$/ do
  PartnerPortal.dashboard_page.download.wait_until_present(timeout: 5)
  expect(PartnerPortal.dashboard_page.download).to be_present, 'Download button DOES NOT exist on dashboard page'
end

Then /^PP: expect dashboard page download modal exists$/ do
  PartnerPortal.dashboard_page.download_modal.wait_until_present(timeout: 5)
  expect(PartnerPortal.dashboard_page.download_modal).to be_present, 'Download modal DOES NOT exist on dashboard page'
end

Then /^PP: expect dashboard page download modal header to be (.*)$/ do |str|
  PartnerPortal.dashboard_page.download_modal_header.wait_until_present(timeout: 5)
  expect(PartnerPortal.dashboard_page.download_modal_header.text_value.strip).to eql(str)
end

Then /^PP: expect dashboard page download modal paragraph index (\d+) to be$/ do |index, str|
  download_modal_p = PartnerPortal.dashboard_page.download_modal_p[index - 1]
  download_modal_p.wait_until_present(timeout: 5)
  download_modal_p = download_modal_p.inner_text.strip
  expect(download_modal_p).to eql(str)
end

Then /^PP: click on the dashboard page download modal ok button$/ do
  PartnerPortal.dashboard_page.download_modal_ok.send_keys(:enter)
end

Then /^PP: delete existing csv file$/ do
  contract= PartnerPortal.dashboard_page.contract_header.text_value.split(':').last.strip
  TestData.hash[:file_name_expected] = 'Partnerportal_'+ contract +'_'+  TestData.hash[:from_date].gsub('/', '') + '_to_' + TestData.hash[:to_date].gsub('/', '')+ '.csv'
  file = "#{Dir.getwd}/download/" + TestData.hash[:file_name_expected]
  File.delete(file) unless File.exist?(file) == false
end


Then /^PP: expect CSV file to be downloaded with correct file name$/ do
   download_directory = "#{Dir.getwd}/download"
  # #download_directory = data_for(:download, {})['download_file_path']
   downloads_before = Dir.entries download_directory

  case(TestSession.env.local_browser)
    when :gc_web_dev
      600.times do
        difference = Dir.entries(download_directory)
        if difference.last.exclude?('.crdownload')
          TestData.hash[:file_name]  =  difference.last
          break
        end
        sleep 1
      end

    when :gc_iPad
      600.times do
        difference = Dir.entries(download_directory)
        if difference.last.exclude?('.crdownload')
          TestData.hash[:file_name]  =  difference.last
          break
        end
        sleep 1
      end

    when :edge
      600.times do
        difference = Dir.entries(download_directory) - downloads_before
        if  difference.size == 1
          TestData.hash[:file_name]  =  difference.first
          break
        end
        sleep 1
      end

    when :ff_web_dev
      600.times do
        if  Dir.entries(download_directory).size == 3
          TestData.hash[:file_name]  =  Dir.entries(download_directory)[2]
          break
        end
        sleep 1
      end
  end

  case(SdcGlobal.web_dev_device)
    when /\w/
      600.times do
        difference = Dir.entries(download_directory)
        if difference.last.exclude?('.crdownload')
          TestData.hash[:file_name]  =  difference.last
          break
        end
        sleep 1
      end
  end


  expect(TestData.hash[:file_name]).to eql(TestData.hash[:file_name_expected])

end

Then /^PP: generate random date for from and to date fields$/ do
  last_update_on = PartnerPortal.dashboard_page.contract_last_updated_on.text_value.split(':').last.strip
  date = last_update_on.split('/')
  TestData.hash[:last_update_on] = date[2] + ',' + date[0] + ',' + date[1]

  tmp = Date.strptime(last_update_on, "%m/%d/%Y")
  from_date =  (tmp.year - rand(1..3)).to_s + ',' + tmp.month.to_s + ',' + tmp.day.to_s

  rand_from_date = PartnerPortal.dashboard_page.pp_rand_date(Time.local(from_date), Time.local(TestData.hash[:last_update_on]))
  from_date = rand_from_date.to_date.to_s.split('-')
  TestData.hash[:from_date] = from_date[1].to_s + '/' + from_date[2].to_s + '/' + (from_date[0][2]+ from_date[0][3]).to_s

  to_date = rand_from_date.to_date.to_s.gsub('-', ',')
  to_date =  PartnerPortal.dashboard_page.pp_rand_date(Time.local(to_date), Time.local(TestData.hash[:last_update_on]))
  to_date = to_date.to_date.to_s.split('-')
  TestData.hash[:to_date] = to_date[1].to_s + '/' + to_date[2].to_s + '/' + (to_date[0][2]+ to_date[0][3]).to_s

end

Then /PP: dashboard page export data for (\d+) dates ranges$/ do |number|
  number.times do
    step 'PP: set dashboard page from date field to random date'
    step 'PP: set dashboard page to date field to random date'
    step 'PP: delete existing csv file'
    step 'PP: click on the dashboard page download button'
    step 'PP: click on the dashboard page download modal ok button'
    step 'PP: expect from date and to date are cleared'
    step 'PP: Expect a record of Log Type 3 event is added in Audit Records for user'
    step 'PP: expect CSV file to be downloaded with correct file name'
    step 'PP: delete existing csv file'
  end

end


Then /PP: dashboard page export data data validation for (\d+) dates ranges$/ do |number|
  number.times do
    step 'PP: set dashboard page from date field to random date'
    step 'PP: set dashboard page to date field to random date'
    step 'PP: delete existing csv file'
    step 'PP: click on the dashboard page download button'
    step 'PP: click on the dashboard page download modal ok button'
    step 'PP: expect from date and to date are cleared'
    step 'PP: Expect a record of Log Type 3 event is added in Audit Records for user'
    step 'PP: expect CSV file to be downloaded with correct file name'
    step 'PP: dashboard page export data expect csv file transaction data matches database transaction data'
    step 'PP: delete existing csv file'
  end

end

Then /PP: dashboard page export data expect csv file transaction data matches database transaction data$/ do
  headers_expected = ['Account number', 'Transaction Time', 'Transaction Type', 'Retail Rate', 'Payout Amount', 'Tracking Number', 'Weight', 'Zone', 'Package Length',
                      'Package Width', 'Package Height', 'Package Type','Mail Class', 'International Country Group', 'Origination Address ZIP',
                      'Destination Address ZIP', 'Destination Country', 'Extra Service Fee', 'Unique Transaction ID', 'Container Type', 'Is Cubic',
                      'Cubic Value', 'Is APF/AFO', 'Credit Card fee']

  account_number = []
  transaction_time = []
  transaction_type = []
  retail_rate = []
  payout_amount = []
  tracking_number = []
  weight = []
  zone = []
  package_length = []
  package_width = []
  package_height = []
  package_type = []
  mail_class = []
  international_country_group = []
  origination_address_zip = []
  destination_address_zip = []
  destination_country = []
  extra_service_fee = []
  unique_transaction_id = []
  container_type = []
  is_cubic = []
  cubic_value = []
  is_apf_afo = []
  credit_card_fee = []
  empty_csv_file = []
  tmp = []

  CSV.read("#{Dir.getwd}/download/" + TestData.hash[:file_name],  headers: true).map do |row|
    tmp << row.headers
    break
  end
  tmp2 = tmp.reject(&:empty?)
  headers = tmp2[0][0].split(/\t/)


  output = CSV.read("#{Dir.getwd}/download/" + TestData.hash[:file_name], headers: true).map do |row|
    row.to_csv(:col_sep => /\t/, row_sep: nil).gsub(/\t/, ',').sub!( /\A.{1}/m, '' ).chop
  end

  output.each do |item|
    if item.split(',')[0] == "No data found for that date range.  Please try again with different dates."
      empty_csv_file << item.split(',')[0]
    else
      account_number << item.split(',')[0].to_i
      tmp = item.split(',')[1]
      tmp2= tmp.split('/')
      date = tmp2[1] + '/' + tmp2[0] + '/' + tmp2[2]
      transaction_time <<  date.to_time
      transaction_type << item.split(',')[2].to_s
      retail_rate << item.split(',')[3].gsub('$', '').to_f
      payout_amount << item.split(',')[4].gsub('$', '').to_f
      tracking_number << item.split(',')[5].to_i
      weight <<  item.split(',')[6].to_i
      zone << item.split(',')[7].to_s
      package_length << item.split(',')[8].to_i
      package_width << item.split(',')[9].to_i
      package_height << item.split(',')[10].to_i
      package_type << item.split(',')[11].to_s
      mail_class << item.split(',')[12].to_s
      international_country_group << item.split(',')[13].to_s
      origination_address_zip << item.split(',')[14].to_i
      destination_address_zip << item.split(',')[15].to_i
      destination_country << item.split(',')[16].gsub("\"(?-mix:\\t)\"", ',').to_s
      extra_service_fee << item.split(',')[17].gsub('$', '').to_f
      unique_transaction_id << item.split(',')[18].to_i
      container_type << item.split(',')[19].to_s
      is_cubic << item.split(',')[20].downcase
      cubic_value << item.split(',')[21].to_s
      is_apf_afo <<  item.split(',')[22].downcase
      credit_card_fee << item.split(',')[23].gsub('$', '').to_f
    end
  end

 step 'PP: dashboard page export data retrieve transaction data from database'

  if TestData.hash[:account_number].empty?
    expect(headers_expected).to match_array(headers)
    expect(empty_csv_file).to match_array("No data found for that date range.  Please try again with different dates.")
  else
    expect(headers_expected).to match_array(headers)
    expect(TestData.hash[:account_number]).to match_array(account_number)
    #expect(TestData.hash[:transaction_time]).to match_array(transaction_time)  #TODO-MH fix after PP-523 bug is fix
    expect(TestData.hash[:transaction_type]).to match_array(transaction_type)
    expect(TestData.hash[:payout_amount]).to match_array(payout_amount)
    expect(TestData.hash[:tracking_number]).to match_array(tracking_number)
    expect(TestData.hash[:weight]).to match_array(weight)
    expect(TestData.hash[:zone]).to match_array(zone)
    expect(TestData.hash[:package_length]).to match_array(package_length)
    expect(TestData.hash[:package_width]).to match_array(package_width)
    expect(TestData.hash[:package_height]).to match_array(package_height)
    expect(TestData.hash[:package_type]).to match_array(package_type)
    expect(TestData.hash[:mail_class]).to match_array(mail_class)
    expect(TestData.hash[:international_country_group]).to match_array(international_country_group)
    expect(TestData.hash[:origination_address_zip]).to match_array(origination_address_zip)
    expect(TestData.hash[:destination_address_zip]).to match_array(destination_address_zip)
    expect(TestData.hash[:destination_country]).to match_array(destination_country)
    expect(TestData.hash[:extra_service_fee]).to match_array(extra_service_fee)
    expect(TestData.hash[:unique_transaction_id]).to match_array(unique_transaction_id)
    expect(TestData.hash[:container_type]).to match_array(container_type)
    expect(TestData.hash[:is_cubic]).to match_array(is_cubic)
    expect(TestData.hash[:cubic_value]).to match_array(cubic_value)
    expect(TestData.hash[:is_apf_afo]).to match_array(is_apf_afo)
    expect(TestData.hash[:credit_card_fee]).to match_array(credit_card_fee)
  end
 end


Then /PP: dashboard page export data retrieve transaction data from database$/ do
  date_from_tmp = TestData.hash[:from_date].split('/')
  from_date = ('20'+date_from_tmp[2]) + '-' + date_from_tmp[0] + '-' + date_from_tmp[1]
  date_to_tmp = TestData.hash[:to_date].split('/')
  to_date = ('20'+date_to_tmp[2]) + '-' + date_to_tmp[0] + '-' + date_to_tmp[1]

  step 'establish partner portal db connection'
  TestData.hash[:account_number], TestData.hash[:transaction_time], TestData.hash[:transaction_type],
      TestData.hash[:retail_rate], TestData.hash[:payout_amount], TestData.hash[:tracking_number],
      TestData.hash[:weight], TestData.hash[:zone], TestData.hash[:package_length], TestData.hash[:package_width],
      TestData.hash[:package_height], TestData.hash[:package_type], TestData.hash[:mail_class], TestData.hash[:international_country_group],
      TestData.hash[:origination_address_zip],TestData.hash[:destination_address_zip], TestData.hash[:destination_country],
      TestData.hash[:extra_service_fee], TestData.hash[:unique_transaction_id],TestData.hash[:container_type],
      TestData.hash[:is_cubic], TestData.hash[:cubic_value], TestData.hash[:is_apf_afo],
      TestData.hash[:credit_card_fee] = PartnerPortal.common_page.transaction_data(TestSession.env.usr, from_date, to_date)
  step 'Close partner portal db connection'

end