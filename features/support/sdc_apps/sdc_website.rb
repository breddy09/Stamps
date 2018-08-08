module SdcWebsite
  class SdcHealthCheck < SdcPage
    page_url { |env, app| "https://#{env}.stamps.com/#{app.to_s}/healthcheck.aspx" }
  end

  def landing_page
    SdcOrdersLandingPage.new
  end
  module_function :landing_page

  def orders
    SdcOrders
  end
  module_function :orders

  def mail
    SdcMail
  end
  module_function :mail

  def contacts
    SdcContacts
  end
  module_function :contacts

  def navigation
    SdcNavigation
  end
  module_function :navigation

  def customs_form
    SdcCustomsForm.new
  end
  module_function :customs_form

  def restrictions
    SdcRestrictions.new
  end
  module_function :restrictions

  def modals
    SdcModals
  end
  module_function :modals

end
