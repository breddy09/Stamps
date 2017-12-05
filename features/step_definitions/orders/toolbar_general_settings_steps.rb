
Then /^[Oo]pen Orders Settings$/ do
  stamps.orders.orders_settings
end
# Services checkbox
Then /^Settings: Check Services$/ do
  stamps.orders.orders_settings.stores_tab
  @general_settings.services.check
end

Then /^[Ii]n Settings modal, Uncheck Services$/ do
  @general_settings.services.uncheck
end

# Services checkbox
Then /^Settings: Check Print Confirm$/ do
  @general_settings.print_confirm.check
end

Then /^Settings: Uncheck Print Confirm$/ do
  @general_settings.print_confirm.uncheck
end

# Contacts$ checkbox
Then /^Settings: Check Contacts$/ do
  @general_settings.contacts.check
end

Then /^Settings: Uncheck Contacts$/ do
  @general_settings.contacts.uncheck
end

# Shipments checkbox
Then /^Settings: Check Shipments$/ do
  @general_settings.shipments.check
end

Then /^Settings: Uncheck Shipments$/ do
  @general_settings.shipments.uncheck
end

# USPS Terms checkbox
Then /^Settings: Check USPS Terms$/ do
  @general_settings.usps_terms.check
end

Then /^Settings: Uncheck USPS Terms$/ do
  @general_settings.usps_terms.uncheck
end

#to do setup some where in Orders Settings
Then /^[Ii]n Orders Settings, click on General Settings tab$/ do
  @general_settings.general.click
end

# Set Logoff

Then /^[Ii]n Settings modal, set Logoff to 5 min.$/ do
  step "In Settings modal, Logoff set 5 min"
end

Then /^[Ii]n Settings modal, set Logoff to 10 min.$/ do
  step "In Settings modal, Logoff set 10 min"
end

Then /^[Ii]n Settings modal, set Logoff to 15 min.$/ do
  step "In Settings modal, Logoff set 15 min"
end

Then /^[Ii]n Settings modal, set Logoff to 30 min.$/ do
  step "In Settings modal, Logoff set 30 min"
end

Then /^[Ii]n Settings modal, set Logoff to 1 hour.$/ do
  step "In Settings modal, Logoff set 1 hour"
end

Then /^[Ii]n Settings modal, set Logoff to 2 hours$/ do
  step "In Settings modal, Logoff set 2 hours"
end

Then /^[Ii]n Settings modal, Logoff set (.*)$/ do |value|
  case value.downcase
    when "5 min"
      @general_settings.log_off.five_min
    when "10 min"
      @general_settings.log_off.ten_min
    when "15 min"
      @general_settings.log_off.fifteen_min
    when "30 min"
      @general_settings.log_off.thirty_min
    when "1 hour"
      @general_settings.log_off.one_hour
    when "2 hours"
      @general_settings.log_off.two_hours
    else
      expect("Invalid Logoff Selection -  In Settings modal, Logoff #{value}").to eql "Settings"
  end
end

Then /^[Ii]n Settings modal, set Postdate to 12:00 a.m.$/ do
  step "In Settings modal, Postdate Set 12:00 a.m."
end

Then /^[Ii]n Settings modal, set Postdate to 1:00 a.m.$/ do
  step "In Settings modal, Postdate Set 1:00 a.m."
end

Then /^[Ii]n Settings modal, set Postdate to 2:00 a.m.$/ do
  step "In Settings modal, Postdate Set 2:00 a.m."
end

Then /^[Ii]n Settings modal, set Postdate to 3:00 a.m.$/ do
  step "In Settings modal, Postdate Set 3:00 a.m."
end

Then /^[Ii]n Settings modal, set Postdate to 4:00 a.m.$/ do
  step "In Settings modal, Postdate Set 4:00 a.m."
end

Then /^[Ii]n Settings modal, set Postdate to 5:00 a.m.$/ do
  step "In Settings modal, Postdate Set 5:00 a.m."
end

Then /^[Ii]n Settings modal, set Postdate to 6:00 a.m.$/ do
  step "In Settings modal, Postdate Set 6:00 a.m."
end

