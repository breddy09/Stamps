

Then /^[Ee]xpect [Rr]egistration [Mm]embership bread crumbs to contain (.*)$/ do |str|
  expect(registration.bread_crumbs).to eql(str), "Bread crumb #{str} does not exist"
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership header contain (.*)$/ do |str|
  expect(registration.membership.header).to eql(str)
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership first name exists$/ do
  expect(registration.membership.first_name.present?).to be (true), "First Name doesn't exists on Membership Page"
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership last name exists$/ do
  expect(registration.membership.last_name.present?).to be (true), "Last Name doesn't exists on Membership Page"
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership company exists$/ do
  expect(registration.membership.company.present?).to be (true), "Company Name doesn't exists on Membership Page"
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership address exists$/ do
  expect(registration.membership.address.present?).to be (true), "Address doesn't exists on Membership Page"
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership city exists$/ do
  expect(registration.membership.city.present?).to be (true), "City doesn't exists on Membership Page"
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership state dropdown exists$/ do
  expect(registration.membership.city.present?).to be (true), "State doesn't exists on Membership Page"
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership zip exists$/ do
  expect(registration.membership.zip.present?).to be (true), "Zip doesn't exists on Membership Page"
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership phone exists$/ do
  expect(registration.membership.phone.present?).to be (true), "Phone doesn't exists on Membership Page"
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership stamps logo exists$/ do
  expect(registration.membership.stamps_logo.present?).to be (true), "Stamps logo doesn't exists on Membership Page"
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership usps logo exists$/ do
  expect(registration.membership.usps_logo.present?).to be (true), "Usps logo doesn't exists on Membership Page"
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership paragraph to contain (.*)$/ do |str|
  expect(registration.membership.paragraph).to eql(str)
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership cardholders name exists$/ do
  expect(registration.membership.cardholders_name.present?).to be (true), "Cardholders name textbox doesn't exists on Membership Page"
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership credit card number exists$/ do
  expect(registration.membership.credit_card_number.present?). to be (true), "Credit card number textbox doesn't exists on Membership Page"
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership month dropdown exists$/ do
  expect(registration.membership.month_dropdown.present?).to be (true), "Month drop-down doesn't exists on Membership Page"
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership year dropdown exists$/ do
  expect(registration.membership.month_dropdown.present?).to be (true), "Year drop-down doesn't exists on Membership Page"
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership Billing address same as mailing address checkbox exists$/ do
  expect(registration.membership.billingaddress_sameas_mailing address.present?).to be (true), "Billing address same as mailing address checkbox doesn't exists on Membership Page"
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership I agree to the Terms and conditions and Pricing details checkbox exists$/ do
  expect(registration.membership.pricingandTnC.present?).to be (true), "Terms and conditions and Pricing details checkbox doesn't exists on Membership Page"
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership back button exists$/ do
  expect(registration.membership.back_button.present?).to be (true), "Back button doesn't exists on Membership Page"
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership submit button exists$/ do
  expect(registration.membership.submit_button.present?).to be (true), "Submit button doesn't exists on Membership Page"
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership why do you need my mailing information to contain:$/ do |str|
  expect(registration.membership.why_do_you_need_mailingaddress).to eql(str)
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership Can I change my mailing address to contain:$/ do |str|
  expect(registration.membership.why_do_you_need_mailingaddress).to eql(str)
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership Can I use my Stamps.com account outside my office to contain:$/ do |str|
  expect(registration.membership.can_I_use_stamps_outside_office).to eql(str)
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership Is my credit card information safe to contain:$/ do |str|
  expect(registration.membership.is_my_cc_info_safe).to eql(str)
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership Pricing and billing details to contain:$/ do |str|
  expect(registration.membership.pricingnbilling).to eql(str)
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership Cancel anytime to contain:$/ do |str|
  expect(registration.membership.membership_cancel_anytime).to eql(str)
end

Then /^[Ee]xpect [Rr]egistration [Mm]embership Bonus Offer Details link exists and is clickable$/ do
  expect(registration.membership.offer_details_link.present?).to be (true), "Bonus Offer Details link doesn't exists on Membership Page"
end

Then /^[Cc]ontinue to Username Taken Model$/ do
  registration.membership.continue_btn.click
end

Then /^[Ee]xpect [Pp]rofile [Pp]age Privacy Policy link exists and is clickable$/ do
  # pending
  # 1. check for presence
  # 2. click if it is.
  # 3. close module if it opens one up or go back to previous page and restore state.
end

Then /^[Oo]n [Mm]embership [Pp]age, click Submit and correct errors$/ do
  step "On Registration Membership page, click Submit"
  10.times do
    case @registration_result
      #when there's a failure, correct field and resubmit.
      when Registration::MembershipPhone
        log.error "Membership Phone Textbox has error: #{@registration_result.help_text}"
        step "set Registration Membership page Phone to random"
        step "On Registration Membership page, click Submit"
      when Registration::MembershipCardNumber
        log.error "Membership Phone Textbox has error: #{@registration_result.help_text}"
        step "set Registration Membership page Card number to #{TestData.store[:card_number]}"
        step "On Registration Membership page, click Submit"
      when Registration::ChooseSupplies
        break
      else
        raise "Unknown Registration Result object. #{@registration_result.class} is not recognized. Update step \"On Registration Membership page, click Submit and correct errors\""
    end
  end
