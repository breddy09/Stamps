
Then /^visit Orders landing page$/ do
  SdcOrdersLandingPage.visit(case SdcEnv.env
                             when :qacc
                               'ext.qacc'
                             when :qasc
                               'ext.qasc'
                             when :stg
                               '.testing'
                             when :prod
                               ''
                             else
                               # ignore
                             end)
end

Then /^visit Mail$/ do
  SdcMailLandingPage.visit(case SdcEnv.env
                             when :qacc
                               'ext.qacc'
                             when :qasc
                               'ext.qasc'
                             when :stg
                               '.testing'
                             when :prod
                               ''
                             else
                               # ignore
                           end)
end

Then /^Signin mail$/ do
  env = case SdcEnv.env
        when :qacc
          'ext.qacc'
        when :qasc
          'ext.qasc'
        when :stg
          '.testing'
        when :prod
          ''
        else
          # ignore
        end
  SdcMailLandingPage.visit(env)
end

Then /^printon stuff$/ do

  SdcMail.print_form.print_on("")
end

Then /^[Ss]ign-in to SDC Website$/ do
  step "sign-in to Orders as #{usr}, #{pw}" if SdcEnv.sdc_app == :orders
  step "sign-in to Mail as #{usr}, #{pw}" if SdcEnv.sdc_app == :mail
end

Then /^sign-out of SDC Website$/ do
   if SdcEnv.browser
     3.times do
       SdcNavigation.user_drop_down.signed_in_user.safe_wait_until_present(timeout: 5)
       SdcNavigation.user_drop_down.signed_in_user.hover
       SdcNavigation.user_drop_down.sign_out_link.safe_wait_until_present(timeout: 1)
       SdcNavigation.user_drop_down.sign_out_link.safe_click
       SdcWebsite.landing_page.username.safe_wait_until_present(timeout: 3)
       break if SdcWebsite.landing_page.username.present?
     end
   elsif SdcEnv.ios
     begin
       SdcNavigation.user_drop_down.signed_in_user.click
       SdcNavigation.user_drop_down.sign_out_link.send_keys(:enter)
     rescue
       # ignore
     end

   elsif SdcEnv.android
     SdcPage.browser.hide_keyboard
     SdcPage.browser.action.move_to(SdcNavigation.user_drop_down.signed_in_user).click.perform
     SdcPage.browser.action.move_to(SdcNavigation.user_drop_down.sign_out_link).send_keys(:enter).perform
   end
end

Then /^sign-in to Orders(?: as (.+), (.+)|)$/ do |usr, pw|
  begin
    if SdcEnv.usr.nil? || SdcEnv.usr.downcase == 'default'
      credentials = SdcUserCredentials.fetch(SdcTest.scenario.tags[0].name)
      usr = credentials[:username]
      pw = credentials[:password]
    else
      usr = SdcEnv.usr
      pw = SdcEnv.pw
    end
  end unless usr && pw

  expect(usr).to be_truthy
  expect(pw).to be_truthy

  SdcWebsite.landing_page.username.set(TestData.store[:username] = usr)
  SdcWebsite.landing_page.password.set(TestData.store[:password] = pw)
  if SdcEnv.browser
    if SdcEnv.sauce_device
      SdcWebsite.landing_page.sign_in.click
      SdcWebsite.navigation.user_drop_down.signed_in_user.safe_wait_until_present(timeout: 10)
      sleep 5
    else
      3.times do
        SdcWebsite.landing_page.sign_in.safe_click
        break if SdcWebsite.navigation.user_drop_down.signed_in_user.present?
      end
      SdcWebsite.orders.loading_popup.safe_wait_until_present(timeout: 5)
      SdcWebsite.orders.loading_popup.safe_wait_while_present(timeout: 5)
      SdcWebsite.navigation.user_drop_down.signed_in_user.safe_wait_until_present(timeout: 5)
      expect(SdcWebsite.navigation.user_drop_down.signed_in_user.text_value).to eql(TestData.store[:username])
    end

  elsif SdcEnv.ios
    begin
      landing_page.sign_in.click
      landing_page.sign_in.send_keys(:enter)
        #landing_page.sign_in.safe_send_keys(:enter)
    rescue
      # ignore
    end

  elsif SdcEnv.android
    SdcPage.browser.hide_keyboard
    SdcPage.browser.action.move_to(landing_page.sign_in).click.perform
    SdcPage.browser.action.move_to(landing_page.sign_in).send_keys(:enter).perform
  end

