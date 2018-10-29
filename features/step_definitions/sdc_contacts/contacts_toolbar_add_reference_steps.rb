Then /^set reference number to (.*)$/ do |value|
  ref = SdcContacts.modals.add_reference
  ref.reference_num.wait_until_present(timeout:15)
  ref.reference_num.set(value)
  SdcLogger.info "value: #{value}"
end

Then /^click on add reference close button$/ do
  ref = SdcContacts.modals.add_reference
  ref.close.safe_wait_until_present(timeout:15)
  ref.close.click
end

Then /^click on add reference save button$/ do
  ref = SdcContacts.modals.add_reference
  ref.save_button.wait_until_present(timeout:15)
  ref.save_button.click
end

Then /^expect reference number error is displayed$/ do
  ref = SdcContacts.modals.add_reference
  ref.reference_error.wait_until_present(timeout:15)
  expect(ref.reference_error.present?).to be(true)
end

Then /^expect reference number error is not displayed$/ do
  ref = SdcContacts.modals.add_reference
  SdcLogger.info "availability :#{ref.reference_error.present?}"
  expect(ref.reference_error.present?).to be(false)
end