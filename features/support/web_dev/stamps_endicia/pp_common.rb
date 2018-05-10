  module PartnerPortal
    class Common < SdcPage
      #Global header
      page_object(:global_header) { {xpath: '//a[@class="header ng-star-inserted"]'} }

      #stamps endicia logo
      page_objects(:sdc_endicia_logo_mobile, index: 0)  { {xpath: '//img[@alt="Stamps.com Endicia | Partner Portal logo"]'} }
      page_objects(:sdc_endicia_logo_browser, index: 1)  { {xpath: '//img[@alt="Stamps.com Endicia | Partner Portal logo"]'} }

      #Partner Portal logo
      page_object(:partner_portal_logo)  { {xpath:  '//h3[contains(text(), "Partner Portal")]'} }

      #Panel Dashboard
      page_object(:panel_dashboard) { {xpath: '//a[contains(text(), "Dashboard")]'} }

      #xs viewport
        #hamburger button
        page_object(:hamburger_button_xs)  { {class:  'hamburger hamburger-slider visible-xs'} }

        #x button
        page_object(:x_button)  { {class:  'hamburger hamburger-slider is-active visible-xs'} }

        #Left Panel
        page_object(:panel_collapsed_xs)  { {class:  'sidebar'} }
        page_object(:panel_expanded_xs)  { {class:  'sidebar sidebar_expanded-xs'} }

      #Normal viewport left panel
        page_object(:panel_hamburger) { {class: 'hamburger hamburger-slider hamburger-arrow hamburger-sidebar'} }
        page_object(:panel_arrow) { {class: 'hamburger hamburger-slider is-active hamburger-arrow hamburger-sidebar'} }

        page_object(:panel_collapsed_lg)  { {class:  'sidebar sidebar_collapsed'} }
        page_object(:panel_expanded_lg)  { {class:  'sidebar'} }

    end

  end