end

Then /^set username in Mail(?: to (.+)|)$/ do |usr|

  begin
    if SdcEnv.usr.nil? || SdcEnv.usr.downcase == 'default'
      credentials = SdcUserCredentials.fetch(SdcTest.scenario.tags[0].name)
      usr = credentials[:username]
    else
      usr = SdcEnv.usr
    end
  end unless usr

  expect(usr).to be_truthy

  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.click
  modal.username.set(TestData.store[:username] = usr)

end

Then /^set password in Mail(?: to (.+)|)$/ do |pw|
  begin
    if SdcEnv.usr.nil? || SdcEnv.usr.downcase == 'default'
      credentials = SdcUserCredentials.fetch(SdcTest.scenario.tags[0].name)
      pw = credentials[:password]
    else
      pw = SdcEnv.pw
    end
  end unless pw

  expect(pw).to be_truthy

  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.click
  modal.password.set(TestData.store[:password] = pw)
end

Then /^set [Rr]emember [Uu]sername to [Cc]hecked$/ do
  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.click
  modal.remember_username.set
end

Then /^set [Rr]emember [Uu]sername to [Uu]nchecked$/ do
  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.click
  modal.remember_username.clear
end

Then /^[Ee]xpect [Rr]emember [Uu]sername to be [Cc]hecked$/ do
  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.click
  expect(modal.remember_username.set?).to eql true
end

Then /^[Ee]xpect [Rr]emember [Uu]sername to be [Uu]nchecked$/ do
  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.click
  expect(modal.remember_username.set?).to eql false
end


Then /^sign-in to Mail(?: as (.+), (.+)|)$/ do |usr, pw|
  begin
    if SdcEnv.usr.nil? || SdcEnv.usr.downcase == 'default'
      credentials = SdcUserCredentials.fetch(SdcTest.scenario.tags[0].name)
      usr = credentials[:username]
      pw = credentials[:password]
    else
      usr = SdcEnv.usr
      pw = SdcEnv.pw
    end
  end unless usr && pw

  expect(usr).to be_truthy
  expect(pw).to be_truthy

  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.click
  modal.username.set(TestData.store[:username] = usr)
  modal.password.set(TestData.store[:password] = pw)
  if SdcEnv.browser
    5.to_i.times do
      begin
        modal.sign_in.click
        signed_in_user.wait_until_present(timeout: 3)
        break if signed_in_user.present?
      rescue
        # ignore
      end
    end
    sleep(10)
    expect(SdcWebsite.navigation.user_drop_down.signed_in_user.text_value).to include(TestData.store[:username])

  elsif SdcEnv.ios
    raise StandardError, 'Not Implemented'
  elsif SdcEnv.android
    raise StandardError, 'Not Implemented'
  end
  sleep 3
end

Then /^[Cc]lick the [Ss]ign [Ii]n button in [Mm]ail$/ do
  modal = SdcWebsite.navigation.mail_sign_in_modal
  signed_in_user = SdcWebsite.navigation.user_drop_down.signed_in_user
  if SdcEnv.browser
    2.to_i.times do
      begin
        modal.sign_in_link.click
        modal.sign_in.click
        signed_in_user.wait_until_present(timeout: 3)
        break if signed_in_user.present?
      rescue
        # ignore
      end
    end
    sleep(10)
    SdcWebsite.navigation.user_drop_down.signed_in_user.safe_wait_until_present(timeout: 5)
    expect(SdcWebsite.navigation.user_drop_down.signed_in_user.text_value).to include(TestData.store[:username])

  elsif SdcEnv.ios
    raise StandardError, 'Not Implemented'
  elsif SdcEnv.android
    raise StandardError, 'Not Implemented'
  end
  sleep 3

end

Then /^[Oo]pen [Ss]ign [Ii]n [Mm]odal in [Mm]ail$/ do
  modal=SdcWebsite.navigation.mail_sign_in_modal
  2.to_i.times do
    begin
      modal.sign_in_link.click
      modal.username.safe_wait_until_present(timeout: 5)
      break if modal.username.present?
    rescue
      # ignore
    end
  end
end

Then /^[Ee]xpect [Uu]sername is present in Mail [Uu]sername field$/ do

  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.click
  expect(modal.username.value).to eql TestData.store[:username]

end


