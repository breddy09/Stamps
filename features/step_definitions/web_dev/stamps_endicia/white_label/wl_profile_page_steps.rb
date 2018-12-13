
Then /^WL: blur_out on profile page$/ do
  WhiteLabel.profile_page.profile_bread_crumb.blur_out
end

#.......Email......#

Then /^WL: expect profile page email exists$/ do
   email = WhiteLabel.profile_page.email
   email.wait_until_present(timeout: 20)
  expect(email).to be_present
end

Then /^WL: expect profile page email is (?:correct|(.*))$/ do |str|
  email = WhiteLabel.profile_page.email
  str ||= TestData.hash[:email]
  expect(email.text_value.strip).to eql(str)
  TestData.hash[:email] = str
end

Then /^WL: set profile page email to (?:random value|(.*))$/ do |str|
  email = WhiteLabel.profile_page.email
  email.wait_until_present(timeout: 30)

  str ||=  TestHelper.rand_email.capitalize
  5.times do
    email.clear
    email.set(str)
    break unless email.text_value.strip == ''
  end
  expect(email.text_value.strip).not_to eql('')
  step 'WL: blur_out on profile page'

  TestData.hash[:atg_promotion] =  WhiteLabel.choose_supplies.atg_promotion
  TestData.hash[:email] = str
  SdcLogger.debug "Email = #{TestData.hash[:email]}"
end

Then /^WL: expect profile page email tooltip count is (.*)$/ do |count|
  email_tooltip_count = WhiteLabel.profile_page.email_tooltip
  email_tooltip_count.wait_until_present(timeout: 5)
  TestData.hash[:email_tooltip_count] = email_tooltip_count.text_value.split("\n")
  expect(TestData.hash[:email_tooltip_count].size).to eql(count.to_i)
end

Then /^WL: expect profile page email tooltip index (\d+) to be (.*)$/ do |index, str|
  email_tooltip = WhiteLabel.profile_page.email_tooltip
  email_tooltip.wait_until_present(timeout: 5)
  TestData.hash[:email_tooltip] = email_tooltip.text_value.split("\n")
  expect(TestData.hash[:email_tooltip][index - 1]).to eql(str)
end

#.......Username......#

Then /^WL: expect profile page username exists$/ do
  expect(WhiteLabel.profile_page.username).to be_present
end

Then /^WL: set profile page username to (?:random value|(.*))$/ do |str|
  username = WhiteLabel.profile_page.username
  username.wait_until_present(timeout: 10)
  username.clear

  str ||= TestHelper.rand_usr.capitalize
  if TestSession.env.usr
    5.times do
      username.set( TestSession.env.usr)
      break unless username.text_value.strip == ''
    end
  else
    5.times do
      username.set(str)
      break unless username.text_value.strip == ''
    end
  end
  expect(username.text_value.strip).not_to eql('')
  step "WL: blur_out on profile page"
  TestData.hash[:username_taken] = WhiteLabel.common_page.username_query(TestData.hash[:username_taken])
  SdcLogger.debug "UserName = #{str}"
  TestData.hash[:username] = str
end

Then /^WL: set pp username to an existing username from db$/ do
  existing_usr = WhiteLabel.common_page.existing_username_query
  step "WL: set profile page username to #{existing_usr}"
end

Then /^WL: expect profile page username is (?:correct|(.*))$/ do |str|
  username = WhiteLabel.profile_page.username
  str ||= TestData.hash[:username]
  expect(username.text_value.strip).to eql(str)
  TestData.hash[:username] = str
end

Then /^WL: expect profile page username tooltip count is (.*)$/ do |count|
  username_tooltip_count = WhiteLabel.profile_page.username_tooltip
  username_tooltip_count.wait_until_present(timeout: 5)
  TestData.hash[:username_tooltip_count] = username_tooltip_count.text_value.split("\n")
  expect(TestData.hash[:username_tooltip_count].size).to eql(count.to_i)
end

Then /^WL: expect profile page username tooltip index (\d+) to be (.*)$/ do |index, str|
  username_tooltip = WhiteLabel.profile_page.username_tooltip
  username_tooltip.wait_until_present(timeout: 5)
  TestData.hash[:username_tooltip] = username_tooltip.text_value.split("\n")
  expect(TestData.hash[:username_tooltip][index.to_i - 1]).to eql(str)
end

#.......Password......#

Then /^WL: expect profile page password exists$/ do
  expect(WhiteLabel.profile_page.password).to be_present
end

Then /^WL: set profile page password to (?:random value|(.*))$/ do |str|
  password = WhiteLabel.profile_page.password
  password.wait_until_present(timeout: 10)
  password.clear

  str ||= '1' + TestHelper.rand_alpha_numeric(min:6, max:10)
  if TestSession.env.pw
    5.times do
      password.set(TestSession.env.pw)
      break unless password.text_value.strip == ''
    end
  else
    5.times do
      password.set(str)
      break unless password.text_value.strip == ''
    end
  end
  expect(password.text_value.strip).not_to eql('')
  step 'WL: blur_out on profile page'
  SdcLogger.debug  "Password = #{str}"
  TestData.hash[:account_password] = str
