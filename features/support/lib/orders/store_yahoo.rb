module Orders
  module Stores
    class YahooSettings < StoreSettings
      def window_title
        StampsLabel.new @browser.div text: "Yahoo Settings"
      end

      def present?
        window_title.present?
      end

      def wait_until_present
        window_title.wait_until_present
      end
    end

    class Yahoo < OrdersObject

      def window_title
        StampsLabel.new @browser.div(:text => "Connect your Yahoo Store")
      end

      def present?
        window_title.present?
      end

      def store_id
        StampsTextbox.new @browser.text_field(css: "div[id^=connectyahoowindow-][id$=-body]>div>div>div>div>div[class*=x-box-layout-ct]>div>div>div[id^=textfield]>div[id$=bodyEl]>div>div>input")
      end

      def contact_token
        StampsTextbox.new @browser.text_field(css: "div[id^=connectyahoowindow-][id$=-body]>div>div>div>div>div[class*=x-box-layout-ct]>div>div>div:nth-child(3)>div>div>div>div[id*=body]>div>div>input")
      end

      def first_order_id_to_import
        StampsTextbox.new @browser.text_field(css: "div[id^=connectyahoowindow-][id$=-body]>div>div>div>div>div[class*=x-box-layout-ct]>div>div>div:nth-child(4)>div>div>div>div>div>div>input")
      end

      def test_connection
        button = StampsButton.new @browser.span(text: "Test Connection")
        connected = connect_button
        20.times do
          button.safe_click
          button.safe_click
          sleep 1
          break if connected.present?
        end
      end

      def connect_button
        StampsButton.new @browser.span(text: "Connect")
      end

      def connect
        button = StampsButton.new @browser.span(text: "Connect")
        settings = YahooSettings.new @browser
        server_error = Orders::Stores::ServerError.new @browser

        10.times do
          button.safe_click
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          button.safe_click
          sleep 1
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          sleep 1
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          sleep 1
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          sleep 1
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          sleep 1
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          return settings if settings.present?
        end
        stop_test "Shopify Store Connect failed.  Settings Modal did not open.  "
      end

      def reconnect
        button = StampsButton.new @browser.span(text: "Connect")
        manage_stores = ManageStores.new @browser
        importing_order = Orders::Stores::ImportingOrdersModal.new @browser

        10.times do
          button.safe_click
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          button.safe_click
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          sleep 1
          return manage_stores if manage_stores.present?
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          sleep 1
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          return manage_stores if manage_stores.present?
          sleep 1
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          return manage_stores if manage_stores.present?
          sleep 1
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          return manage_stores if manage_stores.present?
          sleep 1
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          return manage_stores if manage_stores.present?
        end
      end
    end

    class ModifyYahooStore < Shopify

      def window_title
        StampsLabel.new(@browser.div :text => "Modify your Yahoo Store Connection")
      end

      def present?
        window_title.present?
      end

      def wait_until_present
        window_title.wait_until_present
      end
    end

    class YahooPage < OrdersObject
      def present?
        @browser.url.include? "shopify.com"
      end

      def username
        StampsTextbox.new @browser.text_field(id: 'login-input')
      end

      def password
        StampsTextbox.new @browser.text_field(id: 'password')
      end

      def sign_in
        button = StampsButton.new @browser.input(css: "input[value='Log in']")
        settings_page = ShopifySettings.new @browser

        10.times do
          button.safe_click
          sleep 5
          return settings_page if settings_page.present?
        end
      end
    end
  end
end
