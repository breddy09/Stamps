
Then /^(?:C|c)lick (?:Order Details|Print) form Edit Form button$/ do
  stamps.orders.order_details.customs.edit_form if param.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_form if param.web_app == :mail
end

Then /^(?:B|b)lur out on Customs form(?:| (\d+)(?:| times))$/ do |count|
  count = (count.nil?)?1:count.to_i
  count.times { stamps.orders.order_details.customs.edit_form.blur_out } if param.web_app == :orders
  count.times { stamps.mail.print_form.mail_customs.edit_form.blur_out } if param.web_app == :mail
end

Then /^(?:S|s)et Customs form Package Contents to (.*)$/ do |value|
  test_parameter[:customs_package_contents] = value
  stamps.orders.order_details.customs.edit_form.package_contents.select(test_parameter[:customs_package_contents]) if param.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_form.package_contents.select(test_parameter[:customs_package_contents]) if param.web_app == :mail
  step "Save Customs Information form Total amount"
end

Then /^(?:E|e)xpect Customs form Package Contents is (?:correct|(.*))$/ do |expectation|
  expectation = (expectation.nil?)?test_parameter[:customs_package_contents] : expectation
  sleep(0.15)
  expect(stamps.orders.order_details.customs.edit_form.package_contents.combo_box.text_box.text).to eql(expectation) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.package_contents.combo_box.text_box.text).to eql(expectation) if param.web_app == :mail
end

Then /^(?:S|s)et Customs form Non-Delivery Options to (.*)$/ do |value|
  test_parameter[:customs_non_delivery_options] = value
  stamps.orders.order_details.customs.edit_form.non_delivery_options.select(test_parameter[:customs_non_delivery_options]) if param.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_form.non_delivery_options.select(test_parameter[:customs_non_delivery_options]) if param.web_app == :mail
end

Then /^(?:E|e)xpect Customs form Non-Delivery Options is (?:correct|(.*))$/ do |expectation|
  expectation = (expectation.nil?)?test_parameter[:customs_non_delivery_options] : expectation
  expect(stamps.orders.order_details.customs.edit_form.non_delivery_options.text_box.text).to eql(expectation) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.non_delivery_options.text_box.text).to eql(expectation) if param.web_app == :mail
end

Then /^(?:S|s)et Customs form Internal Transaction Number to (.*)$/ do |value|
  test_parameter[:customs_internal_transaction_no] = value
  stamps.orders.order_details.customs.edit_form.internal_transaction.select(test_parameter[:customs_internal_transaction_no]) if param.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_form.internal_transaction.select(test_parameter[:customs_internal_transaction_no]) if param.web_app == :mail
  step "Save Customs Information form Total amount"
end

Then /^(?:E|e)xpect Customs form Internal Transaction Number is (?:correct|(.*))$/ do |expectation|
  expectation = (expectation.nil?)?test_parameter[:customs_internal_transaction_no] : expectation
  sleep(0.5)
  expect(stamps.orders.order_details.customs.edit_form.internal_transaction.text_box.text).to eql(expectation) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.internal_transaction.text_box.text).to eql(expectation) if param.web_app == :mail
end

Then /^(?:S|s)et Customs form More Info to (?:(?:a|some) random string|(.*))$/ do |value|
  test_parameter[:customs_more_info] = (value.nil?)?ParameterHelper.random_alpha_numeric(18):value
  stamps.orders.order_details.customs.edit_form.package_contents.contents.more_info.set(test_parameter[:customs_more_info]) if param.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_form.package_contents.contents.more_info.set(test_parameter[:customs_more_info]) if param.web_app == :mail
  step "Save Customs Information form Total amount"
end

Then /^(?:E|e)xpect Customs form More Info is (?:correct|(.*))$/ do |expectation|
  expectation = (expectation.nil?)?test_parameter[:customs_more_info] : expectation
  sleep(0.5)
  expect(stamps.orders.order_details.customs.edit_form.package_contents.contents.more_info.text).to eql(expectation) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.package_contents.contents.more_info.text).to eql(expectation) if param.web_app == :mail
end

Then /^(?:S|s)et Customs form ITN Number to (?:(?:a|some) random string|(.*))$/ do |value|
  test_parameter[:customs_itn_no] = (value.nil?)?ParameterHelper.random_alpha_numeric(50):value
  stamps.orders.order_details.customs.edit_form.itn_number.set(test_parameter[:customs_itn_no]) if param.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_form.itn_number.set(test_parameter[:customs_itn_no]) if param.web_app == :mail
  step "Save Customs Information form Total amount"