Then /^[Ii]n Settings modal, set Postdate to 7:00 a.m.$/ do
  step "In Settings modal, Postdate Set 7:00 a.m."
end

Then /^[Ii]n Settings modal, set Postdate to 8:00 a.m.$/ do
  step "In Settings modal, Postdate Set 8:00 a.m."
end

Then /^[Ii]n Settings modal, set Postdate to 9:00 a.m.$/ do
  step "In Settings modal, Postdate Set 9:00 a.m."
end

Then /^[Ii]n Settings modal, set Postdate to 10:00 a.m.$/ do
  step "In Settings modal, Postdate Set 10:00 a.m."
end

Then /^[Ii]n Settings modal, set Postdate to 11:00 a.m.$/ do
  step "In Settings modal, Postdate Set 11:00 a.m."
end

Then /^[Ii]n Settings modal, set Postdate to 12:00 p.m.$/ do
  step "In Settings modal, Postdate Set 12:00 p.m."
end

Then /^[Ii]n Settings modal, set Postdate to 1:00 p.m.$/ do
  step "In Settings modal, Postdate Set 1:00 p.m."
end

Then /^[Ii]n Settings modal, set Postdate to 2:00 p.m.$/ do
  step "In Settings modal, Postdate Set 2:00 p.m."
end

Then /^[Ii]n Settings modal, set Postdate to 3:00 p.m.$/ do
  step "In Settings modal, Postdate Set 3:00 p.m."
end

Then /^[Ii]n Settings modal, set Postdate to 4:00 p.m.$/ do
  step "In Settings modal, Postdate Set 4:00 p.m."
end

Then /^[Ii]n Settings modal, set Postdate to 5:00 p.m.$/ do
  step "In Settings modal, Postdate Set 5:00 p.m."
end

Then /^[Ii]n Settings modal, set Postdate to 6:00 p.m.$/ do
  step "In Settings modal, Postdate Set 6:00 p.m."
end

Then /^[Ii]n Settings modal, set Postdate to 7:00 p.m.$/ do
  step "In Settings modal, Postdate Set 7:00 p.m."
end

Then /^[Ii]n Settings modal, set Postdate to 8:00 p.m.$/ do
  step "In Settings modal, Postdate Set 8:00 p.m."
end

Then /^[Ii]n Settings modal, set Postdate to 9:00 p.m.$/ do
  step "In Settings modal, Postdate Set 9:00 p.m."
end

Then /^[Ii]n Settings modal, set Postdate to 10:00 p.m.$/ do
  step "In Settings modal, Postdate Set 10:00 p.m."
end

Then /^[Ii]n Settings modal, set Postdate to 11:00 p.m.$/ do
  step "In Settings modal, Postdate Set 11:00 p.m."
end

Then /^[Ii]n Settings modal, Postdate Set (.*)$/ do |value|
  test_config.logger.step "In Settings modal, Postdate Set #{value}"
  case value.downcase
    when "12:00 a.m."
      @general_settings.post_date.twelve_am
    when "1:00 a.m."
      @general_settings.post_date.one_am
    when "2:00 a.m."
      @general_settings.post_date.two_am
    when "3:00 a.m."
      @general_settings.post_date.three_am
    when "4:00 a.m."
      @general_settings.post_date.four_am
    when "5:00 a.m."
      @general_settings.post_date.five_am
    when "6:00 a.m."
      @general_settings.post_date.six_am
    when "7:00 a.m."
      @general_settings.post_date.seven_am
    when "8:00 a.m."
      @general_settings.post_date.eight_am
    when "9:00 a.m."
      @general_settings.post_date.nine_am
    when "10:00 a.m."
      @general_settings.post_date.ten_am
    when "11:00 a.m."
      @general_settings.post_date.eleven_am
    when "12:00 p.m."
      @general_settings.post_date.twelve_pm
    when "1:00 p.m."
      @general_settings.post_date.one_pm
    when "2:00 p.m."
      @general_settings.post_date.two_pm
    when "3:00 p.m."
      @general_settings.post_date.three_pm
    when "4:00 p.m."
      @general_settings.post_date.four_pm
    when "5:00 p.m."
      @general_settings.post_date.five_pm
    when "6:00 p.m."
      @general_settings.post_date.six_pm
    when "7:00 p.m."
      @general_settings.post_date.seven_pm
    when "8:00 p.m."
      @general_settings.post_date.eight_pm
    when "9:00 p.m."
      @general_settings.post_date.nine_pm
    when "10:00 p.m."
      @general_settings.post_date.ten_pm
    when "11:00 p.m."
      @general_settings.post_date.eleven_pm
    else
      expect("Invalid Postdate Selection -  In Settings modal, Postdate #{value}").to eql "Settings"
  end
