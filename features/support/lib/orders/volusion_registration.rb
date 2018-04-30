module Stamps
  module Orders
    module Stores

      class VolusionShippingAddress < WebApps::Base
        class VolusionCountry < WebApps::Base
          def select(country)
            begin
              driver.select_list(:id, "ShipCountry").option(text: country).when_present.select
              driver.select_list(:id, "ShipCountry").option(text: country).when_present.select
            rescue
              # ignore
            end
          end
        end

        class VolusionState < WebApps::Base
          def select state
            begin
              driver.select_list(:id, "ShipState_dropdown").option(text: state).when_present.select
              driver.select_list(:id, "ShipState_dropdown").option(text: state).when_present.select
            rescue
              # ignore
            end
          end
        end

        class VolusionTypeOfAddress < WebApps::Base
          def residential
            driver.radio(css: 'input[name=ShipResidential][value=Y]').set
            driver.radio(css: 'input[name=ShipResidential][value=Y]').set
          end

          def business
            driver.radio(css: 'input[name=ShipResidential][value=N]').set
            driver.radio(css: 'input[name=ShipResidential][value=N]').set
          end
        end

        class VolusionBillingAddress < WebApps::Base
          def yes
            driver.radio(css: 'input[name=alsobilling][value=Y]').set
            driver.radio(css: 'input[name=alsobilling][value=Y]').set
          end

          def no
            driver.radio(css: 'input[name=alsobilling][value=N]').set
            driver.radio(css: 'input[name=alsobilling][value=N]').set
          end
        end

        def present?
          driver.text_field(name: "ShipFirstName").present?
        end

        def first_name
          StampsTextbox.new driver.text_field(name: "ShipFirstName")
        end

        def last_name
          StampsTextbox.new driver.text_field(name: "ShipLastName")
        end

        def company
          StampsTextbox.new driver.text_field(name: "ShipCompanyName")
        end

        def address_1
          StampsTextbox.new driver.text_field(name: "ShipAddress1")
        end

        def address_2
          StampsTextbox.new driver.text_field(name: "ShipAddress2")
        end

        def city
          StampsTextbox.new driver.text_field(name: "ShipCity")
        end

        def country
          VolusionCountry.new(param)
        end

        def state
          VolusionState.new(param)
        end

        def zip_code
          StampsTextbox.new driver.text_field(name: "ShipPostalCode")
        end

        def phone_number
          StampsTextbox.new driver.text_field(name: "ShipPhoneNumber")
        end

        def type_of_address
          VolusionTypeOfAddress.new(param)
        end

        def is_this_your_billing_address
          VolusionBillingAddress.new(param)
        end

        def continue
          button = StampsField.new driver.text_field(name: "btnContinue")
          account_page = MyAccountPage.new(param)
          10.times do
            button.click
            sleep(0.35)
            return account_page if account_page.present?
          end
        end
      end

      class VolusionCheckOut < WebApps::Base
        class VolusionAddressType < WebApps::Base
          def residential
            driver.radio(css: 'input[name=ShipResidential][value=Y]').set
            driver.radio(css: 'input[name=ShipResidential][value=Y]').set
          end

          def business
            driver.radio(css: 'input[name=ShipResidential][value=N]').set
            driver.radio(css: 'input[name=ShipResidential][value=N]').set
          end
        end

        def present?
          driver.h2(text: "Checkout").present?
        end

        def my_saved_billing_address address
          driver.select_list(:name, "My_Saved_Billing").option(text: address).select
          driver.select_list(:name, "My_Saved_Billing").option(text: address).select
          driver.select_list(:name, "My_Saved_Billing").option(text: address).select
        end


        def address_type
          VolusionAddressType.new(param)
        end

        def shipping_method method
          driver.select_list(:name, "ShippingSpeedChoice").option(value: @shipping_method_map[method]).select
          driver.select_list(:name, "ShippingSpeedChoice").option(value: @shipping_method_map[method]).select
          driver.select_list(:name, "ShippingSpeedChoice").option(value: @shipping_method_map[method]).select
        end

        def payment_method method
          driver.select_list(:name, "PaymentMethodTypeDisplay").option(text: method).select
          driver.select_list(:name, "PaymentMethodTypeDisplay").option(text: method).select
          driver.select_list(:name, "PaymentMethodTypeDisplay").option(text: method).select
        end

        def place_order
          button = StampsField.new driver.button(id: "btnSubmitOrder")
          order_num_field = StampsField.new driver.div(css: "main#content_area>table>tbody>tr>td>div")
          10.times do
            button.click
            sleep(2)
            if order_num_field.present?
              order_number_str = order_num_field.text
              log.info order_number_str
              order_number = /(\d+)/.match(order_number_str)
              log.info "ORDER NUMBER:  #{order_number}"
              return order_number
            end
          end
        end
      end

      class VolusionCart < WebApps::Base
        def visit
          driver.goto "http://ywvmt.dmjeb.servertrust.com/shoppingcart.asp"
        end

        def present?
          driver.text_field(css: "input[name='btn_checkout_guest']").present?
        end

        def count
          count = StampsField.new(driver.span(css: "span[data-v-observable=cart-count]")).text
          log.info "Volusion Cart Count: #{count}"
          count.to_i
        end

        def proceed_to_checkout
          button = StampsField.new driver.text_field(css: "input[name='btn_checkout_guest']")
          checkout = VolusionCheckOut.new(param)
          10.times do
            button.click
            sleep(0.35)
            return checkout if checkout.present?
          end
          expect("Unable to proceed to checkout!").to eql ""
        end
      end

      class VolusionProduct < WebApps::Base
        def present?
          driver.text_field(css: "input[alt='Add to cart']").present?
        end

        def qty_field
          StampsTextbox.new driver.text_field(name: 'QTY.SAMPLE1')
        end

        def qty number
          @qty_to_add = number.to_i
          field = qty_field
          field.set @qty_to_add
        end

        def add_to_bag
          qty_textbox = self.qty_field
          shopping_cart = VolusionCart.new(param)
          cart_count_b4_add = shopping_cart.count
          button = StampsField.new driver.text_field(css: "input[alt='Add to cart']")
          2.times do
            button.click
            break if (cart_count_b4_add + @qty_to_add) == shopping_cart.count
            sleep(2)
            break if (cart_count_b4_add + @qty_to_add) == shopping_cart.count
            break if (cart_count_b4_add + @qty_to_add) == shopping_cart.count
          end
        end
      end

      class VolusionCategoryOne < WebApps::Base
        def present?
          driver.a(css: "a[title='SAMPLE PRODUCT ONE, SAMPLE1']").present?
        end

        def sample_product_one
          link = StampsField.new driver.a(css: "a[title='SAMPLE PRODUCT ONE, SAMPLE1']")
          product = VolusionProduct.new(param)
          10.times do
            link.click
            sleep(0.35)
            return product if product.present?
          end
        end
      end

      class MyAccountPage < WebApps::Base
        def log_out
          logged_out_field = StampsField.new driver.li(text: "You are now logged out.")
          button = StampsField.new driver.a(css: "a[href*=logout]")
          5.times do
            button.click
            sleep(0.35)
            return VolusionLoginPage.new(param) if logged_out_field.present?
          end
        end

        def present?
          driver.a(css: "a[href*=logout]").present?
        end

        def my_account
          link = StampsField.new driver.a(text: "My Account")
          label = StampsField.new driver.b(text: "My Orders")
          10.times do
            link.click
            break if label.present?
          end

          def cart
            shopping_cart = VolusionCart.new(param)
            shopping_cart.visit
            shopping_cart
          end
        end

        def category_one
          link = StampsField.new(driver.as(text: "CATEGORY ONE").last)
          category_1 = VolusionCategoryOne.new(param)
          10.times do
            link.click
            sleep(0.35)
            return category_1 if category_1.present?
          end
        end
      end

      class VolusionRegistration < WebApps::Base
        class ReceiveNewsLetterCheckBox < WebApps::Base
          def check
            driver.checkbox(name: 'emailsubscriber').set
            driver.checkbox(name: 'emailsubscriber').set
          end

          def uncheck
            driver.checkbox(name: 'emailsubscriber').clear
            driver.checkbox(name: 'emailsubscriber').clear
          end
        end

        def present?
          driver.text_field(name: "Email").present?
        end

        def email
          StampsTextbox.new driver.text_field(name: "Email")
        end

        def email_again
          StampsTextbox.new driver.text_field(name: "Emailagain")
        end

        def password
          StampsTextbox.new driver.text_field(name: "password")
        end

        def password_again
          StampsTextbox.new driver.text_field(name: "passwordagain")
        end

        def receive_newsletter
          ReceiveNewsLetterCheckBox.new(param)
        end

        def continue
          button = StampsField.new driver.text_field(id: "btnContinue")
          shipping_address = VolusionShippingAddress.new(param)
          10.times do
            button.click
            sleep(0.35)
            return shipping_address if shipping_address.present?
          end
        end
      end

      class VolusionLoginPage < WebApps::Base
        def visit
          driver.goto "http://ywvmt.dmjeb.servertrust.com/myaccount.asp"
        end

        def present?
          driver.text_field(name: "email").present?
        end

        def email
          StampsTextbox.new driver.text_field(name: "email")
        end

        def password
          StampsTextbox.new driver.text_field(name: "password")
        end

        def login
          StampsField.new driver.text_field(css: "input[src*=btn_login]")
        end

        def continue
          button = StampsField.new driver.img(css: "img[src*=Continue]")
          registration = VolusionRegistration.new(param)
          10.times do
            button.click
            sleep(0.35)
            return registration if registration.present?
          end
        end
      end
    end
  end
end