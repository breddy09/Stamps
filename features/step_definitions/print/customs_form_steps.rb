
Then /^Postage Customs: Set Package Contents to \"(.+)\"$/ do |value|
  log.info "Step: Customs: Set Package Contents to #{value}"
  raise "Instantiate Customs Form before calling this step definition" if @customs_form.nil?
  @customs_form.package_contents.select value
end

Then /^Postage Customs: Set Non-Delivery Options to \"(.+)\"$/ do |value|
  log.info "Step: Customs: Set Non-Delivery Options to #{value}"
  raise "Instantiate Customs Form before calling this step definition" if @customs_form.nil?
  @customs_form.non_delivery_options.select value
end

Then /^Postage Customs: Set Internal Transaction Number Requirement to \"(.+)\"$/ do |value|
  log.info "Step: Customs: Set Internal Transaction Number to #{value}"
  raise "Instantiate Customs Form before calling this step definition" if @customs_form.nil?
  @customs_form.internal_transaction.select (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
  sleep 1
end

Then /^Postage Customs: Set More Info to \"(.+)\"$/ do |value|
  log.info "Step: Customs: Set More Info to #{value}"
  raise "Instantiate Customs Form before calling this step definition" if @customs_form.nil?
  @customs_form.more_info.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Then /^Postage Customs: Set ITN Number to \"(.+)\"$/ do |value|
  log.info "Step: Customs: Set ITN Number to #{value}"
  raise "Instantiate Customs Form before calling this step definition" if @customs_form.nil?
  @customs_form.itn_number.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Then /^Postage Customs: Set License Number to \"(.+)\"$/ do |value|
  log.info "Step: Customs: Set License Number to #{value}"
  raise "Instantiate Customs Form before calling this step definition" if @customs_form.nil?
  @customs_form.license.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Then /^Postage Customs: Set Certificate Number to \"(.+)\"$/ do |value|
  log.info "Step: Customs: Set Certificate Number to #{value}"
  raise "Instantiate Customs Form before calling this step definition" if @customs_form.nil?
  @customs_form.certificate.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Then /^Postage Customs: Set Invoice Number to \"(.+)\"$/ do |value|
  log.info "Step: Customs: Set Invoice Number to #{value}"
  raise "Instantiate Customs Form before calling this step definition" if @customs_form.nil?
  @customs_form.invoice.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Then /^Postage Customs: Add Item - Description (\w+), Qty (\d+), Value ([\d.]+), Lbs (\d+), Oz (\d+), Origin (.+), Tariff (\d+)$/ do |description, qty, value, lbs, oz, origin_country, tariff|
  log.info "Step: Customs: Add Item - Description #{description}, Qty #{qty}, Value #{value}, Weight\(lbs\) #{lbs}, Weight\(oz\) #{oz} Origin #{origin_country}, Tariff #{tariff}"
  raise "Instantiate Customs Form before calling this step definition" if @customs_form.nil?

  @add_item_form = @customs_form.add_item
  @add_item_form.description.set (description.downcase.include? "random") ? test_helper.random_alpha_numeric : description
  @add_item_form.qty.set qty
  @add_item_form.value.set value
  @add_item_form.lbs.set lbs
  @add_item_form.oz.set oz
  @add_item_form.origin.select origin_country
  @add_item_form.hs_tariff.set tariff
  @add_item_form.save
end

Then /^Postage Customs: Delete Item (\d+)$/ do |item_number|
  log.info "Step: Customs: Delete Item #{item_number}"
  count = @customs_item_grid.size
  item = @customs_item_grid.item item_number.to_i
  if count > 1
    item.delete.click_while_present
  else
    item.delete.safe_click
  end
end

Then /^Postage Customs: Delete All Items$/ do
  log.info "Step: Postage Customs: Delete All Items"
  raise "Instantiate Customs Form before calling this step definition" if @customs_form.nil?
  @customs_form.delete_all

end

Then /^Postage Customs: Check I agree to the USPS Privacy Act Statement$/ do
  log.info "Step: Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibition"
  raise "Instantiate Customs Form before calling this step definition" if @customs_form.nil?
  @customs_form.i_agree.check
end

Then /^Postage Customs: Uncheck  I agree to the USPS Privacy Act Statement$/ do
  log.info "Step: Uncheck I agree to the USPS Privacy Act Statement and Restrictions and Prohibition"
  raise "Instantiate Customs Form before calling this step definition" if @customs_form.nil?
  @customs_form.i_agree.uncheck
end

Then /^Postage Customs: Save$/ do
  log.info "Step: Save Customs Form"
  raise "Instantiate Customs Form before calling this step definition" if @customs_form.nil?
  @customs_form.save
end