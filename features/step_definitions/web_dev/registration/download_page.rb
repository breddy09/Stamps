Then /^Registration: Expect Web Registration result page is either Download page or Webpostage$/ do
  case @web_mail
    when Registration::DownloadPage
      expectation="Congratulations on your new account!"
      actual_value=registration.membership.download_page.text
      #test_config.logger.step "Test #{(actual_value==expectation)?"Passed":"Failed"}"
      expect(actual_value).to eql expectation
    when WebMail
      expect(@web_mail.landing_page.whats_new_modal.window_title.text).to eql "What’s new in Stamps.com Online"
    else
      raise "Registration Result #{@web_mail.class} is not recognized"
  end
end

