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

Then /^expect transaction details for single print is available$/ do
  step 'wait while loading history details panel'
  expect(SdcHistory.details.header.title).to be_present
end

Then /^expect transaction details for multiple print is available$/ do
  step 'wait while loading history details panel'
  expect(SdcHistory.multiple_details.header.title).to be_present
end


Then /^expect create return label link on the transaction detail menu dropdown is available$/ do
  history_detail=SdcHistory.details.header
  history_detail.create_return_label.flash
  expect(history_detail.create_return_label.present?).to be (true)
end

Then /^expect collapse panel link on the transaction detail menu dropdown is available$/ do
  history_detail=SdcHistory.details.header
  history_detail.collapse_panel.flash
  expect(history_detail.collapse_panel.present?).to be (true)
end

Then /^expect track on usps.com link on the transaction detail menu dropdown is available$/ do
  history_detail=SdcHistory.details.header
  history_detail.track_on_usps.flash
  expect(history_detail.track_on_usps.present?).to be (true)
end

Then /^expect collapse panel link on the transaction multiple detail menu dropdown is available$/ do
  history_detail=SdcHistory.multiple_details.header
  history_detail.collapse_panel.flash
  expect(history_detail.collapse_panel.present?).to be (true)
end

Then /^expect printed status on history transaction details is present$/ do
  step 'wait while loading history details panel'
  SdcHistory.details.status.blur_out
  expect(SdcHistory.details.status).to be_present
end

Then /^expect printed status is not present on history transaction details$/ do
  expect(SdcHistory.details.status).not_to be_present
end

Then /^expect email tracking info present on history transaction details$/ do
  email = SdcHistory.details.email_tracking_info
  email.flash
  expect(email).to be_present
end

Then /^except create return label on history transaction details is enabled$/ do
  return_label = SdcHistory.details.create_return_label
  return_label.flash
  expect(return_label.attribute_value('class').include?('disabled')).to be false
end

Then /^except create return label on history transaction details is disabled$/ do
  return_label = SdcHistory.details.create_return_label
  return_label.flash
  expect(return_label.attribute_value('class').include?('disabled')).to be true
end

Then /^expect tracking number on history transaction details is (?:correct|(.*))$/ do |tracking_number|
  tracking = SdcHistory.details.tracking_number
  tracking_number ||= TestData.hash[:tracking_number]
  tracking.flash
  expect(tracking.text_value.to_s). to eql(tracking_number.to_s)
end

Then /click tracking number link on history transaction details$/ do
  tracking = SdcHistory.details.tracking_number
  tracking.click

end

Then /expect status displayed below tracking number link on history transaction details is (.*)$/ do |status|
  tracking_status = SdcHistory.details.tracking_link_status
  tracking_status.tracking_number_status.flash
  expect(tracking_status.tracking_number_status.text_value).to eql(status.to_s.upcase)
end

Then /^expect shipped to field on history transaction details is present$/ do
  details = SdcHistory.details.addresses
  details.shipped_to_label.flash
  expect(details.shipped_to_label).to be_present
end

Then /^expect shipped from field on history transaction details is present$/ do
  details = SdcHistory.details.addresses
  details.shipped_from_label.flash
  expect(details.shipped_from_label).to be_present
end

Then /^expect return to field on history transaction details is present$/ do
  details = SdcHistory.details.addresses
  details.return_to_label.flash
  expect(details.return_to_label).to be_present
end

Then /^expect carrier field on history transaction details is present$/ do
  details = SdcHistory.details.services
  details.carrier_label.flash
  expect(details.carrier_label).to be_present
end

Then /^expect service field on history transaction details is present$/ do
  details = SdcHistory.details.services
  details.service_label.scroll_into_view
  details.service_label.flash
  expect(details.service_label).to be_present
end

Then /^expect packing field on history transaction details is present$/ do
  details = SdcHistory.details.services
  details.packaging_label.scroll_into_view
  details.packaging_label.flash
  expect(details.packaging_label).to be_present
end

Then /^expect insurance field on history transaction details is present$/ do
  details = SdcHistory.details.services
  details.insurance_label.flash
  expect(details.insurance_label).to be_present
end

Then /^expect tracking field on history transaction details is present$/ do
  details = SdcHistory.details.services
  details.tracking_label.flash
  expect(details.tracking_label).to be_present
end

Then /^expect weight field on history transaction details is present$/ do
  details = SdcHistory.details.services
  details.weight_label.flash
  expect(details.weight_label).to be_present
end

Then /^expect cost code field on history transaction details is present$/ do
  details = SdcHistory.details.reference.cost_code
  details.cost_code_label.flash
  expect(details.cost_code_label).to be_present
end

Then /^expect user field on history transaction details is present$/ do
  details = SdcHistory.details.reference
  details.user_label.flash
  expect(details.user_label).to be_present
end

Then /^expect printed on field on history transaction details is present$/ do
  details = SdcHistory.details.reference
  details.printed_on_label.flash
  expect(details.printed_on_label).to be_present
end

Then /^save history grid recipient name in recipient column at row (\d+)$/ do |row|
  SdcHistory.grid.body.safe_wait_until_present(timeout: 60)
  column = SdcHistory.grid.grid_column(:recipient)
  recipient_value = column.text_at_row(row)
  recipient_value = recipient_value.split(",")
  TestData.hash["recipient_name_#{row}"] = recipient_value[0]
  SdcLogger.info "Recipient name at #{row}  is #{TestData.hash["recipient_name_#{row}"]}"
end

Then /^expect recipient names in history details is (?:correct|(.*))$/ do |name|
  details = SdcHistory.multiple_details.header
  list_count = details.recipient_name_list.count
  i = 1
  while i <= list_count
    expect(details.recipient_name(i).text_value.strip.to_s). to eq(TestData.hash["recipient_name_#{i}"].strip.to_s)
    details.recipient_name(i).flash
    SdcLogger.info "#{details.recipient_name(i).text_value} is present"
    i = i+1
  end
end

Then /^click transaction multiple details header menu dropdown$/ do
  history_detail=SdcHistory.multiple_details.header
  history_detail.toolbar_menu.safe_wait_until_present(timeout: 10)
  history_detail.toolbar_menu.click
end







