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
  if TestData.hash[:email_tracking].nil?
    total_address =  address
  else
    total_address =  address + "\n" + TestData.hash[:email_tracking]
  end
  #total_address =  address + "\n" + TestData.hash[:email_tracking]
  #expect(shipped_address.shipped_to.text_value). to eql(total_address)
  address_arr = address.split("\n")
  address_lines_count = address_arr.length
  total_address_arr = total_address.split("\n")
  if address_lines_count.to_i.eql? 6
    #remove department value from the address array
    total_address_arr.delete(total_address_arr[2])
    expect(shipped_address.shipped_to.text_value.split("\n")). to eql(total_address_arr)
  else
    expect(shipped_address.shipped_to.text_value). to eql(total_address)
  end
end


Then /^expect address shipped to contains (\d+) lines$/ do |lines|
  shipped_address = SdcHistory.details.addresses
  address = shipped_address.shipped_to.text_value
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

