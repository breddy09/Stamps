Then /^blur out on extra services form$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.total.blur_out
  extra_services.title.blur_out
end

Then /^expect extra services cod is present$/ do
  expect(SdcMail.modals.extra_services.cod).to be_present
end

Then /^set extra services cod to (\d*.?\d+)$/ do |amount|
  step 'expect extra services cod is present'
  SdcMail.modals.extra_services.cod.set(amount)
  step "expect extra services cod value is #{amount}"
end

Then /^increment extra services cod by (\d+)$/ do |amount|
  step 'expect extra services cod is present'
  cod_value = SdcMail.modals.extra_services.cod.text_value.to_f
  amount.times do
    SdcMail.modals.extra_services.cod.increment.click
  end
  step "expect extra services cod value is #{cod_value+amount.to_f}"
end

Then /^decrement extra services cod by (\d+)$/ do |amount|
  step 'expect extra services cod is present'
  cod_value = SdcMail.modals.extra_services.cod.text_value.to_f
  amount.times do
    SdcMail.modals.extra_services.cod.decrement.click
  end
  step "expect extra services cod value is #{cod_value-amount.to_f}"
end

Then /^expect extra services cod value is (\d*.?\d+)$/ do |amount|
  step 'expect extra services cod is present'
  expect(SdcMail.modals.extra_services.cod.text_value.to_f).to eql(amount.to_f)
end

Then /^expect extra services cod price to be (\d*.?\d+)$/ do |expectation|
  SdcMail.modals.extra_services.cod_price.wait_until_present(timeout: 10)
  expect(SdcMail.modals.extra_services.cod_price.text_value.parse_digits.to_f.round(2)).to eql(expectation.to_f.round(2))
end

Then /^expect extra services save button is present$/ do
  expect(SdcMail.modals.extra_services.save).to be_present
end

Then /^save extra services$/ do
  step 'expect extra services modal is present'
  extra_services = SdcMail.modals.extra_services
  extra_services.title.blur_out
  extra_services.save.click
  extra_services.save.wait_while_present(timeout: 5)
  step 'expect extra services modal is not present'
end

Then /^expect extra services modal is present$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  expect(extra_services.title.text_value).to eql 'Extra Services'
end

Then /^expect extra services modal is not present$/ do
  expect(SdcMail.modals.extra_services.title).not_to be_present
end

Then /^close extra services$/ do
  step 'expect extra services modal is present'
  SdcMail.modals.extra_services.x_btn.click
  step 'expect extra services modal is not present'
end

Then /^expect extra services security is present$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  expect(extra_services.security.drop_down).to be_present
  expect(extra_services.security.text_field).to be_present
end

Then /^set extra services security to (.*)$/ do |value|
  security = SdcMail.modals.extra_services.security
  security.selection_element('selection', value)
  security.drop_down.click unless security.selection.present?
  expect(security.selection).to be_present
  security.selection.click

  if value.eql? 'Registered Mail'
    step 'click value must be shown window continue button'
  end
  step 'blur out on extra services form'
end

Then /^expect extra services security is (.*)$/ do |value|
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  expect(extra_services.security.text_field.text_value).to eql(value)
end

Then /^expect value must be shown modal is present$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  expect(extra_services.value_must_be_shown.title).to be_present
end

Then /^expect value must be shown modal is not present$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  expect(extra_services.value_must_be_shown.title).not_to be_present
end

Then /^click value must be shown window continue button$/ do
  value_must_be_shown = SdcMail.modals.extra_services.value_must_be_shown
  value_must_be_shown.title.safe_wait_until_present(timeout: 5)
  expect(value_must_be_shown.title.text_value).to eql 'Value Must be Shown'
  value_must_be_shown.continue.click
  value_must_be_shown.continue.wait_while_present(timeout: 5)
  step 'blur out on extra services form'
  step 'expect value must be shown modal is not present'
end

Then /^expect special contents warning modal is present$/ do
  expect(SdcMail.modals.special_contents_warning.title).to be_present
end

Then /^expect special contents warning modal is not present$/ do
  expect(SdcMail.modals.special_contents_warning.title).not_to be_present
end

Then /^click special contents warning modal i agree$/ do
  SdcMail.modals.special_contents_warning.i_agree.click
  step 'expect special contents warning modal is not present'
end

Then /^expect extra services security price to be (.+)$/ do |expectation|
  extra_services = SdcMail.modals.extra_services
  extra_services.security_price.wait_until_present(timeout: 5)
  result = extra_services.security_price.text_value.parse_digits.to_f.round(2)
  expect(result).to eql(expectation.to_f.round(2))