end

Then /^WL: expect profile page password is (?:correct|(.*))$/ do |str|
  account_password = WhiteLabel.profile_page.password
  str ||= TestData.hash[:account_password]
  str = '' if str == 'empty'
  expect(account_password.text_value.strip).to eql((str.nil?) ? TestData.hash[:account_password] : str)
end

Then /^WL: expect profile page password tooltip count is (.*)$/ do |count|
  password_tooltip_count = WhiteLabel.profile_page.password_tooltip
  password_tooltip_count.wait_until_present(timeout: 5)
  TestData.hash[:password_tooltip_count] = password_tooltip_count.text_value.split("\n")
  expect(TestData.hash[:password_tooltip_count].size).to eql(count.to_i)
end

Then /^WL: expect profile page password tooltip index (\d+) to be (.*)$/ do |index, str|
  password_tooltip = WhiteLabel.profile_page.password_tooltip
  password_tooltip.wait_until_present(timeout: 5)
  TestData.hash[:password_tooltip] = password_tooltip.text_value.split("\n")
  expect(TestData.hash[:password_tooltip][index.to_i - 1]).to eql(str)
end

#.......re-type Password......#

Then /^WL: expect profile page re-type password exists$/ do
  expect(WhiteLabel.profile_page.confirm_password).to be_present
end

Then /^WL: set profile page re-type password to (?:same as previous password|(.*))$/ do |str|
  confirm_password = WhiteLabel.profile_page.confirm_password
  str ||= TestData.hash[:account_password]
  5.times do
    confirm_password.set(str)
    break unless confirm_password.text_value == ''
  end
  step 'WL: blur_out on profile page'
  TestData.hash[:retype_password] = str
end

Then /^WL: expect profile page re-type password is (?:correct|(.*))$/ do |str|
  retype_password = WhiteLabel.profile_page.confirm_password
  str ||= TestData.hash[:retype_password]
  str = '' if str == 'empty'
  expect(retype_password.text_value.strip).to eql(str)
end

Then /^WL: expect profile page re-type password tooltip index (\d+) to be (.*)$/ do |index, str|
  confirm_password_tooltip = WhiteLabel.profile_page.confirm_password_tooltip
  confirm_password_tooltip.wait_until_present(timeout: 5)
  tooltip_text = confirm_password_tooltip.text_value.split("\n")
  expect(tooltip_text[index - 1]).to eql(str)
end

#.......promo code......#

Then /^WL: expect profile page promo code tooltip (\d+) to be (.*)$/ do |index, str|
  promo_code_tooltip = WhiteLabel.profile_page.promo_code_tooltip
  promo_code_tooltip.wait_until_present(timeout: 5)
  tooltip_text = promo_code_tooltip.text_value.split("\n")
  expect(tooltip_text[index - 1]).to eql(str)
end

Then /^WL: expect profile page promo code link exists$/ do
  expect(WhiteLabel.profile_page.promo_code_link).to be_present
end

Then /^WL: expect profile page promo code exists$/ do
  profile_page = WhiteLabel.profile_page
  if profile_page.promo_code.present?
    expect(profile_page.promo_code).to be_present
  else
    expect(profile_page.promo_code_hidden).to be_present
  end
end

Then /^WL: expect profile page promo code to equal source id promo code$/ do
  step 'WL: show profile page promo code'
  profile_page = WhiteLabel.profile_page
  if profile_page.promo_code.present?
     expect(profile_page.promo_code.text_value.strip).to eql(TestData.hash[:promo_code].strip)
  else
    expect(profile_page.promo_code_hidden.text_value.strip).to eql(TestData.hash[:promo_code].strip)
  end
end

Then /^WL: set profile page promo code to (.*)$/ do |str|
  step 'WL: show profile page promo code'
  profile_page = WhiteLabel.profile_page
  step'pause for 1 second'

  if str == 'default'
    str = TestData.hash[:promo_code]
  elsif str ==  'empty'
    str = ''
  else
    str = str
  end

  5.times do
    if profile_page.promo_code.present?
      profile_page.promo_code.clear
      profile_page.promo_code.set(str)
      break unless profile_page.promo_code.text_value.strip == ''
    else
      profile_page.promo_code_hidden.clear
      profile_page.promo_code_hidden.set(str)
      break unless profile_page.promo_code_hidden.text_value.strip == ''
    end
  end
  TestData.hash[:set_promo_code] = str
  step 'WL: blur_out on profile page'
end

Then /^WL: show profile page promo code$/ do
  profile_page = WhiteLabel.profile_page
  profile_page.promo_code_link.click if profile_page.promo_code_link.present?
  if profile_page.promo_code.present?
   expect(profile_page.promo_code).to be_present
  else
    expect(profile_page.promo_code_hidden).to be_present
  end
end

