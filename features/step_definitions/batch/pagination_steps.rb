#Pagination Controls are enabled

Then /^User is on the first page of orders$/ do
  log.info "Step: User is on the first page of orders"
  log.info "Page Count = Page #{batch.grid.row_count} orders"
  page_count = batch.grid.toolbar.page_count.text
  log.info "Page Count = Page #{page_count}"
  expect(page_count.to_i = 1).to be true
end

Then /^User clicks first page pagination control$/ do
  log.info "Step: User clicks first page pagination control"
  paging_toolbar = batch.grid.toolbar
  paging_toolbar.first_page.click
end

Then /^User clicks previous page pagination control$/ do
  log.info "Step: User clicks previous page pagination control"
  paging_toolbar = batch.grid.toolbar
  paging_toolbar.previous_page.click
end

Then /^User clicks next page pagination control$/ do
  log.info "Step: User clicks next page pagination control"
  paging_toolbar = batch.grid.toolbar
  paging_toolbar.next_page.click
end

Then /^User clicks last page pagination control$/ do
  log.info "Step: User clicks last page pagination control"
  paging_toolbar = batch.grid.toolbar
  paging_toolbar.last_page.click
end

Then /^Pagination control to go to first page is (\w+)$/ do |first_pagination_enabled|
  log.info "Step: Pagination control to go to first page is #{first_pagination_enabled}"
  enabled = batch.grid.toolbar.first_page.present?
  if first_pagination_enabled.downcase == "enabled"
    log.info "Pagination control to go to first page is enabled.  Test #{(enabled)?'Passed':'Failed'}"
    enabled.should be true
  end
end

Then /^Pagination control to go to previous page is (\w+)$/ do |previous_pagination_enabled|
  log.info "Step: Pagination control to go to previous page is #{previous_pagination_enabled}"
  enabled = batch.grid.toolbar.previous_page.present?
  if previous_pagination_enabled.downcase == "enabled"
    log.info "Pagination control to go to previous page is enabled.  Test #{(enabled)?'Passed':'Failed'}"
    enabled.should be true
  end
end

Then /^Pagination control to go to page number is (\w+$)/ do |page_number_enabled|
  log.info "Step: Pagination control to go to page number is #{page_number_enabled}"
  enabled = batch.grid.toolbar.page_number.present?
  if page_number_enabled.downcase == "enabled"
    log.info "Pagination control to go to page number is enabled.  Test #{(enabled)?'Passed':'Failed'}"
    enabled.should be true
  end
end

Then /^Pagination control to go to next page is (\w+)$/ do |next_pagination_enabled|
  log.info "Step: Pagination control to go to next page is #{next_pagination_enabled}"
  enabled = batch.grid.toolbar.next_page.present?
  if next_pagination_enabled.downcase == "enabled"
    log.info "Pagination control to go to next page is enabled.  Test #{(enabled)?'Passed':'Failed'}"
    enabled.should be true
  end
end

Then /^Pagination control to go to last page is (\w+)$/ do |last_pagination_enabled|
  log.info "Step: Pagination control to go to last page is #{last_pagination_enabled}"
  enabled = batch.grid.toolbar.last_page.present?
  if last_pagination_enabled.downcase == "enabled"
    log.info "Pagination control to go to last page is enabled.  Test #{(enabled)?'Passed':'Failed'}"
    enabled.should be true
  end
end

Then /^Expect page toolbar First Page is (\w+)$/  do |expectation|
  log.info "Expectation: Expect page toolbar First Page is #{expectation}"
  case expectation.downcase
    when "enabled"
      enabled = batch.grid.toolbar.first_page.present?
      log.info enabled
    when "disabled"
      disabled = batch.grid.toolbar.first_page_disabled
      log.info disabled
    else
      raise "Illegal argument exception"
  end
end

Then /^Expect page toolbar Previous Page is (\w+)$/  do |expectation|
  log.info "Expectation: Expect page toolbar Previous Page is #{expectation}"
  case expectation.downcase
    when "enabled"
      enabled = batch.grid.toolbar.previous_page.present?
      log.info enabled
    when "disabled"
      disabled = batch.grid.toolbar.first_page_disabled
      log.info disabled
    else
      raise "Illegal argument exception"
  end
end

Then /^Expect page toolbar Page Number is (\w+)$/  do |expectation|
  log.info "Expectation: Expect page toolbar Page Number is #{expectation}"
  case expectation.downcase
    when "enabled"
      enabled = batch.grid.toolbar.page_number.present?
      log.info enabled
    else
      raise "Illegal argument exception"
  end