end

# why we need this?
Then /^expect extra services security value is enabled$/ do
  expect(SdcMail.modals.extra_services.extra_services.value.enabled?).to be_truthy
end

Then /^set extra services security value to (\d*.?\d+)$/ do |value|
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  extra_services.value.set(value)
end

Then /^increment extra services security value by (\d+)$/ do |value|
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  price = extra_services.value.text_value.to_f
  value.times do
    extra_services.value.increment.click
  end
  step "expect extra services security value is #{price + value.to_f}"
end

Then /^decrement extra services security value by (\d+)$/ do |value|
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  price = extra_services.value.text_value.to_f
  value.times do
    extra_services.value.decrement.click
  end
  step "expect extra services security value is #{price - value.to_f}"
end

Then /^expect extra services security value is (\d*.?\d+)$/ do |value|
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  expect(extra_services.value.text_value.to_f).to eql(value.to_f)
end

Then /^set extra services handling to (.*)$/ do |str|
  handling = SdcMail.modals.extra_services.handling
  handling.selection_element("selection", str)
  handling.drop_down.click
  expect(handling.selection).to be_present
  handling.selection.click
end

Then /^expect extra services handling is (.*)$/ do |str|
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  expect(extra_services.handling.text_field.text_value).to eql(str)
end

Then /^check extra services modal return receipt$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  extra_services.return_receipt.check
  step 'expect extra services modal return receipt is checked'
end

Then /^uncheck extra services modal return receipt$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  extra_services.return_receipt.uncheck
  step 'expect extra services modal return receipt is unchecked'
end

Then /^expect extra services modal return receipt is checked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  expect(extra_services.return_receipt.checked?).to be_truthy
end

Then /^expect extra services modal return receipt is unchecked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  expect(extra_services.return_receipt.checked?).not_to be_truthy
end

Then /^expect extra services modal return receipt price to be (\d*.?\d+)$/ do |expectation|
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  result = extra_services.return_receipt_price.text_value.parse_digits.to_f.round(2)
  expect(result).to eql(expectation.to_f.round(2))
end

Then /^check extra services modal restricted delivery$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  extra_services.restricted_delivery.check
  step 'expect extra services modal restricted delivery is checked'
end

Then /^uncheck extra services modal restricted delivery$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  extra_services.restricted_delivery.uncheck
  step 'expect extra services modal restricted delivery is unchecked'
end

Then /^expect extra services modal restricted delivery is checked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  expect(extra_services.restricted_delivery.checked?).to be(true)
end

Then /^expect extra services modal restricted delivery is unchecked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  expect(extra_services.restricted_delivery.checked?).to be(false)
end

Then /^expect extra services modal restricted delivery price to be (\d*.?\d+)$/ do |expectation|
  extra_services = SdcMail.modals.extra_services
  extra_services.restricted_delivery_price.safe_wait_until_present(timeout: 10)
  result = extra_services.restricted_delivery_price.text_value.parse_digits.to_f.round(2)
  expect(result).to eql(expectation.to_f.round(2))
end

Then /^check extra services fragile$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  extra_services.fragile.check
  step 'expect extra services fragile is checked'
end

Then /^expect extra services fragile is checked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  expect(extra_services.fragile.checked?).to be(true)
end

Then /^expect extra services fragile cost to be \$(.+)$/ do |str|
  extra_services = SdcMail.modals.extra_services
  extra_services.fragile.cost.safe_wait_until_present(timeout: 3)
  expect(extra_services.fragile.cost.present?).to be(true)
  expect(extra_services.fragile.cost.text_value.gsub('$', '')).to eql(str)
end

Then /^expect extra services fragile cost is greater than \$(.+)$/ do |str|
  extra_services = SdcMail.modals.extra_services
  extra_services.fragile.cost.safe_wait_until_present(timeout: 3)
  expect(extra_services.fragile.cost.present?).to be(true)
  expect(extra_services.fragile.cost.text_value.gsub('$', '').to_f).to be > str.to_f
end

Then /^uncheck extra services fragile$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  extra_services.fragile.uncheck
  step 'expect extra services fragile is unchecked'
end

Then /^expect extra services fragile is unchecked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  expect(extra_services.fragile.checked?).to be(false)
end

Then /^check extra services non-rectangular$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  extra_services.non_rectangular.check
  step 'expect extra services non-rectangular is checked'
end

Then /^uncheck extra services non-rectangular$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  extra_services.non_rectangular.uncheck
  step 'expect extra services non-rectangular is unchecked'
end

