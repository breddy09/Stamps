
Then /^PAM: Load PAM Page$/ do
  #config.logger.step "PAM: Load PAM Page"
  pam.visit
end

Then /^Visit PAM Customer Search page$/ do
  #config.logger.step "Visit PAM Customer Search page"
  step "PAM: Load PAM Page" if @customer_search.nil?
  @customer_search = pam.customer_search
end

Then /^[Oo]n PAM Customer Search page, set username to (.*)$/ do |username|
  #config.logger.step "On PAM Customer Search page, set username to #{username}"
  test_param[:usr] = username unless username.downcase.include? 'random'
  #config.logger.step "On PAM Customer Search page, set username to #{test_data[:usr]}"
  @customer_search.username.set test_param[:usr]
  sleep(0.35)
end

Then /^[Oo]n PAM Customer Search page, set 5.2 or lower$/ do
  #config.logger.step "On PAM Customer Search page, set 5.2 or lower"
  @customer_search.user_5_2_or_lower
  @customer_search.user_5_2_or_lower
end

Then /^[Oo]n PAM Customer Search page, click Search button$/ do
  #config.logger.step "On PAM Customer Search page, click Search button"
  @customer_profile = @customer_search.search
  if @customer_profile.instance_of? Pam::CustomerProfile
    if @customer_profile.present?
      @pam_customer_profile_found = true
    else
      step "On PAM Customer Search page, set username to #{test_param[:usr]}"
      step "On PAM Customer Search page, set 5.2 or lower"
      step "On PAM Customer Search page, click Search button"
    end
  else
    @pam_customer_profile_found = false
  end
end


Then /^[Oo]n PAM Customer Search page, Verify user is found$/ do
  expectation = "Customer was found"

  if @pam_customer_profile_found
    actual_value = expectation
  else
    case @customer_profile
      when Pam::CustomerProfileNotFound
        actual_value = @customer_profile.text
      when Pam::MeterInfoNotAvailableForAccount
        actual_value = @customer_profile.text
      else
        actual_value = "Customer was not found!"
    end
  end
  expect(actual_value).to eql expectation
end

Then /^[Oo]n PAM Customer Profile page, click Change Meter Limit link$/ do
  expect(@customer_profile).to be_truthy
  @change_meter_limit = @customer_profile.header.change_meter_limit
  # change meter limit if new limit is greater than current limit.
end

Then /^[Oo]n PAM Change Meter Limit page, set New Meter Limit to \$(\d+)$/ do |new_limit|
  #config.logger.step "On PAM Change Meter Limit page, set New Meter Limit to #{new_limit}"
  expect(@change_meter_limit).to be_truthy
  @change_limit = new_limit.to_f > @change_meter_limit.current_meter_limit
  @change_meter_limit.new_meter_limit.set(new_limit) if @change_limit
end

Then /^[Oo]n PAM Change Meter Limit page, set USPS approval to Checked$/ do
  #config.logger.step "On PAM Change Meter Limit page, set USPS approval to Checked"
  if @change_limit
    expect(@change_meter_limit).to be_truthy
    @change_meter_limit.usps_approval.check
  end
end

Then /^[Oo]n PAM Change Meter Limit page, set USPS approval to Unchecked$/ do
  #config.logger.step "On PAM Change Meter Limit page, set USPS approval to Unchecked"
  if @change_limit
    expect(@change_meter_limit).to be_truthy
    @change_meter_limit.usps_approval.uncheck
  end
end

Then /^[Oo]n PAM Change Meter Limit page, click Submit$/ do
  #config.logger.step "On PAM Change Meter Limit page, click Submit"
  if @change_limit
    expect(@change_meter_limit).to be_truthy
    @change_meter_limit.submit.ok
  end
  sleep(2)
  step "On PAM Customer Profile page, click Change Meter Limit link"
  sleep(2)
  expect(@change_meter_limit.current_meter_limit).to eql @change_meter_limit.maximum_meter_limit
end

Then /^[Oo]n PAM Customer Profile page, click ACH Credit link$/ do
  #config.logger.step "On PAM Customer Profile page, click ACH Credit link"
  expect(@customer_profile).to be_truthy
  @ach_credit = @customer_profile.header.ach_credit
