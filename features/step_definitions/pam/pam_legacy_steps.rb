

Then /^[Oo]n PAM Customer Search page, set 5.2 or lower$/ do
  pam.customer_search.customer_search.user_5_2_or_lower
end

Then /^[Oo]n PAM Customer Search page, Verify user is found$/ do #todo-Mohammed fix @customer_profile
  expectation = "Customer was found"

  if @pam_customer_profile_found
    result = expectation
  else
    case @customer_profile
      when Pam::CustomerNotFoundPage
        result = @customer_profile.text
      when Pam::MeterInfoNotAvailableForAccount
        result = @customer_profile.text
      else
        raise "Customer was not found!"
    end
  end
  expect(result).to eql expectation
end

Then /^[Oo]n PAM Customer Profile page, click Change Meter Limit link$/ do
  expect(@customer_profile).to be_truthy
  @change_meter_limit = @customer_profile.header.change_meter_limit
  # change meter limit if new limit is greater than current limit.
end

Then /^[Oo]n PAM Change Meter Limit page, set New Meter Limit to \$(\d+)$/ do |new_limit|
  expect(@change_meter_limit).to be_truthy
  @change_limit = new_limit.to_f > @change_meter_limit.current_meter_limit
  @change_meter_limit.new_meter_limit.set(new_limit) if @change_limit
end

Then /^[Oo]n PAM Change Meter Limit page, set USPS approval to Checked$/ do
  if @change_limit
    expect(@change_meter_limit).to be_truthy
    @change_meter_limit.usps_approval.check
  end
end

Then /^[Oo]n PAM Change Meter Limit page, set USPS approval to Unchecked$/ do
  if @change_limit
    expect(@change_meter_limit).to be_truthy
    @change_meter_limit.usps_approval.uncheck
  end
end

Then /^[Oo]n PAM Change Meter Limit page, click Submit$/ do
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
  expect(@customer_profile).to be_truthy
  @ach_credit = @customer_profile.header.ach_credit
end

Then /^[Oo]n PAM ACH Purchase page, set Amount to \$(\d+)\.(\d+)$/ do |dollars, cents|
  expect(@ach_credit).to be_truthy
  dollar_amount = @ach_credit.parse_digits
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
  comments.set TestData.hash[:username]

  @ach_credit.submit.yes.ok
end

Then /^[Oo]n PAM Customer Profile page, get Available Mail Amount$/ do
  SdcLogger.debug "PAM: Available Mail ############################"
  SdcLogger.debug "PAM: Available Mail ############################"
  SdcLogger.debug "PAM: Available Mail ############################"
  SdcLogger.debug "PAM: Available Mail $#{@customer_profile.available_postage.text}"
  SdcLogger.debug "PAM: Available Mail $#{@customer_profile.available_postage.text}"
  SdcLogger.debug "PAM: Available Mail $#{@customer_profile.available_postage.text}"
  SdcLogger.debug "PAM: Available Mail ############################"
  SdcLogger.debug "PAM: Available Mail ############################"
  SdcLogger.debug "PAM: Available Mail ############################"
end

Then /^[Ss]end username to standard out$/ do
  SdcLogger.debug " ############## NEW USER ID "
  SdcLogger.debug " ############## #{TestData.hash[:username]}"
  SdcLogger.debug " ############## NEW USER ID "
end
