end

Then /^Expect page toolbar Next Page is (\w+)$/  do |expectation|
  log.info "Expectation: Expect page toolbar Next Page is #{expectation}"
  case expectation.downcase
    when "enabled"
      enabled = batch.grid.toolbar.next_page.present?
      log.info enabled
    when "disabled"
      disabled = batch.grid.toolbar.last_page_disabled
      log.info disabled
    else
      raise "Illegal argument exception"
  end
end

Then /^Expect page toolbar Last Page is (\w+)$/  do |expectation|
  log.info "Expectation: Expect page toolbar Last Page is #{expectation}"
  case expectation.downcase
    when "enabled"
      enabled = batch.grid.toolbar.last_page.present?
      log.info enabled
    when "disabled"
      disabled = batch.grid.toolbar.last_page_disabled
      log.info disabled
    else
      raise "Illegal argument exception"
  end
end

Then /^Set paging toolbar orders per page count to (\d+)$/ do |page_count|
  log.info "Step: Set paging toolbar orders per page count to #{page_count}"
  #log.info "Order Grid contains #{features.batch.grid.grid_page_order_count} orders"
  log.info "Per page count is #{batch.grid.toolbar.page_count.text} orders"
  batch.grid.toolbar.per_page_dd.select page_count
  #log.info "Order Grid contains #{features.batch.grid.grid_page_order_count} orders"
  log.info "Per page count is #{batch.grid.toolbar.page_count.text} orders"
  expect(page_count.to_i > 1).to be true
  @per_page_count = page_count
end

When /^Set Page Number to (\d*)$/ do |value|
  log.info "Step: Set Page Number to #{value}"
  begin
    log.info "Set Page Number to \"#{value}\""
    page_one_order_id = batch.grid.order_id.row 1
    page_number = batch.grid.toolbar.page_number.text
    log.info "Current page number #{page_number}"
    batch.grid.toolbar.page_number.set value
    sleep 1
    page_number_textbox = batch.grid.toolbar.page_number
    page_number = page_number_textbox.text
    text_box_field = page_number_textbox.field
    text_box_field.send_keys :return
    text_box_field.send_keys :return
    log.info "New page number #{page_number}"
    page_two_order_id = batch.grid.order_id.row 1
    page_one_order_id.should_not eql page_two_order_id
  end unless value.length == 0
end

Then /^Expect Total Number of Pages to be (\d+)$/ do |total_number_of_pages|
  log.info "Expectation: Expect Total Number of Pages to be #{total_number_of_pages}"
  log.info "Passed value is #{total_number_of_pages}"
  browser_total_number_of_pages = batch.grid.toolbar.total_number_of_pages.to_s
  log.info "DD value is #{browser_total_number_of_pages}"
  test_result = browser_total_number_of_pages.include? total_number_of_pages
  log.info "#{(test_result)?'Test Passed.':'Test Failed'}"
  test_result.should be true
  #expect(total_number_of_pages).should be eql expect(browser_total_number_of_pages)
end

Then /^Expect number of orders on page to be correct$/ do
  log.info "Expectation: Expect number of orders on page to be correct"
  batch.grid.checkbox.check_all
  multi_order_count = batch.multi_order.order_count.to_s
  log.info "Multi Order Count is #{multi_order_count}"
  per_page_dd_count = @per_page_count
  log.info "Per Page Count is #{per_page_dd_count}"
  test_result = multi_order_count.include? per_page_dd_count
  log.info "#{(test_result)?'Test Passed.':'Test Failed'}"
  batch.grid.checkbox.uncheck_all
  test_result.should be true
end

#Pagination Controls are disabled

Then /^pagination control to go to first page is disabled$/ do

end

Then /^pagination control to go to previous page is disabled$/ do

end

Then /^pagination control to go to specific page is disabled$/ do

end

Then /^pagination control to go to next page is disabled$/ do

end

Then /^pagination control to go to last page is disabled$/ do

end

Then /^Web Batch grid has more orders than value selected in 'number of orders per page' pagination control$/ do
  log.info "Step: Web Batch grid has more orders than value selected in 'number of orders per page' pagination control"
  #1 Count order grid items ordersgridpagingtoolbar
  page_count = batch.grid.toolbar.page_count.text
  expect(page_count.to_i > 1).to be true
  total_grid_count = batch.grid.row_count
  #2 Get per page count

  #3 Compare
end

