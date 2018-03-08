
module Stamps
  module Orders
    class SquareLogin < WebApps::Base


      def email
        (cache[:email].nil?||!cache[:email].present?)?cache[:email] = StampsTextbox.new(driver.text_field(css: "input[id='email']")) :cache[:email]
      end

      def password
        (cache[:password].nil?||!cache[:password].present?)?cache[:password] = StampsTextbox.new(driver.text_field(css: "input[id='password']")):cache[:password]
      end

      def sign_in
        (cache[:sign_in].nil?||!cache[:sign_in].present?)?cache[:sign_in] = StampsField.new(driver.button(css: '[id=sign-in-button]')):cache[:sign_in]
      end
    end
  end
end
