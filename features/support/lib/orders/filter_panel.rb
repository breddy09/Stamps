module Stamps
  module Orders
    module LeftPanel
      class CollapseButton < Browser::StampsBase
        attr_reader :button, :tooltip_field

        def initialize(param)
          super
          @button=StampsField.new(browser.span css: "span[id^=button-][id$=-btnIconEl]")
          @tooltip_field=StampsField.new(browser.div id: 'ext-quicktips-tip-innerCt')
        end

        def click
          10.times do
            begin
              button.click
              sleep(0.35)
              break unless button.present?
            rescue
              #ignore
            end
          end
        end

        def tooltip
          button.field.hover
          button.field.hover
          15.times do
            button.field.hover
            sleep(0.35)
            if tooltip_field.present?
              logger.info tooltip_field.text
              return tooltip_field.text
            end
          end
        end
      end

      class ExpandButton < Browser::StampsBase
        attr_reader :button, :tooltip_field

        def initialize(param)
          super
          @button=StampsField.new(browser.img css: 'img[class*=tool-expand-right]')
          @tooltip_field=StampsField.new(browser.div id: 'ext-quicktips-tip-innerCt')
        end

        def click
          10.times do
            begin
              button.click
              sleep(0.35)
              break unless button.present?
            rescue
              #ignore
            end
          end
        end

        def tooltip
          button.field.hover
          button.field.hover
          15.times do
            button.field.hover
            sleep(0.35)
            if tooltip_field.present?
              logger.info tooltip_field.text
              return tooltip_field.text
            end
          end
        end
      end

      class FilterMenuItem < Browser::StampsBase
        attr_reader :collapse, :expand

        def initialize(param)
          super
          @collapse=CollapseButton.new(param)
          @expand=ExpandButton.new(param)
        end
      end

      class SearchResults < Browser::StampsBase
        attr_reader :label, :remove_button, :count_label

        def initialize(param)
          super
          @label=StampsField.new browser.div(text: "Search Results")
          @remove_button=StampsField.new browser.a(css: "a[data-qtip=Remove]")
          @count_label=StampsField.new browser.div(css: "div[id=left-filter-panel-targetEl]>table>tbody>tr>td:nth-child(3)>div>div")
        end

        def present?
          label.present?
        end

        def wait_while_present(*args)
          remove_button.wait_while_present(*args)
        end

        def remove
          remove_button.click_while_present
        end

        def count
          count_label.text.to_i
        end
      end

      class SearchOrders < Browser::StampsBase
        attr_reader :textbox, :search_button, :search_results

        def initialize(param)
          super
          @textbox=StampsTextbox.new browser.text_field(css: "[placeholder='Search Orders']")
          @search_button=StampsField.new browser.div(css: "[id^=textfield-][id$=-trigger-search]")
          @search_results=SearchResults.new(param)
        end

        def present?
          search_button.present?
        end
      end

      module FilterTabHelper
        attr_accessor :field, :panel_name
        def selected?
          begin
            field.parent.parent.parent.parent.attribute_value("class").include?('selected')
          rescue
            false
          end
        end

        def field
          browser.divs(text: panel_name).first
        end

        def text
          StampsField.new(field).text
        end

        def select
          tab=StampsField.new(field)
          40.times do
            tab.double_click
            tab.click
            sleep(0.25)
            break if selected?
          end
          expect(selected?).to be(true), "Unable to select Filter Panel: #{panel_name}"
          logger.info "Selected Filter Panel: #{panel_name}"
        end
      end

      class AwaitingShipmentTab < Browser::StampsBase
        include FilterTabHelper
        def initialize(param)
          super
          @panel_name="Awaiting Shipment"
        end

        def count
          StampsField.new(browser.div(css: "div#left-filter-panel-targetEl>table[style*=left]>tbody>tr>td>div[class*=widget]>div[class=sdc-badge]")).text.to_i
        end
      end

      class ShippedTab < Browser::StampsBase
        include FilterTabHelper
        def initialize(param)
          super
          @panel_name="Shipped"
        end
      end

      class CanceledTab < Browser::StampsBase
        include FilterTabHelper
        def initialize(param)
          super
          @panel_name="Canceled"
        end
      end

      class OnHoldTab < Browser::StampsBase
        include FilterTabHelper
        def initialize(param)
          super
          @panel_name="On Hold"
        end
      end

      class FilterPanel < Browser::StampsBase
        attr_reader :search_orders, :search_results, :awaiting_shipment, :shipped, :canceled, :on_hold, :menu_item

        def initialize(param)
          super
          @awaiting_shipment=AwaitingShipmentTab.new(param)
          @shipped=ShippedTab.new(param)
          @canceled=CanceledTab.new(param)
          @on_hold=OnHoldTab.new(param)
          @search_orders=SearchOrders.new(param)
          @menu_item=FilterMenuItem.new(param)
          @search_results=SearchResults.new(param)
        end

        def selected_filter
          20.times do
            sleep(0.05)
            return awaiting_shipment.text if awaiting_shipment.selected?
            sleep(0.05)
            return shipped.text if shipped.selected?
            sleep(0.05)
            return canceled.text if canceled.selected?
            sleep(0.05)
            return on_hold.text if on_hold.selected?
          end
          expect("At least one filter should have been selected.").to eql "Unable to return selected_filter text."
        end

        def collapse_panel

        end

        def expand_panel

        end
      end
    end
  end
end