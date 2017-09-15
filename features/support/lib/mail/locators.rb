module Stamps
  module Mail
    module Locators
      class SignIn
        def self.username
          {id: "UserNameTextBox"}
        end

        def self.password
          {id: "PasswordTextBox"}
        end

        def self.collapse_button
          {id: "signInButton"}
        end
      end

      class FormBody
        def self.print_on_dropdown_divs
          {css: "div[class*=x-form-trigger]"}
        end

        def self.print_on_text_field
          {name: "media"}
        end
        def weight_input

        end

        def ounces_input

        end
      end
    end
  end
end