
Then /^expect orders modal verifying rates is present$/ do
  verifying_rates = SdcOrders.modals.verifying_rates
  verifying_rates.wait_until_present(timeout: 3)
  expect(verifying_rates).to be_present
end

Then /^expect orders modal verifying rates is not present$/ do
  verifying_rates = SdcOrders.modals.verifying_rates
  verifying_rates.wait_while_present(timeout: 30)
  expect(verifying_rates).not_to be_present
end

Then /^expect orders modal no orders is present$/ do
  expect(SdcOrders.modals.no_orders.title).to be_present
end

Then /^expect orders modal no orders is not present$/ do
  expect(SdcOrders.modals.no_orders.title).not_to be_present
end

Then /^close orders modal no orders$/ do
  SdcOrders.modals.no_orders.x_btn.click
  step 'expect orders modal no orders is not present'
end
