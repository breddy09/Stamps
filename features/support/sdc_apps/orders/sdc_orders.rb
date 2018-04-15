module Stamps
  module Orders
    module SdcOrdersInstHelper

    end

    class SdcOrders < SdcPage
      element(:loading_orders) { SdcElement.new(browser.element(text: 'Loading orders...')) }
      element(:grid_body, required: true) { SdcElement.new(browser.element(xpath: "//*[contains(@class, 'orders-grid')]")) }

      def order_details
        @order_details = nil
      end

      def bulk_update
        @bulk_update = nil
      end

      def toolbar

      end

      def grid

      end

      def left_filter_panel

      end

      def paging_toolbar

      end
    end
  end
end