Then /^WL: expect profile page promo code is correct$/ do
  step 'WL: show profile page promo code'
  step 'pause for 1 second'
  profile_page = WhiteLabel.profile_page
  if profile_page.promo_code.present?
    expect(profile_page.promo_code.text_value.strip).to eql(TestData.hash[:set_promo_code])
  else
    expect(profile_page.promo_code_hidden.text_value.strip).to eql(TestData.hash[:set_promo_code])
  end
end

#.......survey quetion......#

Then /^WL: expect profile page survey question exists$/ do
  expect(WhiteLabel.profile_page.survey).to be_present
end

Then /^WL: set profile page survey question to (.*)$/ do |str|
  profile_page = WhiteLabel.profile_page
  profile_page.survey.click
  profile_page.survey_selection(str)
  profile_page.survey_element.safe_wait_until_present(timeout: 2)
  profile_page.survey_element.click!
  expect(profile_page.survey.attribute_value('title').strip).to eql str
  step 'WL: blur_out on profile page'
  TestData.hash[:survey] = str
end

Then /^WL: expect profile page survey question is (?:correct|(.*))$/ do |str|
  survey = WhiteLabel.profile_page.survey
  str ||= TestData.hash[:survey]
  expect(survey.title).to eql(str)
  TestData.hash[:survey] = str
end

Then /^WL: set profile page how did you hear about us\? to (.*)$/ do |str|
  profile_page = WhiteLabel.profile_page
  if profile_page.referrer_name.present?
    profile_page.referrer_name.click
    profile_page.referrer_name_selection(str)
    profile_page.referrer_name_element.safe_wait_until_present(timeout: 2)
    profile_page.referrer_name_element.click!
    TestData.hash[:referrer_name] = profile_page.referrer_name.attribute_value('title').strip
    step 'WL: blur_out on profile page'
    expect(TestData.hash[:referrer_name]).to eql str
  else
    #ignore
  end
end

Then /^WL: expect profile page how did you hear about us option is (?:correct|(.*))$/ do |str|
  referrer_name = WhiteLabel.profile_page.referrer_name
  str ||= TestData.hash[:referrer_name]

  if referrer_name.present?
    expect(referrer_name.title).to eql(str)
    TestData.hash[:referrer_name] = str
  else
    #ignore
  end
end

Then /^WL: expect profile page continue button exists$/ do
  expect(WhiteLabel.profile_page.continue).to be_present
end

Then /^WL: click profile page continue button$/ do
  step 'pause for 1 second'
  WhiteLabel.profile_page.continue.click!
  step 'pause for 1 second'
end

##---------UI Validation------##

Then /^WL: expect profile bread crumbs is (.*)$/ do |str|
  expect(WhiteLabel.profile_page.profile_bread_crumb.text_value.strip).to eql(str)
end

Then /^WL: expect profile page header contain (.*)$/ do |str|
  header = WhiteLabel.profile_page.header
  header.wait_until_present(timeout: 60)
  expect(header.text_value).to eql(str)
end

Then /^WL: expect profile page paragraph contain$/ do |str|
  expect(WhiteLabel.profile_page.side_acct_text.text_value.strip).to eql(str)
end

Then /^WL: expect profile page side content side account header is (.*)$/ do |str|
  expect(WhiteLabel.profile_page.side_acct_header.text_value.strip).to eql(str)
end

Then /^WL: expect profile page money-saving offers and new products header is \"(.*)\"$/ do |str|
  expect(WhiteLabel.profile_page.side_opt_in_header.text_value.strip).to eql(str)
end

Then /^WL: expect profile page content under money-saving offers and new products$/ do |str|
  expect(WhiteLabel.profile_page.side_opt_in_text.text_value.strip).to eql(str)
end

Then /^WL: check profile page money-saving offers and new products$/ do
  WhiteLabel.profile_page.money_saving_offers_checkbox.check
end

Then /^WL: expect profile page money-saving offers and new products is checked$/ do
  expect(WhiteLabel.profile_page.money_saving_offers_checkbox.checked?).not_to be(true)
end

Then /^WL: uncheck profile page money-saving offers and new products$/ do
  WhiteLabel.profile_page.money_saving_offers_checkbox.check
end

Then /^WL: expect profile page money-saving offers and new products is unchecked$/ do
  expect(WhiteLabel.profile_page.money_saving_offers_checkbox.checked?).to be(false)
end

Then /^WL: set profile page default values$/ do
  step 'WL: set profile page email to random value'
  step 'WL: set profile page username to random value'
  step 'WL: set profile page password to random value'
  step 'WL: set profile page re-type password to same as previous password'
  step 'WL: set profile page survey question to Business Use - Both mailing and shipping'
  step 'WL: set profile page how did you hear about us? to Received Mailer'
  step 'WL: set profile page promo code to default'
  #step 'WL: expect offer id and source id are the same between sdc_website and stamp_mart db'
end

Then /^WL: expect profile page default values are correct$/ do
  step 'WL: expect profile page email is correct'
  step 'WL: expect profile page username is correct'
  step 'WL: expect profile page password is correct'
  step 'WL: expect profile page re-type password is correct'
  step 'WL: expect profile page survey question is correct'
  step 'WL: expect profile page promo code is correct'
end