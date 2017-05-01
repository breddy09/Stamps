module Stamps
  module Pam

    class CustomerProfileNotFound < Browser::StampsModal
      def present?
        browser.text.include? 'No records found'
      end

      def text
        browser.text
      end
    end

    class MeterInfoNotAvailableForAccount < Browser::StampsModal
      def present?
        browser.text.include? 'Meter info not available'
      end

      def text
        browser.text
      end
    end

    class CustomerSearch < Browser::StampsModal
      def present?
        browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>p>input[name=Input]").present?
      end

      def wait_until_present
        (StampsElement.new browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>p>input[name=Input]")).wait_until_present 7
      end

      def username
        StampsTextBox.new browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>input[name=uname]")
      end

      def first_name
        StampsTextBox.new browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>input[name=fname]")
      end

      def last_name
        StampsTextBox.new browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>input[name=fname]")
      end

      def phone
        StampsTextBox.new browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>input[name=phone]")
      end

      def email
        StampsTextBox.new browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>input[name=email]")
      end

      def user_5_2_or_lower
        browser.radio(css: "input[name=v6usr][value='0']").set
        browser.radio(css: "input[name=v6usr][value='0']").set
        browser.radio(css: "input[name=v6usr][value='0']").set
      end

      def search
        button = Stamps::Browser::StampsElement.new browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>p>input[name=Input]")
        customer_profile = CustomerProfile.new(modal_param)
        customer_profile_not__found = CustomerProfileNotFound.new(modal_param)
        meter_info_unavailable = MeterInfoNotAvailableForAccount.new(modal_param)
        count = 20
        count.times do |counter|
          button.send_keys(:enter)
          button.click
          sleep(0.35)
          return customer_profile if customer_profile.present?
          if customer_profile_not__found.present?
            logger.info "PAM:  #{customer_profile_not__found.text}"
            browser.back if counter < count-1
          end
        end
        return customer_profile if customer_profile.present?
        return customer_profile_not__found if customer_profile_not__found.present?
        meter_info_unavailable if meter_info_unavailable.present?
        customer_profile_not__found.text.should_not include "No records found" if customer_profile_not__found.present?
      end
    end
  end
end