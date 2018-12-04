module SdcWebsite
  ##
  # Orders Landing Page
  class SdcOrdersLandingPage < SdcPage
    page_object(:username, tag: :text_field) { { xpath: '//input[@placeholder="USERNAME"]' } }
    page_object(:password, tag: :text_field) { { xpath: '//input[@placeholder="PASSWORD"]' } }
    page_object(:sign_in) { { xpath: '//span[contains(text(), "Sign In")]' } }
    page_object(:invalid_username) { { xpath: '//*[text()="Your username or password is invalid."]' } }

    page_url { |env| "https://print#{env}.stamps.com/SignIn/Default.aspx?env=Orders&" }

    # WEBAPPS-11290
    page_object(:help_link) { { xpath: '//a[text()="Visit our Learning Center"]' } }
    page_object(:sign_up) { { xpath: '//a[text()="New to Stamps.com? Sign Up"]' } }
    # page_object(:learning_center) { { xpath: 'xxxxxxx' } }

  end

  class SdcMailLandingPage < SdcPage
    page_url { |env| "https://print#{env}.stamps.com/webpostage/default2.aspx" }
  end

end
