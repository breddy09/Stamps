
Then /^[Ss]eeart PAM Customer Search page username from parameter file$/ do
  step "set PAM Customer Search page username to #{SdcTest['username']}"
end

Then /^[Ss]earch PAM [Cc]ustomer [Ss]earch page for username (.*)$/ do |str|
  iteration = 10
  iteration.times do |index|
    pam.customer_search_page.username.set(TestData.hash[:username] = str)
    pam.customer_search_page.search_btn.click
    pam.customer_profile_page.wait_until_present(2)
    if pam.customer_profile_page.present?
      break
    elsif pam.customer_not_found_page.present?
      SdcLogger.debug "PAM:  #{pam.customer_not_found_page.status_reason.text}"
      SdcDriver.browser.back unless index == iteration - 1
      sleep(0.25)
      pam.customer_profile_page.username.set(str)
    elsif pam.meter_info_not_available.present?
      SdcLogger.debug "PAM:  #{pam.meter_info_not_available.error_message.text}"
      SdcDriver.browser.back unless index == iteration - 1
    end
  end
  expect(pam.customer_not_found_page.status_reason.text).to eql("OK") if pam.customer_not_found_page.present?
  expect(pam.meter_info_not_available.error_message.text).to eql("OK") if pam.meter_info_not_available.present?
  expect(pam.customer_profile_page.username.text).to eql(TestData.hash[:username])
end

Then /^[Ss]et PAM [Cc]ustomer [Ss]earch page [Uu]sername to (?:cached value|(.*))$/ do |str|
  TestData.hash[:username] = str unless str.nil?
  pam.customer_search.search_username(TestData.hash[:username])
end

Then /^[Cc]lick PAM [Cc]ustomer [Ss]earch page [Ss]earch [Bb]utton$/ do
  TestData.hash[:pam_search_result] = pam.customer_search.search_username(TestData.hash[:username])
end

Then /^[Cc]lick PAM AppCap Overrides link$/ do
  10.times do
    pam.pam_header.appcapp_overrides_link.click
    break if pam.appcap_overrides_page.present?
  end
  expect(pam.appcap_overrides_page).to be_present, "PAM AppCap Overrides is not present"
  expect(pam.appcap_overrides_page.username.text.downcase).to eql(TestData.hash[:username].downcase)
end

Then /^[Ss]et PAM AppCap Overrides Allow High Risk Countries to Always On$/ do
  pam.appcap_overrides_page.certified_mail.always_on
end

Then /^[Oo]n PAM AppCap Overrides page, set Internet Mail Printing to Always On$/ do
  pam.appcap_overrides_page.internet_postage_printing.always_on
end

Then /^[Oo]n PAM AppCap Overrides page, set Internet Mail Printing to Always Off$/ do
  pam.appcap_overrides_page.internet_postage_printing.always_off
end

Then /^[Oo]n PAM AppCap Overrides page, set Internet Mail Printing to No Override$/ do
  pam.appcap_overrides_page.internet_postage_printing.no_override
end

Then /^[Oo]n PAM AppCap Overrides page, set Netstamps Printing to Always On$/ do
  pam.appcap_overrides_page.netstamps_printing.always_on
end

Then /^[Oo]n PAM AppCap Overrides page, set Netstamps Printing to Always Off$/ do
  pam.appcap_overrides_page.netstamps_printing.always_off
end

Then /^[Oo]n PAM AppCap Overrides page, set Netstamps Printing to No Override$/ do
  pam.appcap_overrides_page.netstamps_printing.no_override
end

Then /^[Oo]n PAM AppCap Overrides page, set Shipping Label Printing to Always On$/ do
  pam.appcap_overrides_page.shipping_label_printing.always_on
end

Then /^[Oo]n PAM AppCap Overrides page, set Shipping Label Printing to Always Off$/ do
  pam.appcap_overrides_page.shipping_label_printing.always_off
end

Then /^[Oo]n PAM AppCap Overrides page, set Shipping Label Printing to Override$/ do
  pam.appcap_overrides_page.shipping_label_printing.no_override
end

Then /^[Oo]n PAM AppCap Overrides page, set International Shipping to Always On$/ do
  pam.appcap_overrides_page.international_shipping.always_on
end

Then /^[Oo]n PAM AppCap Overrides page, set International Shipping to Always Off$/ do
  pam.appcap_overrides_page.international_shipping.always_off
end

Then /^[Oo]n PAM AppCap Overrides page, set International Shipping to Override$/ do
  pam.appcap_overrides_page.international_shipping.no_override
end

Then /^[Oo]n PAM AppCap Overrides page, set Allow High Risk Countries to Always On$/ do
  pam.appcap_overrides_page.allow_high_risk_countries.always_on
end

Then /^[Oo]n PAM AppCap Overrides page, set Allow High Risk Countries to Always Off$/ do
  pam.appcap_overrides_page.allow_high_risk_countries.always_off
end

Then /^[Oo]n PAM AppCap Overrides page, set Allow High Risk Countries to Override$/ do
  pam.appcap_overrides_page.allow_high_risk_countries.no_override
end

Then /^[Oo]n PAM AppCap Overrides page, set Mailing Label Printing to Always On$/ do
  pam.appcap_overrides_page.mailing_label_printing.always_on
end

Then /^[Oo]n PAM AppCap Overrides page, set Mailing Label Printing to Always Off$/ do
  pam.appcap_overrides_page.mailing_label_printing.always_off
end

Then /^[Oo]n PAM AppCap Overrides page, set Mailing Label Printing to Override$/ do
  pam.appcap_overrides_page.mailing_label_printing.no_override
end

Then /^[Oo]n PAM AppCap Overrides page, Submit$/ do
  result = pam.appcap_overrides_page.submit.ok
  SdcLogger.debug " ############## #{TestData.hash[:username]}: #{result}"
end
