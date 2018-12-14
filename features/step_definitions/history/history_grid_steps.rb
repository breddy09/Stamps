Then /^check row (\d+) on history grid$/ do |row|
  grid = SdcHistory.grid
  checkbox = grid.grid_column(:checkbox)
  row = checkbox.checkbox_row(row)
  row.check
  expect(row.checked?).to be_truthy
end

Then /^uncheck row (\d+) on history grid$/ do |row|
  grid = SdcHistory.grid
  checkbox = grid.grid_column(:checkbox)
  row = checkbox.checkbox_row(row)
  row.uncheck
  expect(row.checked?).to be false
end

Then /^expect row (\d+) on history grid is checked$/ do |row|
  expect(SdcHistory.grid.grid_column(:checkbox).checkbox_row(row).checked?).to be_truthy
end

Then /^check row for saved tracking number on history grid$/ do
  expect(TestData.hash[:tracking_number]).to be_truthy
  expect(TestData.hash[:tracking_number].size).to be > 12
  tracking = SdcHistory.grid.grid_column(:tracking_number)
  row_number = tracking.row_num(TestData.hash[:tracking_number])
  checkbox = SdcHistory.grid.grid_column(:checkbox)
  row = checkbox.checkbox_row(row_number)
  row.check
  expect(row.checked?).to be true
end

Then /^expect history grid column (.+) is (.+) for row (\d+)$/ do |column, value, row|
  column_symbol = column.gsub(' ', '_').downcase.to_sym
  column = SdcHistory.grid.grid_column(column_symbol)
  expect(column.text_at_row(row)).to eql(value)
end


Then /^expect history grid column (.+) is (.+) for saved tracking number$/ do |column, value|
  grid_column = SdcHistory.grid.grid_column(:tracking_number)
  row_num = grid_column.row_num(TestData.hash[:tracking_number])
  step "expect history grid column #{column} is #{value} for row #{row_num}"
end

# correct for row #
Then /^expect history grid weight is correct for row (\d+)$/ do |row|
  str = "#{TestData.hash[:lbs]} lbs. #{TestData.hash[:oz]} oz."
  step "expect history grid column Weight is #{str} for row #{row}"
end

Then /^expect history tracking # is correct for row (\d+)$/ do |row|
  step "expect history grid column Tracking # is #{TestData.hash[:tracking]} for row #{row}"
end

Then /^expect history Service is correct for row (\d+)$/ do |row|
  step "expect history grid column Weight is #{TestData.hash[:service]} for row #{row}"
end

Then /^expect history grid Total Cost is correct for row (\d+)$/ do |row|
  step "expect history grid column Weight is #{TestData.hash[:total_ship_cost]} for row #{row}"
end

Then /^expect history grid Insured For is correct for row (\d+)$/ do |row|
  step "expect history grid column Weight is #{TestData.hash[:insure_for_cost]} for row #{row}"
end

Then /^expect history grid cost code column at row (.*) is correct$/ do |row|
  SdcHistory.grid.body.safe_wait_until_present(timeout: 60)
  str ||= TestData.hash[:cost_code]
  column = SdcHistory.grid.grid_column(:cost_code)
  actual_value = column.text_at_row(row)
  expect(actual_value.strip).to eql str
end

Then /^expect history grid Ship Date is correct for row (\d+)$/ do |row|
  step "expect history grid column Weight is #{TestData.hash[:ship_date]} for row #{row}"
end

#date printed
Then /^hover on history grid column date printed$/ do
  column = SdcHistory.grid.grid_column(:date_printed)
  column.header.scroll_into_view
  column.header.hover
end

Then /^click on header dropdown trigger of column date printed$/ do
  column_trigger = SdcHistory.grid.grid_column(:date_printed)
  column_trigger.header_dropdown.scroll_into_view
  if(column_trigger.header_dropdown.present?)
  else
    column_trigger.header.hover
  end
   column_trigger.header_dropdown.click
end

Then /^expect (.*) is available in the date printed column header dropdown menu list$/ do |str|
  menu_list = SdcHistory.grid.grid_column(:date_printed)
  menu_item = menu_list.header_dropdown_item(str)

  expect(menu_item.text_value).to eql(str)
  expect(menu_item.present?).to be(true)

end

Then /^click on (.*) in the date printed column header dropdown menu list$/ do |str|
  menu_list = SdcHistory.grid.grid_column(:date_printed)
  menu_item = menu_list.header_dropdown_item(str)
  menu_item.click
end

Then /^save (.*) date range value on grid for column date printed$/ do |str|
  history_search =  SdcHistory.filter_panel.search_results
  search_count = history_search.count.text_value.to_i
  if search_count > 0
    SdcHistory.grid.body.safe_wait_until_present(timeout: 60)
    column = SdcHistory.grid.grid_column(:date_printed)
    column.safe_wait_until_present(timeout: 60)
    column.scroll_into_view
    grid_date = column.text_at_row(1)
    tmp_date=Date.strptime(grid_date,'%m/%d/%Y')
    TestData.hash["#{str}_date"]||=tmp_date

  else
    TestData.hash["#{str}_date"]||= nil
    SdcLogger.info 'There is no data available with defined date range'
  end


end

