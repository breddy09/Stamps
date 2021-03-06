
Then /^[Ee]xpect PAM [Cc]ustomer [Pp]rofile [Pp]age [Uu]sername is (?:correct|(.*))$/ do |str|
  str = (str.nil?) ? TestData.hash[:username] : str
  expect(pam.customer_profile.user_name.text).to eql(str)
end

Then /^[Ee]xpect PAM [Cc]ustomer [Pp]rofile [Pp]age [Ss]tatus [Rr]eason is (.*)$/ do |str|
  expect(pam.customer_profile.status_reason).to eql(str)
end



