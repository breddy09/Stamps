Then /^Check Show Unavailable Services$/ do
  log "Test: Check Show Unavailable Services checkbox"
  batch.toolbar.settings_modal.check_unavail_services

end

Then /^Check Dont Show Print Confirmation Dialog$/ do
  log "Test: Check Dont Show Print Confirmation Dialog checkbox"
  batch.toolbar.settings_modal.check_print_confirm_dialog

end

Then /^Check Save Delivery Addresses$/ do
  log "Test: Check Save Delivery Addresses"
  batch.toolbar.settings_modal.check_save_contacts

end

Then /^Check Email Shipment Notifications$/ do
  log "Test: Check Email Shipment Notifications"
  batch.toolbar.settings_modal.check_shipment_email

end

Then /^Check Email Shipment Deliveries$/ do
  log "Test: Check Email Shipment Deliveries checkbox"
  batch.toolbar.settings_modal.check_shipment_delivery

end

Then /^Check USPS Terms in Settings Modal$/ do
  log "Test: Check USPS Terms checkbox in Settings Modal"
  batch.toolbar.settings_modal.check_usps_terms

end

Then /^Uncheck Show Unavailable Services$/ do
  log "Test: Uncheck Show Unavailable Services"
  batch.toolbar.settings_modal.uncheck_unavail_services

end

Then /^Uncheck Dont Show Print Confirmation Dialog$/ do
  log "Test: Uncheck Dont Show Print Confirmation Dialog"
  batch.toolbar.settings_modal.uncheck_print_confirm_dialog

end

Then /^Uncheck Save Delivery Addresses$/ do
  log "Test: Uncheck Save Delivery Addresses"
  batch.toolbar.settings_modal.uncheck_save_contacts

end

Then /^Uncheck Email Shipment Notifications$/ do
  log "Test: Uncheck Email Shipment Notifications checkbox"
  batch.toolbar.settings_modal.uncheck_shipment_email

end

Then /^Uncheck Email Shipment Deliveries$/ do
  log "Test: Uncheck Email Shipment Deliveries checkbox"
  batch.toolbar.settings_modal.uncheck_shipment_delivery

end

Then /^Uncheck USPS Terms in Settings Modal$/ do
  log "Test: Uncheck USPS Terms checkbox in Settings Modal"
  batch.toolbar.settings_modal.uncheck_usps_terms

end

Then /^Expect Show Unavailable Services Unchecked$/ do
  log "Test: Expect Show Unavailable Services Unchecked"

  actual = batch.toolbar.settings_modal.get_checkbox_status(1)
  log_expectation_eql "Show Unavailable Services", false, actual
  actual.should eql false
end

Then /^Expect Dont Show Print Confirmation Dialog Unchecked$/ do
  log "Test: Expect Dont Show Print Confirmation Dialog Unchecked"
  actual = batch.toolbar.settings_modal.get_checkbox_status(2)
  log_expectation_eql "Dont Show Print Confirmation Dialog", false, actual
  actual.should eql false

end

Then /^Expect USPS Terms Unchecked in Settings Modal$/ do
  log "Test: Expect USPS Terms Unchecked in Settings Modal"
  actual = batch.toolbar.settings_modal.get_checkbox_status(3)
  log_expectation_eql "USPS Restrictions", false, actual
  actual.should eql false

end

Then /^Expect Save Delivery Addresses Unchecked$/ do
  log "Test: Expect Save Delivery Addresses Unchecked"
  actual = batch.toolbar.settings_modal.get_checkbox_status(4)
  log_expectation_eql "Save Delivery Addresses", false, actual
  actual.should eql false

end

Then /^Expect Email Shipment Notifications Unchecked$/ do
  log "Test: Expect Email Shipment Notifications Unchecked"
  actual = batch.toolbar.settings_modal.get_checkbox_status(5)
  log_expectation_eql "Email Shipment Notifications", false, actual
  actual.should eql false

end

Then /^Expect Email Shipment Deliveries Unchecked$/ do
  log "Test: Expect Email Shipment Deliveries Unchecked"
  actual = batch.toolbar.settings_modal.get_checkbox_status(6)
  log_expectation_eql "Email Shipment Deliveries", false, actual
  actual.should eql false

end


Then /^Expect Show Unavailable Services Checked$/ do
  log "Test: Expect Show Unavailable Services Checked"

  actual = batch.toolbar.settings_modal.get_checkbox_status(1)
  log_expectation_eql "Show Unavailable Services", true, actual
  actual.should eql true

end

Then /^Expect Dont Show Print Confirmation Dialog Checked$/ do
  log "Test: Expect Dont Show Print Confirmation Dialog Checked"
  actual = batch.toolbar.settings_modal.get_checkbox_status(2)
  log_expectation_eql "Dont Show Print Confirmation Dialog", true, actual
  actual.should eql true

end

Then /^Expect USPS Terms Checked in Settings Modal$/ do
  log "Test: Expect USPS Terms Checked in Settings Modal"
  actual = batch.toolbar.settings_modal.get_checkbox_status(3)
  log_expectation_eql "USPS Restrictions", true, actual
  actual.should eql true

end

Then /^Expect Save Delivery Addresses Checked$/ do
  log "Test: Expect Save Delivery Addresses Checked"
  actual = batch.toolbar.settings_modal.get_checkbox_status(4)
  log_expectation_eql "Save Delivery Addresses", true, actual
  actual.should eql true

end

Then /^Expect Email Shipment Notifications Checked$/ do
  log "Test: Expect Email Shipment Notifications Checked"
  actual = batch.toolbar.settings_modal.get_checkbox_status(5)
  log_expectation_eql "Email Shipment Notifications", true, actual
  actual.should eql true

end

Then /^Expect Email Shipment Deliveries Checked$/ do
  log "Test: Expect Email Shipment Deliveries Checked"
  actual = batch.toolbar.settings_modal.get_checkbox_status(6)
  log_expectation_eql "Email Shipment Deliveries", true, actual
  actual.should eql true

end



Then /^Change Logoff Time to (.*)$/ do |duration|
  log "Test: Change Logoff Time to \"#{duration}\""
  batch.toolbar.settings_modal.select_logoff_time(duration)

end

Then /^Change Postdate Time to (.*)$/ do |time|
  log "Test: Change Postdate Time to \"#{time}\""
  batch.toolbar.settings_modal.select_postdate_time(time)

end

Then /^Change Postage Balance Notification Amount to (.*)$/ do |amount|
  log "Test: Change Postage Balance Notification Amount to \"#{amount}\""
  batch.toolbar.settings_modal.select_balance_notification(amount)
end

Then /^Expect Logoff Time to be (.*)$/ do |duration|
  log "Test: Expect Logoff Time to be #{duration}"
  actual = batch.toolbar.settings_modal.get_logoff_time
  log_expectation_eql "Logoff Time", duration, actual
  actual.should eql duration

end

Then /^Expect Postdate Time to be (.*)$/ do |time|
  log "Test: Expect Postdate Time to be #{time}"
  actual = batch.toolbar.settings_modal.get_postdate_time
  log_expectation_eql "Postdate Time", time, actual
  actual.should eql time

end

Then /^Expect Postage Balance Notification Amount to be (.*)$/ do |amount|
  log "Test: Expect Postage Balance Notification Amount to be #{amount}"
  actual = batch.toolbar.settings_modal.get_balance_notification_amt
  log_expectation_eql "Balance Notification Amount", amount, actual
  actual.should eql amount

end

Then /^Save Settings changes$/ do
  log "Test: Save settings changes"
  batch.toolbar.settings_modal.save_changes
end