end

Then /^(?:E|e)xpect Customs form ITN Number is (?:correct|(.*))$/ do |expectation|
  expectation = (expectation.nil?)?test_parameter[:customs_itn_no] : expectation
  sleep(0.5)
  expect(stamps.orders.order_details.customs.edit_form.itn_number.text).to eql(expectation) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.itn_number.text).to eql(expectation) if param.web_app == :mail
end

Then /^(?:S|s)et Customs form License Number to (?:(?:a|some) random string|(.*))$/ do |value|
  test_parameter[:customs_license_no] = ((value.nil?)?ParameterHelper.random_alpha_numeric(6): value)
  stamps.orders.order_details.customs.edit_form.package_contents.contents.license.set(test_parameter[:customs_license_no]) if param.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_form.package_contents.contents.license.set(test_parameter[:customs_license_no]) if param.web_app == :mail
  step "Save Customs Information form Total amount"
end

Then /^(?:E|e)xpect Customs form License Number is (?:correct|(.*))$/ do |expectation|
  expectation = (expectation.nil?)?test_parameter[:customs_license_no] : expectation
  sleep(0.5)
  expect(stamps.orders.order_details.customs.edit_form.package_contents.contents.license.text).to eql(expectation) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.package_contents.contents.license.text).to eql(expectation) if param.web_app == :mail
  step "Save Customs Information form Total amount"
end

Then /^(?:S|s)et Customs form Certificate Number to (?:(?:a|some) random string|(.*))$/ do |value|
  test_parameter[:customs_certificate_no] = ((value.nil?)?ParameterHelper.random_alpha_numeric(8):value)
  stamps.orders.order_details.customs.edit_form.package_contents.contents.certificate.set(test_parameter[:customs_certificate_no]) if param.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_form.package_contents.contents.certificate.set(test_parameter[:customs_certificate_no]) if param.web_app == :mail
  step "Save Customs Information form Total amount"
end

Then /^(?:E|e)xpect Customs form Certificate Number is (?:correct|(.*))$/ do |expectation|
  expectation = (expectation.nil?)?test_parameter[:customs_certificate_no]:expectation
  sleep(0.5)
  expect(stamps.orders.order_details.customs.edit_form.package_contents.contents.certificate.text).to eql(expectation) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.package_contents.contents.certificate.text).to eql(expectation) if param.web_app == :mail
end

Then /^(?:S|s)et Customs form Invoice Number to (?:(?:a|some) random string|(.*))$/ do |value|
  test_parameter[:customs_invoice_no] = (value.nil?)?ParameterHelper.random_alpha_numeric(10):value
  stamps.orders.order_details.customs.edit_form.package_contents.contents.invoice.set(test_parameter[:customs_invoice_no]) if param.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_form.package_contents.contents.invoice.set(test_parameter[:customs_invoice_no]) if param.web_app == :mail
  step "Save Customs Information form Total amount"
end

Then /^(?:E|e)xpect Customs form Invoice Number is (?:correct|(.*))$/ do |expectation|
  expectation = (expectation.nil?)?test_parameter[:customs_invoice_no]:expectation
  sleep(0.5)
  expect(stamps.orders.order_details.customs.edit_form.package_contents.contents.invoice.text).to eql(expectation) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.package_contents.contents.invoice.text).to eql(expectation) if param.web_app == :mail
end

Then /^(?:D|d)elete Customs form Associated Item (\d+)$/ do |item_number|
  element = stamps.orders.order_details.customs.edit_form.associated_items if param.web_app == :orders
  element = stamps.mail.print_form.mail_customs.edit_form.associated_items if param.web_app == :mail
  count = element.size
  line_item = element.item_number(item_number.to_i)
  if count > 1
    line_item.delete.click_while_present
  else
    line_item.delete.safe_click
  end
end

Then /^(?:C|c)heck Customs form I agree to the USPS Privacy Act Statement$/ do
  stamps.orders.order_details.customs.edit_form.i_agree.check if param.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_form.i_agree.check if param.web_app == :mail
end

Then /^(?:E|e)xpect Customs form I agree to the USPS Privacy Act Statement is checked$/ do
  sleep(0.5)
  expect(stamps.orders.order_details.customs.edit_form.i_agree.checked?).to be(true) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.i_agree.checked?).to be(true) if param.web_app == :mail
end