end


# Single Field Tooltips
Then /^[Ee]xpect [Mm]embership [Pp]age First Name tooltip to be (.*)$/ do |str|
  expect(registration.membership.first_name.single_field_help_block.tooltip).to eql(str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age Last Name tooltip to be (.*)$/ do |str|
  expect(registration.membership.last_name.single_field_help_block.tooltip).to eql(str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age Address tooltip to be (.*)$/ do |str|
  expect(registration.membership.address.single_field_help_block.tooltip).to eql(str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age City tooltip to be (.*)$/ do |str|
  expect(registration.membership.city.single_field_help_block.tooltip).to eql(str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age State tooltip to be (.*)$/ do |str|
  expect(registration.membership.state.single_field_help_block.tooltip).to eql(str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age Phone tooltip to be (.*)$/ do |str|
  expect(registration.membership.phone.single_field_help_block.tooltip).to eql(str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age Cardholder's Name tooltip to be (.*)$/ do |str|
  expect(registration.membership.cc_holder_name.single_field_help_block.tooltip).to eql(str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age Credit Card Number tooltip to be (.*)$/ do |str|
  step "pause for 5 seconds"
  expect(registration.membership.cc_number.single_field_help_block.tooltip).to eql(str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age Month tooltip to be (.*)$/ do |str|
  expect(registration.membership.cc_month.single_field_help_block.tooltip).to eql(str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age Year tooltip to be (.*)$/ do |str|
  expect(registration.membership.cc_year.single_field_help_block.tooltip).to eql(str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age Billing Address tooltip to be (.*)$/ do |str|
  expect(registration.membership.billing_address.single_field_help_block.tooltip).to eql(str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age Billing City tooltip to be (.*)$/ do |str|
  expect(registration.membership.billing_city.single_field_help_block.tooltip).to eql(str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age Billing State tooltip to be (.*)$/ do |str|
  expect(registration.membership.billing_state.single_field_help_block.tooltip).to eql(str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age Billing Zip tooltip to be (.*)$/ do |str|
  expect(registration.membership.billing_zip.single_field_help_block.tooltip).to eql(str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age Terms & Conditions tooltip to be (.*)$/ do |str|
  expect(registration.membership.agree_to_terms.single_field_help_block.tooltip).to eql(str)
end


# Tooltips

Then /^[Ee]xpect [Mm]embership [Pp]age First Name tooltip (\d+) to be (.*)$/ do |tooltip_index, str|
  expect(registration.membership.first_name.help_block.tooltip(tooltip_index)).to eql(str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age Last Name tooltip (\d+) to be (.*)$/ do |tooltip_index, str|
  expect(registration.membership.last_name.help_block.tooltip(tooltip_index)).to eql(str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age Credit Card Number tooltip (\d+) to be (.*)$/ do |tooltip_index, str|
  expect(registration.membership.cc_number.help_block.tooltip(tooltip_index)).to eql(str)
end


# Multi Match Address Model

Then /^[Ee]xpect [Mm]embership [Pp]age Address validation model pop up header is (.*)$/ do |str|
  expect(registration.membership.model_header).to eql(str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age Address validation model pop up header instructions is (.*)$/ do |str|
  expect(registration.membership.model_header_instructions).to eql(str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age Address validation model pop up Cancel button exists$/ do
  expect(registration.membership.cancel).to be_present,  "Cancel Button DOES NOT exists on Address validation model"
end

Then /^[Ee]xpect [Mm]embership [Pp]age Address validation model pop up Continue button exists$/ do
  expect(registration.membership.continue).to be_present,  "Continue Button DOES NOT exists on Address validation model"
end

Then /^[Cc]lick [Mm]embership [Pp]age Address validation model pop up Cancel [Bb]utton$/ do
  registration.membership.cancel.click
end

Then /^[Cc]lick [Mm]embership [Pp]age Address validation model pop up Continue [Bb]utton$/ do
  registration.membership.continue.click
end


# Username Taken Model

Then /^[Ee]xpect [Mm]embership [Pp]age Username Taken model pop up header is (.*)$/ do |str|
  step "Pause for 2 second"
  expect(registration.membership.uname_model_header).to eql(str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age Username Taken model pop up custom body is (.*)$/ do |str|
  expect(registration.membership.uname_model_custom_body).to eql(str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age Username Taken model pop up Username exists$/ do
  expect(registration.membership.uname_text_box).to be_present,  "Username DOES NOT exists on Username Taken model"
end

Then /^[Ee]xpect [Mm]embership [Pp]age Username Taken model pop up Continue button exists$/ do
  expect(registration.membership.uname_continue_btn).to be_present,  "Continue Button DOES NOT exists on Username Taken model"
end

Then /^[Ss]et [Mm]embership [Pp]age Username Taken model pop up Username to (?:random value|(.*))$/ do |str|
  registration.membership.uname_text_box.set(TestData.store[:uname_text_box] = str.nil? ? TestHelper.rand_alpha_str.capitalize : str)
end

Then /^[Cc]lick [Mm]embership [Pp]age Username Taken model pop up Continue [Bb]utton$/ do
  registration.membership.uname_continue_btn.click
end