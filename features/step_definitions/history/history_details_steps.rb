Then /^expect print details on history is present$/ do
  step 'wait while loading history details panel'
  expect(SdcHistory.details.header.title).to be_present
end

Then /^expect return to on history print details contain (.*)$/ do |str|
  expect(SdcHistory.details.addresses.return_to.text_value).to include(str)
end

Then /^wait while loading history details panel$/ do
  SdcHistory.details.loading.safe_wait_until_present(timeout: 8)
  SdcHistory.details.loading.wait_while_present(timeout: 240)
end

# Addresses
Then /^expect address shipped to in history transaction details displayed (?:correct|(.*))$/ do |address|
  shipped_address = SdcHistory.details.addresses
  shipped_address.shipped_to.flash
  address ||= TestData.hash[:address]
  address_arr = address.split("\n")
  expect(shipped_address.shipped_to.text_value). to eql(TestData.hash[:address])
end


Then /^expect address shipped to contains (\d+) lines$/ do |lines|
  address = TestData.hash[:address]
  address = address.split("\n")
  address_lines_count = address.length
  expect(address_lines_count.to_i). to eql(lines.to_i)
  SdcLogger.info "Shipped to address contains #{address_lines_count} lines"
end

Then /^set search prints tracking number on history filter panel to (?:newly added|(.*))$/ do |str|
  search =  SdcHistory.filter_panel.search
  #SdcPage.browser.driver.action.send_keys(:esc)
  search.search_prints.safe_wait_until_present(timeout: 10)
  str ||= TestData.hash[:tracking_number]
  search.search_prints.set(str)
end

Then /^click search icon on history filter panel$/ do
  search =  SdcHistory.filter_panel.search
  search.search_icon.click
end

Then /^set search prints to (?:newly added|(.*)) tracking number on history filter panel$/ do |str|
  search =  SdcHistory.filter_panel.search
  search.search_prints.safe_wait_until_present(timeout: 10)
  str||= TestData.hash[:tracking_number]
  search.search_prints.set(str)
end
Then /^expect history filter panel search results tab is present$/ do
  expect(SdcHistory.filter_panel.search_results.search_results_label).present?
end

Then /^expect recipient column include (.*)$/ do |str|
  history_search_results = SdcHistory.filter_panel.search_results
search_count = history_search_results.search_results_count.text_value.to_i
p search_count
j =1
while j<=10
  SdcLogger.info "value of j is #{j}"
  recipient_name = Array.new
  i = 1
  SdcLogger.info "value of i is #{i}"

  while i <= 10
    p i
    recipient_name[i] = SdcHistory.grid.grid_column(:recipient).text_at_row(i)
    tmp = recipient_name[i]
    SdcLogger.info "value of recipient_name[i] is: #{recipient_name[i]}"
    SdcLogger.info "value of tmp is: #{tmp}}"
    p 'next'
    p str
    p expect(tmp).to include(str)
    expect(recipient_name[i].include? str).to be(true)

    tracking_id = SdcHistory.grid.grid_column(:tracking_number).text_at_row(i)
    SdcLogger.info "value of  tracking_id[i] is: #{ tracking_id}"
  end
  j = j+1
end
end 
  #old code
#   history_search =  SdcHistory.filter_panel.search_results
#   search_count = history_search.search_results_count.text_value.to_i
#   p search_count
#   i = 1
#   tracking_number_hardcoded=TestData.hash[:tracking_number]
#   p     tracking_number_hardcoded
#   while  i<= search_count
#     p i
#     recipient = SdcHistory.grid.grid_column(:recipient).text_at_row(i)
#     p recipient
#     expect(recipient).to include(str)
#     #tracking_number_hardcoded = '9405511899564363066857'
#     tracking_number = SdcHistory.grid.grid_column(:tracking_number).text_at_row(i).to_i
#     SdcLogger.info "row tracking number is #{tracking_number}"
#     if tracking_number_hardcoded.equal?(tracking_number)
#       SdcLogger.info "USPS carrier is displayed for the newly added tracking number #{TestData.hash[:tracking_number]}"
#       break
#     else
#       i = i+1
#     end
#   end
# end

Then /^expect history pagination works$/ do
  history_gird_pagination = SdcHistory.pagination.history_pagination

  # SdcLogger.info "#{'next'} Page disabled #{pagination.page_arrow_disabled('next')}"
  if expect(history_gird_pagination.page_arrow_disabled('next')).to be (false)
    p "inside pagination if"
    max_pages_text = history_gird_pagination.max_pages.text_value
    max_pages_text = max_pages_text.split("of ")
    max_pages = max_pages_text[1]
    SdcLogger.info "max_pages #{max_pages}"

    i=1
    while i < max_pages.to_i
      next_button = SdcHistory.pagination.history_pagination
      p next_button.page_next.enabled?
      if expect(next_button.page_next.enabled?).to be(true)
        step 'click on the pagination next button of history page'
      else
        SdcLogger.info "Next arrow is disabled"
      end
      i= i+1
    end

  end
end

Then /^click on the pagination next button of history page$/ do
  next_button = SdcHistory.pagination.history_pagination
  next_button.page_next.click

end