end
# Mail Balance
Then /^[Ii]n Settings modal, set Mail Balance to 0$/ do
  step 'In Settings modal, Mail Balance Set 0'
end

Then /^[Ii]n Settings modal, set Mail Balance to 10$/ do
  step 'In Settings modal, Mail Balance Set 10'
end

Then /^[Ii]n Settings modal, set Mail Balance to 25$/ do
  step 'In Settings modal, Mail Balance Set 25'
end

Then /^[Ii]n Settings modal, set Mail Balance to 50$/ do
  step 'In Settings modal, Mail Balance Set 50'
end


Then /^[Ii]n Settings modal, set Mail Balance to 100$/ do
  step 'In Settings modal, Mail Balance Set 100'
end


Then /^[Ii]n Settings modal, set Mail Balance to 250$/ do
  step 'In Settings modal, Mail Balance Set 250'
end


Then /^[Ii]n Settings modal, set Mail Balance to 500$/ do
  step 'In Settings modal, Mail Balance Set 500'
end

Then /^[Ii]n Settings modal, Mail Balance Set (.*)$/ do |value|
  case value.downcase
    when "0"
      @general_settings.postage_balance.zero
    when "10"
      @general_settings.postage_balance.ten
    when "25"
      @general_settings.postage_balance.twenty_five
    when "50"
      @general_settings.postage_balance.fifty
    when "100"
      @general_settings.postage_balance.one_hundred
    when "250"
      @general_settings.postage_balance.two_hundred_fifty
    when "500"
      @general_settings.postage_balance.five_hundred
    else
      expect("Invalid Mail Balance Selection -  In Settings modal, Mail Balance #{value}").to eql "Settings"
  end
end

# Expectations
#  Services
Then /^[Ii]n Settings modal, Expect Services Checked$/ do
  expect(@general_settings.services.checked?).to be(true)
end

Then /^[Ii]n Settings modal, Expect Services Unchecked$/ do
  expect(@general_settings.services.checked?).not_to be(true)
end

#  Print Confirm
Then /^[Ii]n Settings modal, Expect Print Confirm Checked$/ do
  expect(@general_settings.print_confirm.checked?).to be(true)
end

Then /^[Ii]n Settings modal, Expect Print Confirm Unchecked$/ do
  expect(@general_settings.print_confirm.checked?).not_to be(true)
end

#  Print Confirm
Then /^[Ii]n Settings modal, Expect USPS Terms Checked$/ do
  expect(@general_settings.usps_terms.checked?).to be(true)
end

Then /^[Ii]n Settings modal, Expect USPS Terms Unchecked$/ do
  expect(@general_settings.usps_terms.checked?).not_to be(true)
end

#  Contacts
Then /^[Ii]n Settings modal, Expect Contacts Checked$/ do
  expect(@general_settings.contacts.checked?).to be(true)
end

Then /^[Ii]n Settings modal, Expect Contacts Unchecked$/ do
  step "Open Settings Modal" if @general_settings.nil?
  expect(@general_settings.contacts.checked?).not_to be(true)
end

#  Shipments
Then /^[Ii]n Settings modal, Expect Shipments Checked$/ do
  step "Open Settings Modal" if @general_settings.nil?
  expect(@general_settings.shipments.checked?).to be(true)
end

Then /^[Ii]n Settings modal, Expect Shipments Unchecked$/ do
  expect(@general_settings.shipments.checked?).not_to be(true)
end

# Logoff
Then /^[Ii]n Settings modal, Expect Logoff is set for 5 min.$/ do
  step "In Settings modal, Expect Logoff is 5 min."
end

