
Then /^[Bb]lur out on [Pp]rofile [Pp]age$/ do
  registration.profile.header.blur_out
end

Then /^[Pp]opulate all [Pp]rofile page required fields$/ do
  step "set Profile page Email to random value"
  step "set Profile page Username to random value"
  step "set Membership page Company to random value"
  step "set Profile page Password to random value"
  step "set Profile page Re-type password to same as previous password"
  step "set Profile page Survey Question to Individual"
end

Then /^[Ss]et [Pp]rofile [Pp]age [Ee]mail to (?:random value|(.*))$/ do |str|
  registration.profile.email.textbox.wait_until_present(10)
  expect(registration.profile.email.textbox).to be_present, "Profile page did not load properly, check your test."
  registration.profile.email.textbox.set(test_param[:email]=(str.nil?)?(StampsTest.rand_email):str)
  step "blur out on profile page"


end

Then /^[Ss]et [Pp]rofile [Pp]age [Uu]sername to (?:random value|(.*))$/ do |str|
  registration.profile.account_username.textbox.set((test_param[:username]=(str.nil?)?(StampsTest.rand_usr):str))
  step "blur out on profile page"
end

Then /^[Ee]xpect [Pp]rofile [Pp]age [Uu]sername is (?:correct|(.*))$/ do |str|
  expect(registration.profile.account_username.textbox.text).to eql((str.nil?)?test_param[:username]:str)

end

Then /^[Ss]et [Pp]rofile [Pp]age [Pp]assword to (?:random value|(.*))$/ do |str|
 # registration.profile.account_password.set(test_param[:password]=(str.nil?)?"pass111":str) #test_helper.random_password
   registration.profile.account_password.textbox.set(test_param[:account_password]=(str.nil?)?StampsTest.rand_alpha_numeric(5,13):str)
end

Then /^[Ee]xpect [Pp]rofile [Pp]age [Pp]assword is (?:correct|(.*))$/ do |str|
  expect(registration.profile.account_password.textbox.text).to eql((str.nil?)?test_param[:account_password]:str)
end

Then /^[Ss]et [Pp]rofile [Pp]age [Rr]e-[Tt]ype [Pp]assword to (?:same as previous password|(.*))$/ do |str|
  registration.profile.retype_password.textbox.set(test_param[:retype_password]=(str.nil?)?(test_param[:account_password]):str)

end

Then /^[Ee]xpect [Pp]rofile [Pp]age [Rr]e-[Tt]ype [Pp]assword is (?:correct|(.*))$/ do |str|
  expect(registration.profile.retype_password.textbox.text).to eql((str.nil?)?test_param[:retype_password]:str)
end

# Business Use - Mostly mailing (letters/postcards/flats)
# Business/Ecommerce Use - Mostly shipping packages
# Business Use - Both mailing and shipping
# Individual/Home Office
Then /^[Ss]et [Pp]rofile [Pp]age [Ss]urvey [Qq]uestion to (.*)$/ do |str|
  test_param[:survey_question_selected]=registration.profile.survey_question.survey_question_dropdown.select(test_param[:survey_question]=str)
  end

Then /^[Ee]xpect [Pp]rofile [Pp]age [Ss]urvey [Qq]uestion is (?:correct|(.*))$/ do |str|
  expect(registration.profile.survey_question.survey_question_dropdown.text).to include((str.nil?)?test_param[:survey_question]:str)
end

#Magazine Ad
#Radio/Podcast/Streaming Audio
#Television Commercial
#Telephone Call
#Web Search
#Web Banner
#Trade show/convention
#Recommended by USPS
#Recommended by Friend
#Other
#Newspaper Ad
#Received Mailer
#Received Mailer
#Email from Stamps.com
# Already used in office
Then /^[Ss]et How did you hear about us\? to (.*)$/ do |str|
  test_param[:survey_question_selected]=registration.profile.referer_name.referer_name_dropdown.select(test_param[:referer_name]=str) if registration.profile.referer_name.referer_name_dropdown.present?
end

Then /^[Ee]xpect How did you hear about us\? is (?:correct|(.*))$/ do |str|
  expect(registration.profile.referer_name.referer_name_dropdown.text).to eql((str.nil?)?test_param[:referer_name]:str) if registration.profile.referer_name.present?
end

Then /^[Ss]et [Pp]rofile [Pp]age [Pp]romo [Cc]ode to (?:an empty string|(.*))$/ do |str|
  step "show profile page promo code textbox"
  registration.profile.promo_code.textbox.set(test_param[:promo_code]=(str.nil?)?'':str)

end

Then /^[Ee]xpect Profile page [Pp]romo [Cc]ode tooltip (\d+) to be (.*)$/ do |index, str|
  expect(registration.profile.promo_code.tooltip.text(index.to_i - 1)).to eql(str)
end

Then /^[Ss]how [Pp]rofile [Pp]age [Pp]romo [Cc]ode [Tt]extbox$/ do
  registration.profile.promo_code.link.click if registration.profile.promo_code.link.present?
  expect(registration.profile.promo_code.textbox).to be_present, "Unable to show Promo Code textbox upon clicking Show Promo Code link."
end

Then /^[Ee]xpect [Pp]rofile [Pp]age [Pp]romo [Cc]ode is (?:correct|(.*))$/ do |str|
  step "show profile page promo code textbox"
  expect(registration.profile.promo_code.textbox).to eql((str.nil?)?test_param[:promo_code]:str)
end

Then /^[Cc]heck [Pp]rofile [Pp]age [Mm]oney-saving offers and new products$/ do
       registration.profile.money_saving_offers_checkbox.fire_event(:click) unless registration.profile.money_saving_offers_checkbox.checked?

end

Then /^[Ee]xpect [Pp]rofile [Pp]age [Mm]oney-saving offers and new products is checked$/ do
  expect(registration.profile.money_saving_offers_checkbox.checked?).to be(true), "Profile Money-saving offers and new products is not checked. Got checked"
end

Then /^uncheck [Pp]rofile [Pp]age [Mm]oney-saving offers and new products$/ do
  registration.profile.money_saving_offers_checkbox.fire_event(:click)
end

Then /^[Ee]xpect [Pp]rofile [Pp]age [Mm]oney-saving offers and new products is unchecked$/ do
  expect(registration.profile.money_saving_offers_checkbox.checked?).not_to be(true), "Expected Profile Money-saving offers and new products is checked. Got unchecked"
end

Then /^[Cc]ontinue to [Mm]embership page$/ do
  registration.profile.continue_btn.click
  step "pause for 1 seconds"
end