Then /^save (.*) date value on grid for column date printed$/ do |str|
  SdcHistory.grid.body.safe_wait_until_present(timeout: 60)
  column = SdcHistory.grid.grid_column(:date_printed)
  column.element(1).flash
  grid_date = column.text_at_row(1)
  if grid_date.equal? nil
    SdcLogger.info "Grid date is NULL. Hence, comparison is not possible"
    break
  else
    TestData.hash["#{str}_date"]||= grid_date
  end
end

#date delivered
Then /^hover on history grid column date delivered$/ do
  column = SdcHistory.grid.grid_column(:date_delivered)
  column.scroll_into_view
  column.header.hover
end

Then /^click on header dropdown trigger of column date delivered$/ do
  column_trigger = SdcHistory.grid.grid_column(:date_delivered).header_dropdown
  column_trigger.scroll_into_view
  column_trigger.click
end

Then /^expect (.*) is available in the date delivered column header dropdown menu list$/ do |str|
  menu_list = SdcHistory.grid.grid_column(:date_delivered)
  menu_item = menu_list.header_dropdown_item(str)
  expect(menu_item.text_value).to eql(str)
  expect(menu_item.present?).to be(true)
end

Then /^click on (.*) in the date delivered column header dropdown menu list$/ do |str|
  menu_list = SdcHistory.grid.grid_column(:date_delivered)
  menu_item = menu_list.header_dropdown_item(str)
  menu_item.click
end

Then /^save (.*) date range value on grid for column date delivered$/ do |str|
  history_search =  SdcHistory.filter_panel.search_results
  search_count = history_search.count.text_value.to_i
  if search_count > 0
    SdcHistory.grid.body.safe_wait_until_present(timeout: 60)
    column = SdcHistory.grid.grid_column(:date_delivered)
    column.scroll_into_view
    grid_date = column.text_at_row(1)
   tmp_date=Date.strptime(grid_date,'%m/%d/%Y')
   TestData.hash["#{str}_date"]||=tmp_date

  else
    TestData.hash["#{str}_date"]||= nil
    SdcLogger.info 'There is no data available with defined date range'
  end

end

#ship date
Then /^hover on history grid column ship date$/ do
  SdcHistory.grid.body.safe_wait_until_present(timeout: 60)
  column = SdcHistory.grid.grid_column(:ship_date)
  column.scroll_into_view
  column.header.scroll_into_view
  column.header.hover
end

Then /^click on header dropdown trigger of column ship date$/ do
  column_trigger = SdcHistory.grid.grid_column(:ship_date)
  column_trigger.scroll_into_view
  column_trigger.header_dropdown.safe_wait_until_present(timeout: 60)
  column_trigger.header_dropdown.scroll_into_view
  column_trigger.header_dropdown.click
end

Then /^expect (.*) is available in the ship date column header dropdown menu list$/ do |str|
  menu_list = SdcHistory.grid.grid_column(:ship_date)
  menu_item = menu_list.header_dropdown_item(str)
  expect(menu_item.text_value).to eql(str)
  expect(menu_item.present?).to be(true)
end

Then /^click on (.*) in the ship date column header dropdown menu list$/ do |str|
  menu_list = SdcHistory.grid.grid_column(:ship_date)
  menu_item = menu_list.header_dropdown_item(str)
  menu_item.click
end

Then /^save (.*) date range value on grid for column ship date$/ do |str|
  history_search =  SdcHistory.filter_panel.search_results
  search_count = history_search.count.text_value.to_i
  if search_count > 0
    SdcHistory.grid.body.safe_wait_until_present(timeout: 60)
    column = SdcHistory.grid.grid_column(:ship_date)
    column.scroll_into_view
    grid_date = column.text_at_row(1)
    tmp_date=Date.strptime(grid_date,'%m/%d/%Y')
    TestData.hash["#{str}_date"]||=tmp_date

  else
    TestData.hash["#{str}_date"]||= nil
    SdcLogger.info 'There is no data available within defined date range'
  end

end


Then /^choose (.*) on history settings columns menu list$/ do |column|
  settings = SdcHistory.toolbar.toolbar_setting
  checkbox = settings.column_menu_checkbox(column)
  checkbox.flash
  # checkbox.checked? will return true if it is unchecked as the property_name in chooser item 'unchecked'
  checkbox.check if checkbox.checked?
  # step 'click on search bar of history left navigation panel'
end

Then /^click on search bar of history left navigation panel$/ do
  contacts_left_navigation = SdcHistory.filter_panel.search
  contacts_left_navigation.search_prints.safe_wait_until_present(timeout: 15)
  contacts_left_navigation.search_prints.click
end

Then /^expect prints within date range (.*) for column (.*) are retrieved in the grid$/ do |date_range,column_name|

  case date_range
  when 'Today'
    from_date= Date.today
  when 'Past 7 Days'
    from_date= Date.today - 7
  when 'Past 30 Days'
     from_date= Date.today - 30
  when 'Past 6 Months'
     from_date= Date.today<< 6
  when 'Past 12 Months'
    from_date=Date.today << 12
  when 'Past 2 Years'
     from_date=Date.today << 24
  end
  start_date= TestData.hash['first_date']
  end_date= TestData.hash['last_date']

  if (start_date && end_date != nil)
    expect(start_date.between?(from_date,Date.today)).to be(true)
    expect(end_date.between?(from_date,Date.today)).to be(true)
  else
    SdcLogger.info 'No record present in the History Grid for a specified date range'
  end

end

