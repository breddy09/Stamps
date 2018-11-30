
Then /^expect address shipped to in transaction details displays saved address$/ do
  shipped_address = SdcHistory.details.addresses
  expect(shipped_address.shipped_to.text_value). to eql(TestData.hash[:address])
end
