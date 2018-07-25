module WhiteLabel
  class ProfilePage < SdcPage
    text_field(:email, tag: :text_field, required: true) { { id: 'email' } }
    text_field(:username, tag: :text_field, required: true) { { id: 'username' } }
    text_field(:password, tag: :text_field, required: true) { { id: 'password' } }
    text_field(:confirm_password, tag: :text_field, required: true) { { id: 'confirmPassword' } }
    link(:promo_code_link) { { id: 'showPromoCode' } }
    text_field(:promo_code_textbox, tag: :text_field, required: true) { { id: 'promoCodeHidden' } }
    page_object(:survey) {{xpath: '//button[contains(@class, "dropdown-toggle")][@data-id="usageType"]'}}
    page_object(:referrer_name) {{xpath: '//button[contains(@class, "dropdown-toggle")][@data-id="referrerName"]'}}
    page_objects(:money_saving_offers,  index: 0) { {id: "optIn"} }
    button(:continue) {{id: 'next'}}

    def survey_selection(str, name = :survey_element)
      page_object(name) { {xpath: "//span[contains(text(), \" #{str} \")]" } }
    end

    def referrer_name_selection(str, name = :referrer_name_element)
      page_object(name) { { xpath: "//span[contains(text(), \"#{str}\")]" } }
    end

  end

  class MembershipPage < SdcPage
    page_object(:header) { {xpath: '//h1[(contains(text(), "Set up your personal Post Office"))]'} }
    page_object(:membership_bread_crumb) { {xpath: '//li[@id="breadcrumb_Membership"]/span'} }
    text_field(:first_name, tag: :text_field, required: true) { { id: 'firstName' } }
    text_field(:last_name, tag: :text_field, required: true) { { id: 'lastName' } }
    text_field(:company, tag: :text_field) { { id: 'companyName' } }
    text_field(:address, tag: :text_field, required: true) { { id: 'street' } }
    text_field(:city, tag: :text_field, required: true) { { id: 'city' } }
    page_object(:state) {{xpath: '//button[contains(@class, "dropdown-toggle")][@data-id="state"]'}}
    text_field(:zip, tag: :text_field) { { id: 'zip' } }
    text_field(:phone, tag: :text_field, required: true) { { id: 'phone' } }
    text_field(:cc_holder_name, tag: :text_field, required: true) { { id: 'ccName' } }
    text_field(:cc_number, tag: :text_field, required: true) { { id: 'ccNumber' } }
    page_object(:cc_month) {{xpath: '//button[contains(@class, "dropdown-toggle")][@data-id="ccMonth"]'}}
    page_object(:cc_year) {{xpath: '//button[contains(@class, "dropdown-toggle")][@data-id="ccYear"]'}}
    page_object(:use_mailing_address_for_billing) {{id: 'useMailingAddressForBilling'}}
    page_object(:terms_conditions) {{id: 'termsConditions'}}
    button(:back) {{id: 'prev'}}
    button(:submit) {{id: 'next'}}

    #username taken
    page_object(:username_taken_header) { {xpath: '//h3[(contains(text(), "Username Taken"))]'} }
    page_objects(:username_taken_p1, index: 0) { {id: 'prev-username'} }
    page_objects(:username_taken_p2, index: 1) { {id: 'prev-username'} }
    text_field(:new_username, tag: :text_field, required: true) { { id: 'newUsername' } }
    button(:username_taken_continue_btn) {{id: 'btnUserNameTakenContinue'}}
    button(:username_taken_close_btn) {{class: ['close']}}

    #address standardized
    page_object(:addr_std_header) { {xpath: '//h3[(contains(text(), "Your address has been standardized"))]'} }
    page_object(:addr_std_p) { {id: 'instructions'} }
    page_object(:addr_std_addr_orig_lbl) { {xpah: '//div[@id="addrOrig"]/p[1]'} }
    page_object(:addr_std_addr_orig) { {xpah: '//div[@id="addrOrig"]/p[2]'} }
    page_object(:addr_std_addr_new_lbl) { {xpah: '//div[@id="addrNew"]/p[1]'} }
    page_object(:addr_std_addr_new) { {xpah: '//div[@id="addrNew"]/p[2]'} }
    button(:addr_std_continue) {{id: 'btnAddrValOkay'}}
    button(:addr_std_cancel) {{xpath: '//div[@class="modal-footer"]/button[1]'}}
    page_objects(:addr_std_close, index: 1) {{xpath: '//button[@class="close"]'}}


    #postage meter address
    page_object(:meter_header) { {xpath: '//h1[(contains(text(), "An additional postage meter address is required"))]'} }
    page_object(:meter_p) { {xpath: '//div[@class="col-xs-12"]/p'} }
    text_field(:meter_street, tag: :text_field, required: true) { { id: 'meterStreet' } }
    text_field(:meter_city, tag: :text_field, required: true) { { id: 'meterCity' } }
    page_object(:meter_state) {{xpath: '//button[contains(@class, "dropdown-toggle")][@data-id="meterState"]'}}
    text_field(:meter_zip, tag: :text_field, required: true) { { id: 'meterZip' } }


    def dropdown_selection(str, name = :dropdown_element)
      page_object(name) { {xpath: "//span[text()='#{str}']"} }
    end

  end

  class ChooseSupplies < SdcPage
    page_object(:cs_header) { {xpath: '//h1[(contains(text(), "Customize your Welcome Kit"))]'} }
    page_object(:place_order) { {id: 'mincartButtonTopDpawr'}}

   def atg_promotion
      SdcPage.browser.execute_script('return WR.model.session.atgPromotion')
   end

  end

  class << self

    def profile_page
      ProfilePage.new
    end

    def membership_page
      MembershipPage.new
    end

    def choose_supplies
      ChooseSupplies.new
    end

    def common_page
      Common.new
    end

    def sdcw_website
      SDCWWebsite.new
    end

    def ew_website
      EWWebsite.new
    end

    def sdc_db_connection
      SdcWebsiteDB.new
    end

    def bridge_db_connection
      VBridgeDB.new
    end

  end

end