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

Then /^expect value of cost code in history print details panel is (?:correct|(.*))$/ do |str|
  history_detail_cost_code = SdcHistory.details.reference.cost_code
  history_detail_cost_code.text_field.safe_wait_until_present(timeout: 15)
  history_detail_cost_code.text_field.scroll_into_view
  history_detail_cost_code.text_field.flash
  str ||= TestData.hash[:cost_code]
  actual_value = history_detail_cost_code.text_field.text_value
  expect(actual_value.strip).to eql str.strip
end

Then /^expect file claim link on the transaction detail panel is available$/ do
history_detail=SdcHistory.details
expect(history_detail.file_claim.present?).to be (true)
end

Then /^expect file claim link on the transaction detail panel is enabled$/ do
  history_detail=SdcHistory.details
  expect(history_detail.file_claim.enabled?).to be (true)
end

Then /^click file claim link on transaction detail panel$/ do
  history_detail=SdcHistory.details
  history_detail.file_claim.safe_wait_until_present(timeout: 10)
  history_detail.file_claim.click
  step 'expect insurance claim form modal is displayed'
end

Then /^expect email tracking info link on the transaction detail panel is available$/ do
  history_detail=SdcHistory.details
  expect(history_detail.email_tracking_info.present?).to be (true)
end

Then /^expect email tracking info link on the transaction detail panel is enabled$/ do
  history_detail=SdcHistory.details
  expect(history_detail.email_tracking_info.enabled?).to be (true)
end

Then /^click email tracking info link on transaction detail panel$/ do
  history_detail=SdcHistory.details
  history_detail.file_claim.safe_wait_until_present(timeout: 10)
  history_detail.email_tracking_info.click
end


#Header Menu

Then /^click transaction details header menu dropdown$/ do
  history_detail=SdcHistory.details.header
  history_detail.toolbar_menu.safe_wait_until_present(timeout: 10)
  history_detail.toolbar_menu.click
end

Then /^expect email tracking info link on the transaction detail menu dropdown is available$/ do
  history_detail=SdcHistory.details.header
  expect(history_detail.email_tracking_info.present?).to be (true)
end

Then /^click email tracking info link on transaction detail menu dropdown$/ do
  history_detail=SdcHistory.details.header
  history_detail.email_tracking_info.safe_wait_until_present(timeout: 10)
  history_detail.email_tracking_info.click
end

Then /^expect print receipt link on the transaction detail menu dropdown is available$/ do
  history_detail=SdcHistory.details.header
  expect(history_detail.print_receipt.present?).to be (true)
end

Then /^click print receipt link on transaction detail menu dropdown$/ do
  history_detail=SdcHistory.details.header
  history_detail.print_receipt.safe_wait_until_present(timeout: 10)
  history_detail.print_receipt.click
end

Then /^expect file claim link on the transaction detail menu dropdown is available$/ do
history_detail=SdcHistory.details.header
expect(history_detail.file_claim.present?).to be (true)
end

Then /^click file claim link on transaction detail menu dropdown$/ do
  history_detail=SdcHistory.details.header
  history_detail.file_claim.safe_wait_until_present(timeout: 10)
  history_detail.file_claim.click
  step 'expect insurance claim form modal is displayed'
end

#Services

Then /^expect file claim link in services section of transaction detail panel is available$/ do
  services=SdcHistory.details.services
  expect(services.file_claim.present?).to be (true)
end

Then /^expect file claim link in services section of transaction detail panel is enabled$/ do
  services=SdcHistory.details.services
  expect(services.file_claim.enabled?).to be (true)
end

Then /^click file claim link in services section of transaction detail panel$/ do
  services=SdcHistory.details.services
  services.file_claim.safe_wait_until_present(timeout: 10)
  services.file_claim.click
  step 'expect insurance claim form modal is displayed'
end