Then /^[Ii]n Settings modal, Expect Logoff is set for 10 min.$/ do
  step "In Settings modal, Expect Logoff is 10 min."
end

Then /^[Ii]n Settings modal, Expect Logoff is set for 15 min.$/ do
  step "In Settings modal, Expect Logoff is 15 min."
end

Then /^[Ii]n Settings modal, Expect Logoff is set for 30 min.$/ do
  step "In Settings modal, Expect Logoff is 30 min."
end

Then /^[Ii]n Settings modal, Expect Logoff is set for 1 hour$/ do
  step "In Settings modal, Expect Logoff is 1 hour"
end

Then /^[Ii]n Settings modal, Expect Logoff is set for 2 hours$/ do
  step "In Settings modal, Expect Logoff is 2 hours"
end

Then /^[Ii]n Settings modal, Expect Logoff is (.*)$/ do |expectation|
  step "Open Settings Modal" if @general_settings.nil?
  expect(@general_settings.log_off.textbox.text).to eql expectation
end

# Postadate
Then /^[Ii]n Settings modal, Expect Postdate set to 12:00 a.m.$/ do
  step "In Settings modal, Expect Postdate is 12:00 a.m."
end

Then /^[Ii]n Settings modal, Expect Postdate set to 1:00 a.m.$/ do
  step "In Settings modal, Expect Postdate is 1:00 a.m."
end

Then /^[Ii]n Settings modal, Expect Postdate set to 2:00 a.m.$/ do
  step "In Settings modal, Expect Postdate is 2:00 a.m."
end

Then /^[Ii]n Settings modal, Expect Postdate set to 3:00 a.m.$/ do
  step "In Settings modal, Expect Postdate is 3:00 a.m."
end

Then /^[Ii]n Settings modal, Expect Postdate set to 4:00 a.m.$/ do
  step "In Settings modal, Expect Postdate is 4:00 a.m."
end

Then /^[Ii]n Settings modal, Expect Postdate set to 5:00 a.m.$/ do
  step "In Settings modal, Expect Postdate is 5:00 a.m."
end

Then /^[Ii]n Settings modal, Expect Postdate set to 6:00 a.m.$/ do
  step "In Settings modal, Expect Postdate is 6:00 a.m."
end

Then /^[Ii]n Settings modal, Expect Postdate set to 7:00 a.m.$/ do
  step "In Settings modal, Expect Postdate is 7:00 a.m."
end

Then /^[Ii]n Settings modal, Expect Postdate set to 8:00 a.m.$/ do
  step "In Settings modal, Expect Postdate is 8:00 a.m."
end

Then /^[Ii]n Settings modal, Expect Postdate set to 9:00 a.m.$/ do
  step "In Settings modal, Expect Postdate is 9:00 a.m."
end

Then /^[Ii]n Settings modal, Expect Postdate set to 10:00 a.m.$/ do
  step "In Settings modal, Expect Postdate is 10:00 a.m."
end

Then /^[Ii]n Settings modal, Expect Postdate set to 11:00 a.m.$/ do
  step "In Settings modal, Expect Postdate is 11:00 a.m."
end

Then /^[Ii]n Settings modal, Expect Postdate set to 12:00 p.m.$/ do
  step "In Settings modal, Expect Postdate is 12:00 p.m."
end

Then /^[Ii]n Settings modal, Expect Postdate set to 1:00 p.m.$/ do
  step "In Settings modal, Expect Postdate is 1:00 p.m."
end

Then /^[Ii]n Settings modal, Expect Postdate set to 2:00 p.m.$/ do
  step "In Settings modal, Expect Postdate is 2:00 p.m."
end

Then /^[Ii]n Settings modal, Expect Postdate set to 3:00 p.m.$/ do
  step "In Settings modal, Expect Postdate is 3:00 p.m."
end

Then /^[Ii]n Settings modal, Expect Postdate set to 4:00 p.m.$/ do
  step "In Settings modal, Expect Postdate is 4:00 p.m."
end

Then /^[Ii]n Settings modal, Expect Postdate set to 5:00 p.m.$/ do
  step "In Settings modal, Expect Postdate is 5:00 p.m."
