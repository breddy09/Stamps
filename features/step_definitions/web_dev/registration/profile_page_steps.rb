Then /^(?:|[Ii] )[Ll]oad(?:|ed) (?:|default )[Rr]egistration(?: [Pp]age| [Tt]heme (.*))$/ do |str|
  parameter[:registration_theme] = str
  step "I launch default browser"
  registration.load_theme(parameter[:registration_theme])
end

Then /^(?:|[Ii] )[Ll]oad(?:|ed) SDC Website$/ do
  step "I launch default browser"
  sdc_website.load_page
end

Then /^click on Get Started$/ do
  registration = sdc_website.get_started
end

Then /^[Ss]et [Rr]egistration [Pp]rofile [Ee]mail to (?:random value|(.*))$/ do |str|
  parameter[:email] = (str.nil?)?(helper.random_email):str
  registration.profile.email.set(parameter[:email])
end

Then /^[Ee]xpect [Rr]egistration [Pp]rofile [Ee]mail is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?parameter[:email]:str
  expect(registration.profile.email.text).to eql(str)
end

Then /^[Ss]et [Rr]egistration [Pp]rofile [Uu]sername to (?:random value|(.*))$/ do |str|
  parameter[:username] = (str.nil?)?(helper.random_string):str
  registration.profile.account_info.username.set(parameter[:usr])
end

Then /^[Ee]xpect [Rr]egistration [Pp]rofile [Uu]sername is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?parameter[:username]:str
  expect(registration.profile.account_info.username.text).to eql(str)
end

Then /^[Ss]et [Rr]egistration [Pp]rofile [Pp]assword to (?:random value|(.*))$/ do |str|
  parameter[:password] = (str.nil?)?(helper.random_password):str
  registration.profile.account_info.password.set(parameter[:pw])
end

Then /^[Ss]et [Rr]egistration [Pp]rofile [Rr]e-[Tt]ype password to (?:random value|(.*))$/ do |str|
  registration.profile.account_info.retype_password.set((str.nil?)?(parameter[:password]):str)
end

Then /^set [Rr]egistration [Pp]rofile [Ss]urvey [Qq]uestion to (.*)$/ do |str|
  parameter[:survey_question] = str
  parameter[:survey_question_selected] = registration.profile.survey_question.select(str)
  parameter[:survey_question_selected]
end

Then /^set [Rr]egistration [Pp]rofile [Pp]romo [Cc]ode to (.*)$/ do |str|
  parameter[:promo_code]
  registration.profile.promo_code.show_promo_code.set(parameter[:promo_code])
end

Then /^[Ee]xpect [Rr]egistration [Pp]rofile [Pp]romo [Cc]ode is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?parameter[:promo_code]:str
  expect(registration.promo_code.show_promo_code.text).to eql(str)
  str
end

Then /^select [Rr]egistration [Pp]rofile Security Question 1 (.*)$/ do |str|

end

Then /^[Oo]n [Rr]egistration [Pp]rofile page, Continue$/ do
  registration.profile.continue.click
end

Then /^[Oo]n [Rr]egistration [Pp]rofile page, continue to Mailing Information page$/ do
  10.times do
    registration.profile.continue.click
    sleep(0.35)
    break if registration.profile.membership.present?
  end
  expect("Unable to continue....").to eql "Mailing Information page Did not load." unless registration.profile.membership.present?
end

Then /^Registration Choose Supplies: Place Order$/ do
  expect(@registration_result).to be_truthy
  case @registration_result
    when Registration::UserIdTaken
      message = @registration_result.message
      raise "USER ID IS TAKEN!  #{message}"
    when Registration::ChooseSupplies
      if @registration_result.present?
        @web_mail = @registration_result.place_order
      end
    else
      raise "Unable to Place Order. Supplies page did not load"
  end
end

Then /^Registration Result: Wait for Download Page or Webpostage page to load$/ do
  case @registration_result_page
    when MailLandingPage
      @registration_result_page.wait_until_url_loads
    when Registration::DownloadPage
      @web_mail.landing_page.wait_until_present 10
    else
      #do nothing
  end
end


Then(/^Clear Email Field$/) do
  registration.profile.email.clear
end

Then(/^Clear User ID Field$/) do
  registration.profile.user_id.clear
end

Then(/^Clear How will you use Stamps\.com\?$/) do
  registration.profile.survey_question.clear
end

Then(/^Clear 1st Question$/) do
  registration.profile.secret_questions.secret_question_1.clear
end

Then(/^Clear 2nd Question$/) do
  registration.profile.secret_questions.secret_question_2.clear
end