end

Then /^[Oo]n PAM ACH Purchase page, set Amount to \$(\d+)\.(\d+)$/ do |dollars, cents|
  #config.logger.step "On PAM ACH Purchase page, set Amount to $#{dollars}.#{cents}"
  expect(@ach_credit).to be_truthy
  dollar_amount = @ach_credit.dollar_amount
  dollar_amount.set dollars
  dollar_amount.click
  dollar_amount.click
  dollar_amount.click

  cents_amount = @ach_credit.cents_amount
  cents_amount.click
  cents_amount.click
  cents_amount.click
  cents_amount.set cents

  comments = @ach_credit.comments
  comments.click
  comments.click
  comments.click
  comments.set test_param[:usr]

  @ach_credit.submit.yes.ok
end

Then /^[Oo]n PAM Customer Profile page, get Available Mail Amount$/ do
  #config.logger.step "On PAM Customer Profile page, get Available Mail Amount"

  config.logger.message "PAM: Available Mail ############################"
  config.logger.message "PAM: Available Mail ############################"
  config.logger.message "PAM: Available Mail ############################"
  config.logger.message "PAM: Available Mail $#{@customer_profile.available_postage.text}"
  config.logger.message "PAM: Available Mail $#{@customer_profile.available_postage.text}"
  config.logger.message "PAM: Available Mail $#{@customer_profile.available_postage.text}"
  config.logger.message "PAM: Available Mail ############################"
  config.logger.message "PAM: Available Mail ############################"
  config.logger.message "PAM: Available Mail ############################"
end

Then /^[Oo]n PAM Customer Profile page, click  AppCap Overrides link$/ do
  #config.logger.step "On PAM Customer Profile page, click  AppCap Overrides link"
  expect(@customer_profile).to be_truthy
  @appcapp_overrides = @customer_profile.header.appcapp_overrides
end

Then /^[Oo]n PAM AppCap Overrides page, set Internet Mail Printing to Always On$/ do
  #config.logger.step "On PAM AppCap Overrides page, set Internet Mail Printing to Always On"
  expect(@appcapp_overrides).to be_truthy
  @appcapp_overrides.internet_postage_printing.always_on
end

Then /^[Oo]n PAM AppCap Overrides page, set Internet Mail Printing to Always Off$/ do
  #config.logger.step "On PAM AppCap Overrides page, set Internet Mail Printing to Always Off"
  expect(@appcapp_overrides).to be_truthy
  @appcapp_overrides.internet_postage_printing.always_off
end

Then /^[Oo]n PAM AppCap Overrides page, set Internet Mail Printing to No Override$/ do
  #config.logger.step "On PAM AppCap Overrides page, set Internet Mail Printing to No Override"
  expect(@appcapp_overrides).to be_truthy
  @appcapp_overrides.internet_postage_printing.no_override
end

Then /^[Oo]n PAM AppCap Overrides page, set Netstamps Printing to Always On$/ do
  #config.logger.step "On PAM AppCap Overrides page, set Netstamps Printing to Always On"
  expect(@appcapp_overrides).to be_truthy
  @appcapp_overrides.netstamps_printing.always_on
end

Then /^[Oo]n PAM AppCap Overrides page, set Netstamps Printing to Always Off$/ do
  #config.logger.step "On PAM AppCap Overrides page, set Netstamps Printing to Always Off"
  expect(@appcapp_overrides).to be_truthy
  @appcapp_overrides.netstamps_printing.always_off
end

Then /^[Oo]n PAM AppCap Overrides page, set Netstamps Printing to No Override$/ do
  #config.logger.step "On PAM AppCap Overrides page, set Netstamps Printing to No Override"
  expect(@appcapp_overrides).to be_truthy
  @appcapp_overrides.netstamps_printing.no_override
end

Then /^[Oo]n PAM AppCap Overrides page, set Shipping Label Printing to Always On$/ do
  #config.logger.step "On PAM AppCap Overrides page, set Shipping Label Printing to Always On"
  expect(@appcapp_overrides).to be_truthy
  @appcapp_overrides.shipping_label_printing.always_on
end

