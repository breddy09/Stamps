Then /^WL: navigates to default registration page for stamps$/ do
  SDCWWebsite.visit
  stamps_logo = WhiteLabel.common_page.stamps_logo
  stamps_logo.wait_until_present(timeout: 10)
  get_started = WhiteLabel.common_page.get_started
  get_started.click!
end