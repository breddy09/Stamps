module Stamps
  module Pam
    class PamHeader < WebApps::Base
      def search_link
        StampsField.new(browser.a(css: 'a[href*=AccountSearch]'))
      end

      def customer_profile_link
        StampsField.new(browser.a(css: 'a[href*=Profile]'))
      end

      def change_meter_limit_link
        StampsField.new(browser.a(css: 'a[href*=MeterLimit]'))
      end

      def appcapp_overrides_link
        StampsField.new(browser.a(css: 'a[href*=AppCapOverride]'))
      end
    end

    class PaymentAdministratorManager < WebApps::Base
      def page_title
        StampsField.new(browser.h5(text: "Customer Search"))
      end

      def visit
        url = case param.test_env.downcase
                when /cc/
                  "http://#{data_for(:pam, {})['admin_username']}:#{data_for(:pam, {})['admin_password']}@qa-clientsite:82/pam/Default.asp"
                when /sc/
                  "http://#{data_for(:pam, {})['admin_username']}:#{data_for(:pam, {})['admin_password']}@site.qasc.stamps.com:82/pam/Default.asp"
                when /stg/
                  "https://#{data_for(:pam, {})['admin_username']}:#{data_for(:pam, {})['admin_password']}@site.staging.stamps.com:82/pam/Default.asp"
                else
                  raise ArgumentError, "#{param.test_env} environment is not implemented."
              end
        log.info "Visit: #{url}"
        sleep(1)
        browser.goto(url)
        sleep(1)
        self
      end

      def present?
        page_title.present?
      end

      def wait_until_present(*args)
        page_title.wait_until_present(*args)
      end

      def pam_header
        @pam_header = PamHeader.new(param)
      end

      def customer_search_page
        CustomerSearchPage.new(param)
      end

      def appcap_overrides_page
        AppCapOverridesPage.new(param)
      end

      def customer_profile_page
        CustomerProfilePage.new(param)
      end

      def customer_not_found_page
        CustomerNotFoundPage.new(param)
      end

      def meter_info_not_available
        MeterInfoNotAvailable.new(param)
      end
    end
  end
end