end

Then /^[Ii]n Settings modal, Expect Postdate set to 6:00 p.m.$/ do
  step "In Settings modal, Expect Postdate is 6:00 p.m."
end

Then /^[Ii]n Settings modal, Expect Postdate set to 7:00 p.m.$/ do
  step "In Settings modal, Expect Postdate is 7:00 p.m."
end

Then /^[Ii]n Settings modal, Expect Postdate set to 8:00 p.m.$/ do
  step "In Settings modal, Expect Postdate is 8:00 p.m."
end

Then /^[Ii]n Settings modal, Expect Postdate set to 9:00 p.m.$/ do
  step "In Settings modal, Expect Postdate is 9:00 p.m."
end

Then /^[Ii]n Settings modal, Expect Postdate set to 10:00 p.m.$/ do
  step "In Settings modal, Expect Postdate is 10:00 p.m."
end

Then /^[Ii]n Settings modal, Expect Postdate set to 11:00 p.m.$/ do
  step "In Settings modal, Expect Postdate is 11:00 p.m."
end

Then /^[Ii]n Settings modal, Expect Postdate is (.*)$/ do |expectation|
  step "Open Settings Modal" if @general_settings.nil?
  expect(@general_settings.post_date.textbox.text).to eql expectation
end

# Mail Balance
Then /^[Ii]n Settings modal, Expect Mail Balance set to 0$/ do
  step "In Settings modal, Expect Mail Balance is $0"
end

Then /^[Ii]n Settings modal, Expect Mail Balance set to 10$/ do
  step "In Settings modal, Expect Mail Balance is $10"
end

Then /^[Ii]n Settings modal, Expect Mail Balance set to 25$/ do
  step "In Settings modal, Expect Mail Balance is $25"
end

Then /^[Ii]n Settings modal, Expect Mail Balance set to 50$/ do
  step "In Settings modal, Expect Mail Balance is $50"
end

Then /^[Ii]n Settings modal, Expect Mail Balance set to 100$/ do
  step "In Settings modal, Expect Mail Balance is $100"
end

Then /^[Ii]n Settings modal, Expect Mail Balance set to 250$/ do
  step "In Settings modal, Expect Mail Balance is $250"
end

Then /^[Ii]n Settings modal, Expect Mail Balance set to 500$/ do
  step "In Settings modal, Expect Mail Balance is $500"
end

Then /^[Ii]n Settings modal, Expect Mail Balance is (.*)$/ do |expectation|
  expect(@general_settings.postage_balance.textbox.text).to eql expectation
end

# Reset Fields

Then /^[Ii]n Settings modal, Open Reset Fields Modal$/ do
  @reset_fields=@general_settings.reset_fields
end

Then /^Reset Fields:  Check Service$/ do
  @reset_fields.service.check
end

Then /^Reset Fields:  Uncheck Service$/ do
  @reset_fields.service.uncheck
end

Then /^Reset Fields:  Expect service Checked$/ do
  expect(@reset_fields.service.checked?).to be(true)
end

Then /^Reset Fields:  Expect service Unchecked$/ do
  expect(@reset_fields.service.checked?).not_to be(true)
end

Then /^Reset Fields:  Check Weight$/ do
  @reset_fields.weight.checkbox.check
end

Then /^Reset Fields:  Uncheck Weight$/ do
  @reset_fields.weight.checkbox.uncheck
end

Then /^Reset Fields:  Expect Weight Checked$/ do
  expect(@reset_fields.weight.checkbox.checked?).to be(true)
end

Then /^Reset Fields:  Expect Weight Unchecked$/ do
  expect(@reset_fields.weight.checkbox.checked?).not_to be(true)
end

Then /^Reset Fields:  Check Dimensions$/ do
  @reset_fields.dimensions.checkbox.check
end

Then /^Reset Fields:  Uncheck Dimensions$/ do
  @reset_fields.dimensions.checkbox.uncheck
end

Then /^Reset Fields:  Expect Dimensions Checked$/ do
  expect(@reset_fields.dimensions.checkbox.checked?).to be(true)
end

Then /^Reset Fields:  Expect Dimensions Unchecked$/ do
  expect(@reset_fields.dimensions.checkbox.checked?).not_to be(true)
