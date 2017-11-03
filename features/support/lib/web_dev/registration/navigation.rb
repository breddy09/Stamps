module Stamps
  module Registration
    module Navigation
      class RegistrationNavigationBar < Browser::StampsModal
        attr_reader :stamps_logo, :usps_logo

        def initialize(param)
          super
          @stamps_logo=StampsField.new(browser.img(id: "sdc-logo"))
          @usps_logo=StampsField.new(browser.img(css: "img[src*=logo_usps_vendor_]"))
        end

        def present?
          stamps_logo.present?
        end

        def wait_until_present(*args)
          stamps_logo.wait_until_present(*args)
        end
      end

    end
  end
end