Then /^expect extra services non-rectangular is checked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  expect(extra_services.non_rectangular.checked?).to be(true)
end

Then /^expect extra services non-rectangular is unchecked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  expect(extra_services.non_rectangular.checked?).to be(false)
end

Then /^expect extra services total cost is \$(\d*.?\d+)$/ do |expectation|
  extra_services = SdcMail.modals.extra_services
  result = extra_services.total.text_value.parse_digits.to_f.round(2)
  expect(result).to eql(expectation.to_f.round(2))
end

Then /^check extra services hold for pickup$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.wait_until_present(timeout: 5)
  extra_services.hold_for_pickup.check
  step 'expect extra services hold for pickup is checked'
end

Then /^uncheck extra services hold for pickup$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.wait_until_present(timeout: 5)
  extra_services.hold_for_pickup.uncheck
  step 'expect extra services hold for pickup is unchecked'
end

Then /^expect extra services hold for pickup is checked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  expect(extra_services.hold_for_pickup.checked?).to be(true)
end

Then /^expect extra services hold for pickup is unchecked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  expect(extra_services.hold_for_pickup.checked?).to be(false)
end

Then /^expect extra services hold for pickup price is $(\d*.?\d+)$/ do |expectation|
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  result = extra_services.hold_for_pickup_price.text_value.parse_digits.to_f.round(2)
  expect(result).to eql(expectation.to_f.round(2))
end

Then /^click extra services form 3811$/ do
  step 'expect form 3811 modal is not present'
  SdcMail.modals.extra_services.form_3811.click
  step 'expect form 3811 modal is present'
end

Then /^click extra services label 200$/ do
  step 'expect label 200 modal is not present'
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  extra_services.label_200_or_200n.click
  step 'expect label 200 modal is present'
end

Then /^expect extra services restricted delivery is is present$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 10)
  expect(extra_services.restricted_delivery.present?).to be true
end

Then /^check extra services restricted delivery$/ do
  step 'blur out on print form'
  extra_services = SdcMail.modals.extra_services
  extra_services.window.wait_until_present(timeout: 5)
  extra_services.restricted_delivery.check
  step 'expect extra services restricted delivery is checked'
end

Then /^uncheck extra services restricted delivery$/ do
  step 'blur out on print form'
  extra_services = SdcMail.modals.extra_services
  extra_services.window.wait_until_present(timeout: 5)
  extra_services.restricted_delivery.uncheck
  step 'expect extra services restricted delivery is unchecked'
end

Then /^expect extra services restricted delivery is checked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.wait_until_present(timeout: 5)
  expect(extra_services.restricted_delivery.checked?).to be(true)
end

Then /^expect extra services restricted delivery is unchecked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.wait_until_present(timeout: 5)
  expect(extra_services.restricted_delivery.checked?).to be(false)
end

Then /^expect extra services restricted delivery price to be (\d*.?\d+)$/ do |expectation|
  extra_services = SdcMail.modals.extra_services
  extra_services.window.wait_until_present(timeout: 5)
  result = extra_services.restricted_delivery_price.text_value.parse_digits.to_f.round(2)
  expect(result).to eql(expectation.to_f.round(2))
end

Then /^expect extra services return receipt is present$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.wait_until_present(timeout: 5)
  expect(extra_services.return_receipt.present?).to be(true)
end

Then /^expect extra services return receipt is not present$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.wait_until_present(timeout: 5)
  expect(extra_services.return_receipt.present?).to be(false)
end

Then /^check extra services return receipt$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.return_receipt.check unless extra_services.return_receipt.checked?
  step 'expect extra services return receipt is checked'
end

Then /^uncheck extra services return receipt$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.return_receipt.uncheck if extra_services.return_receipt.checked?
  step 'expect extra services return receipt is unchecked'
end

Then /^expect extra services return receipt is checked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.wait_until_present(timeout: 5)
  expect(extra_services.return_receipt.checked?).to be true
end

Then /^expect extra services return receipt is unchecked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.wait_until_present(timeout: 5)
  expect(extra_services.return_receipt.checked?).not_to be false
end

Then /^expect extra services return receipt is disabled$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.wait_until_present(timeout: 5)
  expect(extra_services.return_receipt.class_disabled?).to be false
end

Then /^expect extra services return receipt price to be (\d*.?\d+)$/ do |str|
  extra_services = SdcMail.modals.extra_services
  extra_services.return_receipt_price.wait_until_present(timeout: 5)
  result = extra_services.return_receipt_price.text_value.parse_digits.to_f.round(2)
  expect(result).to eql(str.to_f.round(2))
end