end

Then /^Reset Fields:  Check Ship to Address$/ do
  @reset_fields.ship_to_address.check
end

Then /^Reset Fields:  Uncheck Ship to Address$/ do
  @reset_fields.ship_to_address.uncheck
end

Then /^Reset Fields:  Expect Ship to Address Checked$/ do
  expect(@reset_fields.ship_to_address.checked?).to be(true)
end

Then /^Reset Fields:  Expect Ship to Address Unchecked$/ do
  expect(@reset_fields.ship_to_address.checked?).not_to be(true)
end

Then /^Reset Fields:  Check Tracking$/ do
  @reset_fields.tracking.check
end

Then /^Reset Fields:  Uncheck Tracking$/ do
  @reset_fields.tracking.uncheck
end

Then /^Reset Fields:  Expect Tracking Checked$/ do
  expect(@reset_fields.tracking.checked?).to be(true)
end

Then /^Reset Fields:  Expect Tracking Unchecked$/ do
  expect(@reset_fields.tracking.checked?).not_to be(true)
end

Then /^Reset Fields:  Check Extra Services$/ do
  @reset_fields.extra_services.check
end

Then /^Reset Fields:  Uncheck Extra Services$/ do
  @reset_fields.extra_services.uncheck
end

Then /^Reset Fields:  Expect Extra Services Checked$/ do
  expect(@reset_fields.extra_services.checked?).to be(true)

end

Then /^Reset Fields:  Expect Extra Services Unchecked$/ do
  expect(@reset_fields.extra_services.checked?).not_to be(true)
end

Then /^Reset Fields:  Check Insurance$/ do
  @reset_fields.insurance.check
end

Then /^Reset Fields:  Uncheck Insurance$/ do
  @reset_fields.insurance.uncheck
end

Then /^Reset Fields:  Expect Insurance Checked$/ do
  expect(@reset_fields.insurance.checked?).to be(true)
end

Then /^Reset Fields:  Expect Insurance Unchecked$/ do
  expect(@reset_fields.insurance.checked?).not_to be(true)
end

Then /^Reset Fields:  Check Reference Numbers$/ do
  @reset_fields.reference_numbers.check
end

Then /^Reset Fields:  Uncheck Reference Numbers$/ do
  @reset_fields.reference_numbers.uncheck
end

Then /^Reset Fields:  Expect Reference Numbers Checked$/ do
  expect(@reset_fields.reference_numbers.checked?).to be(true)

end

Then /^Reset Fields:  Expect Reference Numbers Unchecked$/ do
  expect(@reset_fields.reference_numbers.checked?).not_to be(true)
end

Then /^Reset Fields:  Check Cost Code$/ do
  @reset_fields.cost_code.check
end

Then /^Reset Fields:  Uncheck Cost Code$/ do
  @reset_fields.cost_code.uncheck
end

Then /^Reset Fields:  Expect Cost Code Checked$/ do
  expect(@reset_fields.cost_code.checked?).to be(true)
end

Then /^Reset Fields:  Expect Cost Code Unchecked$/ do
  expect(@reset_fields.cost_code.checked?).not_to be(true)
end

Then /^Reset Fields:  Check Customs$/ do
  @reset_fields.customs.check
end

Then /^Reset Fields:  Uncheck Customs$/ do
  @reset_fields.customs.uncheck
end

Then /^Reset Fields:  Expect Customs Checked$/ do
  expect(@reset_fields.customs.checked?).to be(true)
end

Then /^Reset Fields:  Expect Customs Unchecked$/ do
  expect(@reset_fields.customs.checked?).not_to be(true)
end

Then /^Reset Fields:  Check Quantity$/ do
  @reset_fields.quantity.check
end

Then /^Reset Fields:  Uncheck Quantity$/ do
  @reset_fields.quantity.uncheck
end

Then /^Reset Fields:  Expect Quantity Checked$/ do
  expect(@reset_fields.quantity.checked?).to be(true)
end

Then /^Reset Fields:  Expect Quantity Unchecked$/ do
  expect(@reset_fields.quantity.checked?).not_to be(true)
