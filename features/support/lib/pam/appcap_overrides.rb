module Stamps
  module Pam

    class AppCapOverridesConfirmation < Browser::Base
      def title
        StampsField.new browser.td(text: 'AppCap Overrides')
      end

      def ok_button
        StampsField.new browser.a(css: 'a[href*=Profile]')
      end

      def text
        StampsField.new(browser.td(css: "tbody:nth-child(1)>tr:nth-child(2)>td:nth-child(2)")).text
      end

      def present?
        title.present?
      end

      def ok
        ok_button.click
        ok_button.click_while_present
        text
      end
    end

    class AppCapCertifiedMail < Browser::Base
      def always_on
        browser.radio(css: 'input[name=CertMail][value=On]').set
      end

      def always_off
        browser.radio(css: 'input[name=CertMail][value=off]').set
      end

      def no_override
        browser.radio(css: 'input[name=CertMail][value=None]').set
      end
    end

    class AppCapInternetPostagePrinting < Browser::Base
      def always_on
        browser.radio(css: 'input[name=IBIP][value=On]').set
      end

      def always_off
        browser.radio(css: 'input[name=IBIP][value=off]').set
      end

      def no_override
        browser.radio(css: 'input[name=IBIP][value=None]').set
      end
    end

    class AppCapNetStampsPrinting < Browser::Base
      def always_on
        browser.radio(css: 'input[name=NS][value=On]').set
      end

      def always_off
        browser.radio(css: 'input[name=NS][value=off]').set
      end

      def no_override
        browser.radio(css: 'input[name=NS][value=None]').set
      end
    end

    class AppCapShippingLabelPrinting < Browser::Base
      def always_on
        browser.radio(css: 'input[name=SL][value=On]').set
      end

      def always_off
        browser.radio(css: 'input[name=SL][value=off]').set
      end

      def no_override
        browser.radio(css: 'input[name=SL][value=None]').set
      end
    end

    class AppCapInternationalShipping < Browser::Base
      def always_on
        browser.radio(css: 'input[name=IntlShipping][value=On]').set
      end

      def always_off
        browser.radio(css: 'input[name=IntlShipping][value=off]').set
      end

      def no_override
        browser.radio(css: 'input[name=IntlShipping][value=None]').set
      end
    end

    class AppCapAllowHighRiskCountries < Browser::Base
      def always_on
        browser.radio(css: 'input[name=AllowHighRiskCountries][value=On]').set
      end

      def always_off
        browser.radio(css: 'input[name=AllowHighRiskCountries][value=off]').set
      end

      def no_override
        browser.radio(css: 'input[name=AllowHighRiskCountries][value=None]').set
      end
    end

    class AppCapMailingLabelPrinting < Browser::Base
      def always_on
        browser.radio(css: 'input[name=CreateMailingLabelIndicia][value=On]').set
      end

      def always_off
        browser.radio(css: 'input[name=CreateMailingLabelIndicia][value=off]').set
      end

      def no_override
        browser.radio(css: 'input[name=CreateMailingLabelIndicia][value=None]').set
      end
    end

    class AppCapOverridesPage < Browser::Base
      def username
        StampsField.new(browser.a(css: "tbody>tr:nth-child(2)>td:nth-child(2)>a"))
      end

      def internet_postage_printing
        AppCapInternetPostagePrinting.new(param)
      end

      def netstamps_printing
        AppCapNetStampsPrinting.new(param)
      end

      def shipping_label_printing
        AppCapShippingLabelPrinting.new(param)
      end

      def international_shipping
        AppCapInternationalShipping.new(param)
      end

      def allow_high_risk_countries
        AppCapAllowHighRiskCountries.new(param)
      end

      def mailing_label_printing
        AppCapMailingLabelPrinting.new(param)
      end

      def certified_mail
        AppCapCertifiedMail.new(param)
      end

      def appcap_overrides
        AppCapOverridesConfirmation.new(param)
      end

      def submit_button
        StampsField.new browser.input(name: 'submit')
      end

      def present?
        submit_button.present?
      end

      def submit
        5.times do
          submit_button.click
          if appcap_overrides.present?
            log.message appcap_overrides.text
            log.message appcap_overrides.text
            log.message appcap_overrides.text
            log.message appcap_overrides.text
            log.message appcap_overrides.text
            return appcap_overrides
          end
        end
      end
    end
  end
end