Then /^(?:U|u)ncheck Customs form I agree to the USPS Privacy Act Statement$/ do
  stamps.orders.order_details.customs.edit_form.i_agree.uncheck if param.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_form.i_agree.uncheck if param.web_app == :mail
end

Then /^(?:E|e)xpect Customs form I agree to the USPS Privacy Act Statement is unchecked$/ do
  sleep(0.05)
  expect(stamps.orders.order_details.customs.edit_form.i_agree.checked?).to be(false) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.i_agree.checked?).to be(false) if param.web_app == :mail
end

Then /^(?:C|c)lick Customs form Close button$/ do
  step "Pause for 4 seconds"
  step "Blur out on Customs form 20 times"
  step "Save Customs Information form Total amount"
  expect(stamps.orders.order_details.customs.edit_form.close).to be(false) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.close).to be(false) if param.web_app == :mail
  step "On Order Details form, blur out"
  step "Save Order Details data"
end

Then /^Cancel Customs Form$/ do
  step "Blur out on Customs form"
  expect(stamps.orders.order_details.customs.edit_form.cancel).to be(false) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.cancel).to be(false) if param.web_app == :mail
  step "Save Order Details data"
end

Then /^(?:E|e)xpect Customs form USPS Privacy Act Warning is visible$/ do
  step "Blur out on Customs form"
  sleep(0.5)
  expect(stamps.orders.order_details.customs.edit_form.usps_privacy_act_warning.visible?).to be(true) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.usps_privacy_act_warning.visible?).to be(true) if param.web_app == :mail
end

Then /^(?:E|e)xpect Customs form USPS Privacy Act Warning is hidden$/ do
  step "Blur out on Customs form"
  sleep(0.5)
  expect(stamps.orders.order_details.customs.edit_form.usps_privacy_act_warning.visible?).to be(false) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.usps_privacy_act_warning.visible?).to be(false) if param.web_app == :mail
end

Then /^(?:E|e)xpect Customs form More Info is hidden$/ do
  step "Blur out on Customs form"
  sleep(0.5)
  expect(stamps.orders.order_details.customs.edit_form.package_contents.contents.more_info.present?).to be(false) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.package_contents.contents.more_info.present?).to be(false) if param.web_app == :mail
end

Then /^(?:E|e)xpect Customs form More Info is visible$/ do
  step "Blur out on Customs form"
  sleep(0.5)
  expect(stamps.orders.order_details.customs.edit_form.package_contents.contents.more_info.present?).to be(true) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.package_contents.contents.more_info.present?).to be(true) if param.web_app == :mail
end

Then /^(?:E|e)xpect Customs form License Number is visible$/ do
  step "Blur out on Customs form"
  sleep(0.5)
  expect(stamps.orders.order_details.customs.edit_form.package_contents.contents.license.present?).to be(true) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.package_contents.contents.license.present?).to be(true) if param.web_app == :mail
end

Then /^(?:E|e)xpect Customs form License Number is hidden$/ do
  step "Blur out on Customs form"
  sleep(0.5)
  expect(stamps.orders.order_details.customs.edit_form.package_contents.contents.license.present?).to be(false) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.package_contents.contents.license.present?).to be(false) if param.web_app == :mail
end

Then /^(?:E|e)xpect Customs form Certificate Number is hidden$/ do
  expect(stamps.orders.order_details.customs.edit_form.package_contents.contents.certificate.present?).to be(false) if param.web_app == :orders
  expect(stamps.orders.order_details.customs.edit_form.package_contents.contents.certificate.present?).to be(false) if param.web_app == :mail
end

Then /^(?:E|e)xpect Customs form Certificate Number is visible$/ do
  step "Blur out on Customs form"
  sleep(0.5)
  expect(stamps.orders.order_details.customs.edit_form.package_contents.contents.certificate.present?).to be(true) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.package_contents.contents.certificate.present?).to be(true) if param.web_app == :mail
end

Then /^(?:E|e)xpect Customs form Invoice Number is hidden$/ do
  step "Blur out on Customs form"
  sleep(0.5)
  expect(stamps.orders.order_details.customs.edit_form.package_contents.contents.invoice.present?).to be(false) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.package_contents.contents.invoice.present?).to be(false) if param.web_app == :mail
end

Then /^(?:E|e)xpect Customs form Invoice Number is visible$/ do
  step "Blur out on Customs form"
  sleep(0.5)
  expect(stamps.orders.order_details.customs.edit_form.package_contents.contents.invoice.present?).to be(true) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.package_contents.contents.invoice.present?).to be(true) if param.web_app == :mail