Then /^[Oo]n PAM AppCap Overrides page, set Shipping Label Printing to Always Off$/ do
  #config.logger.step "On PAM AppCap Overrides page, set Shipping Label Printing to Always Off"
  expect(@appcapp_overrides).to be_truthy
  @appcapp_overrides.shipping_label_printing.always_off
end

Then /^[Oo]n PAM AppCap Overrides page, set Shipping Label Printing to Override$/ do
  #config.logger.step "On PAM AppCap Overrides page, set Shipping Label Printing to Override"
  expect(@appcapp_overrides).to be_truthy
  @appcapp_overrides.shipping_label_printing.no_override
end

Then /^[Oo]n PAM AppCap Overrides page, set International Shipping to Always On$/ do
  #config.logger.step "On PAM AppCap Overrides page, set International Shipping to Always On"
  expect(@appcapp_overrides).to be_truthy
  @appcapp_overrides.international_shipping.always_on
end

Then /^[Oo]n PAM AppCap Overrides page, set International Shipping to Always Off$/ do
  #config.logger.step "On PAM AppCap Overrides page, set International Shipping to Always Off"
  expect(@appcapp_overrides).to be_truthy
  @appcapp_overrides.international_shipping.always_off
end

Then /^[Oo]n PAM AppCap Overrides page, set International Shipping to Override$/ do
  #config.logger.step "On PAM AppCap Overrides page, set International Shipping to Override"
  expect(@appcapp_overrides).to be_truthy
  @appcapp_overrides.international_shipping.no_override
end

Then /^[Oo]n PAM AppCap Overrides page, set Allow High Risk Countries to Always On$/ do
  #config.logger.step "On PAM AppCap Overrides page, set Allow High Risk Countries to Always On"
  expect(@appcapp_overrides).to be_truthy
  @appcapp_overrides.allow_high_risk_countries.always_on
end

Then /^[Oo]n PAM AppCap Overrides page, set Allow High Risk Countries to Always Off$/ do
  #config.logger.step "On PAM AppCap Overrides page, set Allow High Risk Countries to Always Off"
  expect(@appcapp_overrides).to be_truthy
  @appcapp_overrides.allow_high_risk_countries.always_off
end

Then /^[Oo]n PAM AppCap Overrides page, set Allow High Risk Countries to Override$/ do
  #config.logger.step "On PAM AppCap Overrides page, set Allow High Risk Countries to Override"
  expect(@appcapp_overrides).to be_truthy
  @appcapp_overrides.allow_high_risk_countries.no_override
end

Then /^[Oo]n PAM AppCap Overrides page, set Mailing Label Printing to Always On$/ do
  #config.logger.step "On PAM AppCap Overrides page, set Mailing Label Printing to Always On"
  expect(@appcapp_overrides).to be_truthy
  @appcapp_overrides.mailing_label_printing.always_on
end

Then /^[Oo]n PAM AppCap Overrides page, set Mailing Label Printing to Always Off$/ do
  #config.logger.step "On PAM AppCap Overrides page, set Mailing Label Printing to Always Off"
  expect(@appcapp_overrides).to be_truthy
  @appcapp_overrides.mailing_label_printing.always_off
end

Then /^[Oo]n PAM AppCap Overrides page, set Mailing Label Printing to Override$/ do
  #config.logger.step "On PAM AppCap Overrides page, set Mailing Label Printing to Override"
  expect(@appcapp_overrides).to be_truthy
  @appcapp_overrides.mailing_label_printing.no_override
end

Then /^[Oo]n PAM AppCap Overrides page, Submit$/ do
  #config.logger.step "On PAM AppCap Overrides page, Submit"
  expect(@appcapp_overrides).to be_truthy
  @appcapp_overrides.submit.ok
end

Then /^[Oo]n [Pp]rofile [Pp]age, Send username to standard out$/ do
  config.logger.message " ############## NEW USER ID "
  config.logger.message " ############## #{test_param[:usr]}"
  config.logger.message " ############## #{test_param[:usr]}"
  config.logger.message " ############## #{test_param[:usr]}"
  config.logger.message " ############## #{test_param[:usr]}"
  config.logger.message " ############## NEW USER ID "
end




























