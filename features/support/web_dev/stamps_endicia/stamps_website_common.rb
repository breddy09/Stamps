module StampsWebsite
  class Common < SdcPage
    #stamps website
    page_object(:stamps_store_logo) {{id: 'stamps-logo'}}
    page_object(:stamps_logo) {{id: 'sdc-logo'}}
    button(:get_started) { { class: ['btn btn-success btn-xs register'] } }
    button(:log_in) { { class: ['btn btn-info btn-xs login'] } }
    page_object(:learn_more) { {class: ['dropdown-toggle']} }
    page_objects(:small_office_mailers, index: 0) { {xpath: '//a[contains(text(),"Small Office Mailers")]' } }
    page_objects(:online_sellers, index: 0) { {xpath: '//a[contains(text(),"Online Sellers")]' } }
    page_objects(:warehouse_shippers, index: 0) { {xpath: '//a[contains(text(),"Warehouse Shippers")]' } }
    page_objects(:corporate_postage_solutions, index: 0) { {xpath: '//a[contains(text(),"Corporate Postage Solutions")]' } }
    page_objects(:faq, index: 0) { {xpath: '//a[contains(text(),"FAQ")]'} }

    #mobile
    button(:get_started_xs) {{class: ['btn btn-success btn-xs register visible-xs-block']}}
    button(:menu_xs) {{id: 'menu-top'}}
    link(:menu_get_started_xs) {{class: ['list-group-item list-group-item-success register']}}
    link(:menu_learn_more_xs) {{xpath: '//a[@href="#learn-more-menu"]'}}
    page_objects(:small_office_mailers_xs, index: 1) { {xpath: '//a[contains(text(),"Small Office Mailers")]' } }
    page_objects(:online_sellers_xs, index: 1) { {xpath: '//a[contains(text(),"Online Sellers")]' } }
    page_objects(:warehouse_shippers_xs, index: 1) { {xpath: '//a[contains(text(),"Warehouse Shippers")]' } }
    page_objects(:corporate_postage_solutions_xs, index: 1) { {xpath: '//a[contains(text(),"Corporate Postage Solutions")]' } }
    page_objects(:faq_header_xs, index: 1) { {xpath: '//a[contains(text(),"FAQ")]'} }
    page_objects(:customer_support_header_xs, index: 0) { {xpath: '//a[contains(text(),"Customer Support")]'} }
    page_object(:customer_log_in_xs) { {xpath: '//a[contains(text(),"Customer Log-in")]'} }
    page_object(:call_us_xs) { {xpath: '//a[contains(text(),"Call Us 1-888-434-0055")]'} }

    def dropdown(str, name = :element)
      page_object(name) { {xpath: "//span[contains(text(), \" #{str} \")]" } }
    end

    #footer
    page_objects(:usps_logo,  index: 1) {{xpath: '//figure[@id="usps-logo-words"]/img'}}
    page_objects(:usps_logo_caption,  index: 1) {{xpath: '//figure[@id="usps-logo-words"]/figcaption'}}
    page_object(:copyright) { {xpath: '//p[@class="copyright hidden-xs"]/a'} }
    ## products ##
    page_object(:footer_products_xs) { {xpath: '//a[@href="#products-menu"]'} }
    page_objects(:footer_office_mailers) {{xpath: '//a[contains(text(), "Small Office Mailers")]'}}
    page_objects(:footer_online_sellers) {{xpath: '//a[contains(text(), "Online Sellers")]'}}
    page_objects(:footer_warehouse_shippers) {{xpath: '//a[contains(text(), "Warehouse Shippers")]'}}
    page_objects(:footer_corporate_postage_solutions) {{xpath: '//a[contains(text(), "Corporate Postage Solutions")]'}}
    page_objects(:footer_photo_stamps) {{xpath: '//a[contains(text(), "PhotoStamps")]'}}
    page_objects(:footer_supplies) {{xpath:  '//a[contains(text(), "Supplies")]'}}
    ## supports ##
    page_object(:footer_support_xs) { {xpath: '//a[@href="#support-menu"]'} }
    page_objects(:download_software) {{xpath: '//a[contains(text(), "Download Software")]'}}
    page_objects(:customer_support) {{xpath: '//a[contains(text(), "Customer Support")]'}}
    page_objects(:how_to_videos) {{xpath:  '//a[contains(text(), "How To Videos")]'}}
    page_objects(:faq) {{xpath: '//a[contains(text(), "FAQ")]'}}
    page_objects(:system_status) {{xpath: '//a[contains(text(), "System Status")]'}}
    ## company stuff ##
    page_object(:footer_company_stuff_xs) { {xpath: '//a[@href="#company-menu"]'} }
    page_objects(:about_us) {{xpath: '//a[contains(text(), "About Us")]'}}
    page_objects(:shipping_partners) {{xpath: '//a[contains(text(), "Shipping Partners")]'}}
    page_objects(:privacy_policy) { {xpath: '//a[contains(text(), "Privacy Policy")]'} }
    page_objects(:investor_info) {{xpath: '//a[contains(text(), "Investor Info")]'}}
    page_objects(:careers) {{xpath: '//a[contains(text(), "Careers")]'}}
    page_objects(:affiliates) {{xpath: '//a[contains(text(), "Affiliates")]'}}
    page_objects(:site_map) {{xpath: '//a[contains(text(), "Site Map")]'}}
    page_objects(:contact_us) {{xpath: '//a[contains(text(), "Contact Us")]'}}
    ## developers ##
    page_object(:developers_xs) { {xpath: '//a[@href="#developers-menu"]'} }
    page_objects(:developer_overview) {{xpath: '//a[contains(text(), "Developer Overview")]'}}
    page_objects(:developer_reg) {{xpath: '//a[contains(text(), "Developer Registration")]'}}
    page_objects(:developer_ref_guide) {{xpath: '//a[contains(text(), "Developer Reference Guide")]'}}
    page_objects(:developer_products) {{xpath: '//a[contains(text(), "Developer Products")]'}}
    ## follow us ##
    page_object(:follow_us_xs) { {xpath: '//a[@href="#followus-menu""]'} }
    page_objects(:facebook) {{xpath: '//a[contains(text(), "Facebook")]'}}
    page_objects(:twitter) {{xpath: '//ul/li/a[contains(@href , "twitter.com")]'}}
    page_objects(:google_plus) {{xpath: '//ul/li/a[contains(@href , "plus.google.com")]'}}
    page_objects(:youtube) {{xpath: '//ul/li/a[contains(text() , "YouTube")]'}}
    page_objects(:linkedin) {{xpath: '//ul/li/a[contains(@href , "linkedin")]'}}
    page_objects(:blog) {{xpath: '//ul/li/a[contains(@href , "blog")]'}}


    ############## mobile footer #############
    ## company stuff ##
    page_object(:footer_company_stuff_menu_xs) {{xpath: '//div[@class="collapse list-group panel visible-xs"]/a[contains(@href , "#company-menu")]'}}
    page_objects(:about_us_xs,  index: 0) {{xpath: '//div[@id="company-menu"]/a[contains(@href , "company-info")]'}}
    page_object(:shipping_partners_xs) {{xpath: '//div[@id="company-menu"]/a[contains(@href , "integration")]'}}
    page_object(:privacy_policy_xs) {{xpath: '//div[@id="company-menu"]/a[contains(@href , "privacy-policy")]'}}
    page_object(:investor_info_xs) {{xpath: '//div[@id="company-menu"]/a[contains(@href , "investor")]'}}
    page_object(:careers_xs) {{xpath: '//div[@id="company-menu"]/a[contains(@href , "careers")]'}}
    page_object(:affiliates_xs) {{xpath: '//div[@id="company-menu"]/a[contains(@href , "affiliates")]'}}
    page_object(:site_map_xs) {{xpath: '//div[@id="company-menu"]/a[contains(@href , "sitemap")]'}}
    page_object(:contact_us_xs) {{xpath: '//div[@id="company-menu"]/a[contains(@href , "contact-us")]'}}
    ## developers ##
    page_object(:footer_developers_menu_xs) {{xpath: '//div[@class="collapse list-group panel visible-xs"]/a[contains(@href , "#developers-menu")]'}}
    page_objects(:developer_overview_xs, index: 0) {{xpath: '//ul/li/a[contains(@href , "developer")]'}}
    page_object(:developer_reg_xs) {{xpath: '//ul/li/a[contains(@href , "register")]'}}
    page_object(:developer_reff_xs) {{xpath: '//ul/li/a[contains(@href , "docs")]'}}
    page_object(:developer_products_xs) {{xpath: '//ul/li/a[contains(@href , "products")]'}}
    ## follow us ##
    page_object(:footer_follow_us_menu_xs) {{xpath: '//div[@class="collapse list-group panel visible-xs"]/a[contains(@href , "#followus-menu")]'}}
    page_object(:facebook_xs) {{xpath: '//ul/li/a[contains(@href , "facebook.com")]'}}
    page_object(:twitter_xs) {{xpath: '//ul/li/a[contains(@href , "twitter.com")]'}}
    page_object(:google_plus_xs) {{xpath: '//ul/li/a[contains(@href , "plus.google.com")]'}}
    page_object(:youtube_xs) {{xpath: '//ul/li/a[contains(text() , "YouTube")]'}}
    page_object(:linkedin_xs) {{xpath: '//ul/li/a[contains(@href , "linkedin")]'}}
    page_object(:blog_xs) {{xpath: '//ul/li/a[contains(@href , "blog")]'}}

  end

  class SDCWWebsite <SdcPage
    def self.visit
      page_url { |env| "https://#{env}stamps.com/?mboxDisable=1" }
      super(case TestSession.env.url
              when :qacc
                'sdcwebsite.qacc.'
              when :stg
                'sdcwebsite.staging.'
              when :prod
                ''
              else
                # ignore
            end)
    end
  end

end