end

Then /^(?:E|e)xpect Customs form ITN Number is hidden$/ do
  step "Blur out on Customs form"
  sleep(0.5)
  expect(stamps.orders.order_details.customs.edit_form.itn_number.enabled?).to be(false) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.itn_number.enabled?).to be(false) if param.web_app == :mail
end

Then /^(?:E|e)xpect Customs form ITN Number is visible$/ do
  step "Blur out on Customs form"
  sleep(0.5)
  expect(stamps.orders.order_details.customs.edit_form.itn_number.enabled?).to be(true) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.itn_number.enabled?).to be(true) if param.web_app == :mail
end

Then /^Expect Customs Form Internal Transaction Number is (.+)$/ do |expectation|
  step "Blur out on Customs form"
  sleep(0.5)
  expect(stamps.orders.order_details.customs.edit_form.internal_transaction.text_box.text).to eql(expectation) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.internal_transaction.text_box.text).to eql(expectation) if param.web_app == :mail
end

Then /^(?:E|e)xpect Customs form Associated Item Grid count is (.+)$/ do |expectation|
  step "Blur out on Customs form"
  sleep(0.5)
  expect(stamps.orders.order_details.customs.edit_form.associated_items.size).to eql(expectation.to_i) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.associated_items.size).to eql(expectation.to_i) if param.web_app == :mail
end

Then /^(?:S|s)ave Customs Information form (?:T|t)otal amount$/ do
  test_parameter[:customs_total_value] = stamps.orders.order_details.customs.edit_form.total_value if param.web_app == :orders
  test_parameter[:customs_total_value] = stamps.mail.print_form.mail_customs.edit_form.total_value if param.web_app == :mail
end

Then /^(?:E|e)xpect Customs form Total Value is (?:correct|(.*))$/ do |expectation|
  expectation = (expectation.nil?)?test_parameter[:customs_total_value] : expectation.to_f.round(2)
  step "Blur out on Customs form"
  expect(stamps.orders.order_details.customs.edit_form.total_value).to eql(expectation) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.total_value).to eql(expectation) if param.web_app == :mail
end

Then /^(?:A|a)dd Customs form Associated Item (\d+), Description (.*), Qty (\d+), Price (.+), Made In (.+), Tariff (.*)$/ do |item_number, description, qty, price, made_in, tariff|
  step "add Customs form Associated Item #{item_number}"
  step "set Customs form Associated Item #{item_number} Description to #{description}"
  step "set Customs form Associated Item #{item_number} Qty to #{qty}"
  step "set Customs form Associated Item #{item_number} Unit Price to #{price}"
  step "set Customs form Associated Item #{item_number} Made In is Country to #{made_in}"
  step "set Customs form Associated Item #{item_number} Tarriff to #{tariff}"
end

Then /^(?:A|a)dd Customs form Associated Item (\d+)$/ do |item_number|
  stamps.orders.order_details.customs.edit_form.associated_items.item_number(item_number.to_i) if param.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_form.associated_items.item_number(item_number.to_i) if param.web_app == :mail
end

Then /^(?:S|s)et Customs form Associated Item (\d+) Description to (.*)$/ do |item_number, value|
  test_parameter[:customs_associated_items][item_number] = Hash.new unless test_parameter[:customs_associated_items].has_key?(item_number)
  test_parameter[:customs_associated_items][item_number][:description] = (value.downcase.include?('random')?(ParameterHelper.random_alpha_numeric):value)
  stamps.orders.order_details.customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_description.set(test_parameter[:customs_associated_items][item_number][:description]) if param.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_description.set(test_parameter[:customs_associated_items][item_number][:description]) if param.web_app == :mail
  step "Save Customs Information form Total amount"
end

Then /^(?:S|s)et Customs form Associated Item (\d+) Qty to (\d+)$/ do |item_number, value|
  test_parameter[:customs_associated_items][item_number] = Hash.new unless test_parameter[:customs_associated_items].has_key?(item_number)
  test_parameter[:customs_associated_items][item_number][:quantity] = value
  stamps.orders.order_details.customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_qty.set(test_parameter[:customs_associated_items][item_number][:quantity]) if param.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_qty.set(test_parameter[:customs_associated_items][item_number][:quantity]) if param.web_app == :mail
  step "Save Customs Information form Total amount"
end