end

Then /^Reset Fields:  Check Print form Amount$/ do
  @reset_fields.stamps_amount.check
end

Then /^Reset Fields:  Uncheck Print form Amount$/ do
  @reset_fields.stamps_amount.uncheck
end

Then /^Reset Fields:  Expect Print form Amount Checked$/ do
  expect(@reset_fields.stamps_amount.checked?).to be(true)
end

Then /^Reset Fields:  Expect Print form Amount Unchecked$/ do
  expect(@reset_fields.stamps_amount.checked?).not_to be(true)
end

Then /^Reset Fields:  Check Auto-Advance Label Position$/ do
  @reset_fields.auto_advance_label_position.check
end

Then /^Reset Fields:  Uncheck Auto-Advance Label Position$/ do
  @reset_fields.auto_advance_label_position.uncheck
end

Then /^Reset Fields:  Expect Auto-Advance Label Position Checked$/ do
  expect(@reset_fields.auto_advance_label_position.checked?).to be(true)
end

Then /^Reset Fields:  Expect Auto-Advance Label Position Unchecked$/ do
  expect(@reset_fields.auto_advance_label_position.checked?).not_to be(true)
end

Then /^Reset Fields:  Set Weight to (\d+) lb (\d+) oz$/ do |lb, oz|
  #test_config.logger.step "Reset Fields:  Set Weight to #{lb} lb #{oz} oz"
  step "Reset Fields:  Check Weight"
  @reset_fields.weight.lb.set lb
  @reset_fields.weight.oz.set oz
end

Then /^Reset Fields:  Expect Weight lb equals (\d+)$/ do |lb|
  test_config.logger.step  "Reset Fields:  Expect Weight lb equals #{lb}"

  step "Reset Fields:  Check Weight"
  expect(@reset_fields.weight.lb.textbox.text.to_i).to eql lb.to_i
end

Then /^Reset Fields:  Expect Weight oz equals (\d+)$/ do |oz|
  test_config.logger.step  "Reset Fields:  Expect Weight oz equals #{oz}"
  step "Reset Fields:  Check Weight"
  expect(@reset_fields.weight.oz.textbox.text.to_i).to eql oz.to_i
end

Then /^Reset Fields:  Set Dimensions to length (\d+), width (\d+), height (\d+)$/ do |length, width, height|
  test_config.logger.step  "Reset Fields:  Set Dimensions to length #{length}, width #{width}, height #{height}"
  step "Reset Fields:  Check Dimensions"
  @reset_fields.dimensions.length.set length
  @reset_fields.dimensions.width.set width
  @reset_fields.dimensions.height.set height
end

Then /^Reset Fields:  Expect Dimensions to length equals (\d+)$/ do |length|
  test_config.logger.step  "Reset Fields:  Expect Dimensions to length equals #{length}"
  step "Reset Fields:  Check Dimensions"
  expect(@reset_fields.dimensions.length.textbox.text.to_i).to eql length.to_i
end

Then /^Reset Fields:  Expect Dimensions to width equals (\d+)$/ do |width|
  test_config.logger.step  "Reset Fields:  Expect Dimensions to width equals #{width}"
  step "Reset Fields:  Check Dimensions"
  expect(@reset_fields.dimensions.width.textbox.text.to_i).to eql width.to_i
end

Then /^Reset Fields:  Expect Dimensions to height equals (\d+)$/ do |height|
  test_config.logger.step  "Reset Fields:  Expect Dimensions to height equals #{height}"
  step "Reset Fields:  Check Dimensions"
  expect(@reset_fields.dimensions.height.textbox.text.to_i).to eql height.to_i
end

Then /^Reset Fields:  Close$/ do
  #test_config.logger.step "Reset Fields:  Close"
  @reset_fields.close
end

Then /^[Ii]n Settings modal, Save$/ do
  step "Open Settings Modal" if @general_settings.nil?
  #test_config.logger.step "In Settings modal, Save"
  @general_settings.save
end

Then /^[Ii]n Settings modal, Close$/ do
  step "Open Settings Modal" if @general_settings.nil?
  #test_config.logger.step "In Settings modal, Close"
  @general_settings.close
end





