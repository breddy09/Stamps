


Then /^[Ss]et WebReg Membership first name text box to (.*)$/ do |firstname|
  registration.membership.first_name.set firstname
end

Then /^[Ss]et WebReg Membership last name text box to (.*)$/ do |lastname|
  registration.membership.last_name.set lastname
end

Then /^[Ss]et WebReg Membership company text box to (.*)$/ do |company|
  registration.membership.company.set company
end

Then /^[Ss]et WebReg Membership address text box to (.*)$/ do |address|
  registration.membership.address.set address
end

Then /^[Ss]et WebReg Membership city text box to (.*)$/ do |city|
  registration.membership.city.set city
end

Then /^[Ss]et WebReg Membership state text box to (.*)$/ do |state|
  registration.membership.state.set state
end

Then /^[Ss]et WebReg Membership zip text box to (.*)$/ do |zip|
  registration.membership.zip.set zip
end

Then /^[Ss]et WebReg Membership phone text box to (.*)$/ do |phone|
  registration.membership.phone.set phone
end

Then /^[Ss]et WebReg Membership cardholders name textbox to (.*)$/ do |cardholdersname|
  registration.membership.cardholders_name.set cardholdersname
end

Then /^[Ss]et WebReg Membership credit card number textbox to (.*)$/ do |creditcardnumber|
  registration.membership.credit_card_number.set creditcardnumber
end

Then /^[Ss]et WebReg Membership month dropdown to (.*)$/ do |month|
  registration.membership.month.set month
end

Then /^[Ss]et WebReg Membership year to (.*)$/ do |year|
  registration.membership.year.set year
end

Then /^[Ss]et WebReg Membership billing address same as mailing address$/ do
  registration.membership.billingadd_same_as_mailingadd
end

Then /^[Ss]et WebReg Membership terms and condition$/ do
  registration.membership.termsnconditions
end

Then /^[Oo]n WebReg Membership page continue to Choose Supplies page$/ do
  registration.membership.submit_button
end

Then /^[Ee]xpect WebReg Security questions header contain (.*)$/ do |str|
  expect(registration.securityquestion.header).to eql(str)
end

Then /^[Ee]xpect WebReg Security questions subheader contain (.*)$/ do |str|
  expect(registration.securityquestion.subheader).to eql(str)
end


Then /^[Ee]xpect WebReg Security questions header contain (.*)$/ do |str|
  expect(registration.securityquestion.header).to eql(str)
end


Then /^[Oo]n WebReg ATG page continue to WebReg Security questions page$/ do
  registration.membership.atg_placeorderbutton
end

Then /^[Ee]xpect WebReg Securityquestions first secret question dropup to contain (.*)$/ do |str|
  expect(registration.securityquestion.firstsecret_question_dropup). to eql(str)
end

Then /^[Ee]xpect WebReg Securityquestions second secret question dropup to contain (.*)$/ do |str|
  expect(registration.securityquestion.secondsecret_question_dropup). to eql(str)
end

Then /^[Ex]xpect WebReg Securityquestions get started button exists/ do
  registration.securityquestion.getstarted_button
end