Then /^(?:S|s)et Customs form Associated Item (\d+) Unit Price to (.*)$/ do |item_number, value|
  test_parameter[:customs_associated_items][item_number] = Hash.new unless test_parameter[:customs_associated_items].has_key?(item_number)
  test_parameter[:customs_associated_items][item_number][:price] = value
  stamps.orders.order_details.customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_unit_price.set(test_parameter[:customs_associated_items][item_number][:price]) if param.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_unit_price.set(test_parameter[:customs_associated_items][item_number][:price]) if param.web_app == :mail
  step "Save Customs Information form Total amount"
end

Then /^(?:S|s)et Customs form Associated Item (\d+) Made In is Country to (.*)$/ do |item_number, value|
  test_parameter[:customs_associated_items][item_number] = Hash.new unless test_parameter[:customs_associated_items].has_key?(item_number)
  test_parameter[:customs_associated_items][item_number][:made_in] = value
  stamps.orders.order_details.customs.edit_form.associated_items.item_number(item_number.to_i).made_in.select(test_parameter[:customs_associated_items][item_number][:made_in]) if param.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_form.associated_items.item_number(item_number.to_i).made_in.select(test_parameter[:customs_associated_items][item_number][:made_in]) if param.web_app == :mail
end

Then /^(?:S|s)et Customs form Associated Item (\d+) Tarriff to (.*)$/ do |item_number, value|
  test_parameter[:customs_associated_items][item_number] = Hash.new unless test_parameter[:customs_associated_items].has_key?(item_number)
  test_parameter[:customs_associated_items][item_number][:tarriff] = value
  stamps.orders.order_details.customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_hs_tariff.set(test_parameter[:customs_associated_items][item_number][:tarriff]) if param.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_hs_tariff.set(test_parameter[:customs_associated_items][item_number][:tarriff]) if param.web_app == :mail
  step "Save Customs Information form Total amount"
end

Then /^(?:E|e)xpect Customs form Associated Item (\d+) Description is (?:correct|(.*))$/ do |item_number, expectation|
  expectation = (expectation.nil?)?test_parameter[:customs_associated_items][item_number][:description] : expectation
  sleep(0.5)
  expect(stamps.orders.order_details.customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_description.text).to eql(expectation) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_description.text).to eql(expectation) if param.web_app == :mail
end

Then /^(?:E|e)xpect Customs form Associated Item (\d+) Quantity is (?:correct|(\d+))$/ do |item_number, expectation|
  expectation = (expectation.nil?)?test_parameter[:customs_associated_items][item_number][:quantity] : expectation
  sleep(0.5)
  expect(stamps.orders.order_details.customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_qty.text_box.text.to_i).to eql(expectation.to_i) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_qty.text_box.text.to_i).to eql(expectation.to_i) if param.web_app == :mail
end

Then /^(?:E|e)xpect Customs form Associated Item (\d+) Unit Price is (?:correct|(.*))$/ do |item_number, expectation|
  expectation = (expectation.nil?)?test_parameter[:customs_associated_items][item_number][:price] :expectation
  sleep(0.5)
  expect(stamps.orders.order_details.customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_unit_price.text_box.text.to_f).to eql(expectation.to_f) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_unit_price.text_box.text.to_f).to eql(expectation.to_f) if param.web_app == :mail
end

Then /^(?:E|e)xpect Customs form Associated Item (\d+) Made In is (?:correct|(.*))$/ do |item_number, expectation|
  expectation = (expectation.nil?)?test_parameter[:customs_associated_items][item_number][:made_in] :expectation
  sleep(0.5)
  expect(stamps.orders.order_details.customs.edit_form.associated_items.item_number(item_number.to_i).made_in.text_box.text).to eql(expectation) if param.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_form.associated_items.item_number(item_number.to_i).made_in.text_box.text).to eql(expectation) if param.web_app == :mail
end

Then /^(?:E|e)xpect Customs form Associated Item (\d+) Tariff is (?:correct|(.*))$/ do |item_number, expectation|
  expectation = ((expectation.nil?)?test_parameter[:customs_associated_items][item_number][:tarriff] :expectation).to_f
  sleep(0.5)
  expect((stamps.orders.order_details.customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_hs_tariff.text).to_f).to eql(expectation.to_f) if param.web_app == :orders
  expect((stamps.mail.print_form.mail_customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_hs_tariff.text).to_f).to eql(expectation.to_f) if param.web_app == :mail
end
