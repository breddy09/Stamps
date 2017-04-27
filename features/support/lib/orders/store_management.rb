module Stamps
  module Orders
    module Stores
      class ImportingOrdersModal < Browser::StampsModal
        def present?
          browser.div(text: "Importing Orders").present?
        end

        def message
          StampsElement.new(browser.div(css: "div[id^=messagebox-][id$=-msg]")).text
        end

        def ok
          button = StampsElement.new(browser.span(text: "OK"))
          20.times do
            button.click
            break unless button.present?
          end
        end
      end

      class DeleteStoreModal < Browser::StampsModal
        def present?
          delete_btn.present?
        end

        def wait_until_present
          delete_btn.wait_until_present 7
        end

        def delete_btn
          spans = browser.spans(css: "div[componentid^=dialoguemodal]>div[id^=panel]>div>div>div>a:nth-child(1)>span>span>span[id$=btnInnerEl]")
          first = spans.first
          last = spans.last
          (last.present?)?last:first
        end

        def delete
          button = StampsElement.new delete_btn
          5.times do
            break if button.present?
          end

          5.times do
            button.click
            button.click
            break unless present?
          end
        end

        def cancel
          StampsElement.new(browser.span text: "Cancel")
        end
      end

      class StoreSettings < Browser::StampsModal
        class ServiceMappingGrid < Browser::StampsModal

          class ServiceMappingLineItem < Browser::StampsModal

            class ServiceMappingShippingService < Browser::StampsModal

              def initialize(param, index)
                super(param)
                @index = index
              end

              def drop_down
                StampsElement.new text_box_field.parent.parent.divs[1]
              end

              def text_box_field
                browser.text_fields(name: "servicePackage")[@index]
              end

              def text_box
                StampsTextBox.new text_box_field
              end

              def select service
                logger.info "Select Shipping service #{service}"
                selection = StampsElement.new(browser.trs(css: "tr[data-qtip*='#{service}']")[@index])
                box = text_box
                dd = drop_down

                10.times {
                  begin
                    dd.click unless selection.present?
                    selection.scroll_into_view
                    selection.click
                    logger.info "Selection #{box.text} - #{(box.text.include? service)?"was selected": "not selected"}"
                    break if box.text.include? service
                  rescue
                    #ignore
                  end
                }
                logger.info "#{service} selected."
              end
            end

            def initialize(param, index)
              super(param)
              @index = index
            end

            def present?
              delete.present?
            end

            def requested_services
              text_field = browser.text_fields(name: "ServiceKey")[@index]
              StampsTextBox.new text_field
            end

            def delete
              StampsElement.new(browser.spans(css: "span[class*=sdc-icon-remove]")[@index])
            end

            def shipping_Service
              ServiceMappingShippingService.new(param, @index)
            end
          end

          def add_new_service_mapping_btn
            StampsElement.new browser.span(text: "Add New service Mapping")
          end

          def size
            (browser.divs css: "div[id^=singleservicemappingitem][class*=x-container-default]").size
          end

          def item index
            index = index.to_i
            add_button = add_new_service_mapping_btn
            logger.info "Item Count: #{size}"

            20.times{
              break if size >= index
              sleep(0.35)
              break if size >= index
              add_button.click if index > size
              logger.info "Service Mapping Item Count: #{size}"
            }

            logger.info "User Entered Number: #{index}. Actual Item Count: #{size}"

            ServiceMappingLineItem.new(param, index-1)
          end
        end

        def service_mapping
          ServiceMappingGrid.new(param)
        end

        def save
          button = StampsElement.new(browser.span text: "Save")
          server_error = Orders::Stores::ServerError.new(param)
          importing_order = Orders::Stores::ImportingOrdersModal.new(param)

          15.times do
            button.click
            5.times do
              if importing_order.present?
                logger.info importing_order.message
                importing_order.ok
              end
              if server_error.present?
                error_str = server_error.message
                logger.info error_str
                server_error.ok
                expect("Server Error: \n#{error_str}").to eql ""
              end
              break unless present?
            end
            break unless present?
          end
        end

        def add_new_service_mapping
          browser.span text: "Add New service Mapping"
        end

        def store_nickname
          StampsTextBox.new((browser.text_fields css: "input[name^=textfield-][name$=-inputEl][maxlength='50']").last)
        end

        def automatically_import_new_orders
          label = (browser.label text: "Automatically Import New Orders")
          checkbox_field = label.parent.text_box
          verify_field = label.parent.parent.parent
          StampsCheckBox.new(checkbox_field, verify_field, "class", "checked")
        end
      end

      class MarketPlace < Browser::StampsModal
        attr_reader :window_title

        def initialize(param)
          super
          @window_title = StampsElement.new browser.div text: "Add your Store or Marketplace"
        end

        def present?
          window_title.present?
        end

        def wait_until_present(*args)
          window_title.wait_until_present(*args)
        end

        def contains store_name
          images = browser.imgs(class: "data-view-selection-enabled")
          images.each do |image|
            src = image.attribute_value "src"
            return store_name if src.include? store_name.downcase
          end
          "Store #{store_name} does not exist in store selection modal."
        end

        def close
          (StampsElement.new((browser.imgs css: "img[class*='x-tool-close']").last)).click_while_present
        end

        def search_textbox
          StampsTextBox.new(browser.text_fields css: "input[placeholder='Search by Name']").last
        end

        def search search_str
          search_textbox.set search_str
        end

        def amazon_button
          StampsElement.new(browser.imgs css: "img[src*=amazon]").last
        end

        def amazon
          button = amazon_button
          store = Amazon.new(param)
          10.times do
            button.click
            sleep(2)
            return store if store.present?
          end
        end

        def volusion_button
          StampsElement.new(browser.imgs css: "img[src*=volusion]").last
        end

        def volusion
          button = volusion_button
          store = Volusion.new(param)
          10.times do
            button.click
            sleep(2)
            return store if store.present?
          end
          expect("Volusion Store Modal did not open.").to eql ""
        end

        def rakuten_button
          StampsElement.new(browser.imgs css: "img[src*='rakuten']").last
        end

        def rakuten
          button = rakuten_button
          store = Rakuten.new(param)
          10.times do
            button.click
            sleep(2)
            return store if store.present?
          end
          expect("Rakuten Store Modal did not open.").to eql ""
        end

        def etsy_button
          StampsElement.new(browser.imgs css: "img[src*='etsy']").last
        end

        def etsy
          button = etsy_button
          store = Etsy.new(param)
          10.times do
            button.click
            sleep(0.35)
            return store if store.present?
          end
          expect("Etsy Store Modal did not open.").to eql ""
        end

        def shopify_button
          StampsElement.new(browser.imgs css: "img[src*='shopify']").last
        end

        def shopify
          button = shopify_button
          store = Shopify.new(param)
          10.times do
            button.click
            sleep(0.35)
            return store if store.present?
          end
          expect("Etsy Store Modal did not open.").to eql ""
        end

        def three_d_cart_button
          StampsElement.new(browser.imgs css: "img[src*='3dcart']").last
        end

        def three_d_cart
          button = three_d_cart_button
          store = ThreeDCart.new(param)
          10.times do
            button.click
            sleep(0.35)
            return store if store.present?
          end
          expect("3dcart Store Modal did not open.").to eql ""
        end

        def ebay_button
          StampsElement.new(browser.imgs css: "img[src*='ebay']").last
        end

        def ebay
          button = etsy_button
          store = Ebay.new(param)
          10.times do
            button.click
            sleep(0.35)
            return store if store.present?
          end
          expect("Etsy Store Modal did not open.").to eql ""
        end

        def yahoo_button
          StampsElement.new(browser.imgs css: "img[src*='yahoo']").last
        end

        def yahoo
          button = yahoo_button
          store = Yahoo.new(param)
          10.times do
            button.click
            sleep(0.35)
            return store if store.present?
          end
          expect("Yahoo Store Modal did not open.").to eql ""
        end

        def big_commerce_button
          StampsElement.new(browser.imgs css: "img[src*='bigcommerce']").last
        end

        def big_commerce
          button = big_commerce_button
          store = BigCommerce.new(param)
          10.times do
            button.click
            sleep(0.35)
            return store if store.present?
          end
          expect("Big Commerce Store Modal did not open.").to eql ""
        end

        def paypal_button
          StampsElement.new(browser.imgs css: "img[src*='paypal']").last
        end

        def paypal
          button = paypal_button
          store = PayPal.new(param)
          10.times do
            button.click
            sleep(0.35)
            return store if store.present?
          end
          expect("PayPal Store Modal did not open.").to eql ""
        end

      end

      class ManageStores < Browser::StampsModal
        class ManageStoresGrid < Browser::StampsModal

          def size
            (browser.tables css: "div[id^=grid]>div[class^=x-grid-view]>div[class=x-grid-item-container]>table").size
          end

          def delete
            StampsElement.new(browser.spans(text: "Delete").last)
          end

          def delete_name name
            browser.div text: "My Amazon Store"
          end

          def delete_row row
            css = "div[id^=grid]>div[class^=x-grid-view]>div[class=x-grid-item-container]>table:nth-child(#{row})>tbody>tr>td:nth-child(2)>div"
            grid_row_item = browser.div css: css
            grid_row_focused_field = StampsElement.new grid_row_item.parent
            grid_row_field = StampsElement.new grid_row_item

            del_btn = self.delete
            delete_modal = DeleteStoreModal.new(param)

            10.times do
              #select grid row item
              5.times do
                grid_row_field.click
                break if (grid_row_focused_field.attribute_value "class").include? "focused"
              end
              del_btn.click
              return delete_modal if delete_modal.present?
            end
          end

          def delete_all
            del_btn = delete
            delete_modal = DeleteStoreModal.new(param)
            stores_grid = browser.divs(css: "div[class*='x-grid-item-container']").last
            tables = stores_grid.tables
            grid_size = tables.size
            logger.info "Manage Stores:  Number of items in Grid #{grid_size}"

            if grid_size > 1
              0.upto grid_size do |index|
                row_to_delete = 0
                begin
                  row = StampsElement.new tables[row_to_delete]
                  grid_item_name = StampsElement.new(row).text
                  logger.info "#{index} Delete Item - #{grid_item_name}"

                  if grid_item_name.include? "Manual Orders"
                    logger.info "#{index} Skipping #{grid_item_name}"
                    row = StampsElement.new tables[row_to_delete+1]
                    grid_item_name = StampsElement.new(row).text
                    logger.info "#{index} Delete Item - #{grid_item_name}"
                  end

                  3.times do
                    row.click
                    row.click
                    row.click
                    row.click
                    sleep(0.35)
                    del_btn.click
                    break unless delete_modal.present?
                    break unless delete_modal.present?
                    sleep(0.35)
                    delete_modal.delete
                    break unless delete_modal.present?
                  end
                rescue
                  logger.info "#{index} Skipping..."
                end

                stores_grid = browser.divs(css: "div[class*='x-grid-item-container']").last
                tables = stores_grid.tables
                grid_size = tables.size
                logger.info "Manage Stores: Number of items in Grid is #{grid_size}"
                break if grid_size == 1
              end
            end
          end

          def select store_name
            3.times do
              begin
                checkbox_field = browser.divs(text: store_name).last
                sleep(0.35)
                check_verify_field = checkbox_field.parent
                checkbox = StampsCheckBox.new checkbox_field, check_verify_field, "class", "focused"
                checkbox.check
                checkbox.check
                checkbox.check
                checkbox.check
                break if checkbox.checked?
              rescue
                #ignore
              end
            end
          end
        end

        def stores_grid
          ManageStoresGrid.new(param)
        end

        def close
          button = StampsElement.new browser.img(css: "div[id^=managestoreswindow-][id$=header-targetEl]>div>img")
          5.times do
            button.click
            return unless button.present?
          end
        end

        def window_title
          StampsElement.new(browser.div text: "Manage Stores")
        end

        def present?
          window_title.present?
        end

        def add_button
          StampsElement.new browser.span(css: "div[componentid^=managestoreswindow]>div[id^=toolbar]>div>div>a:nth-child(1)>span>span>span[id$=btnInnerEl]")
        end

        def add
          button = add_button
          store = market_place
          10.times do
            button.click
            sleep(0.35)
            return store if store.present?
          end
        end

        def market_place
          MarketPlace.new(param)
        end

        def edit
          button = StampsElement.new browser.span(css: "div[componentid^=managestoreswindow]>div[id^=toolbar]>div>div>a:nth-child(2)>span>span>span[id$=btnInnerEl]")
          rakuten = RakutenSettings.new(param)
          amazon = AmazonSettings.new(param)
          volusion = VolusionSettings.new(param)
          etsy = EtsySettings.new(param)
          shopify = ShopifySettings.new(param)
          three_d_cart = ThreeDCartSettings.new(param)
          yahoo = YahooSettings.new(param)

          10.times do
            button.click
            sleep(2)
            return rakuten if rakuten.present?
            return amazon if amazon.present?
            return volusion if volusion.present?
            return etsy if etsy.present?
            return shopify if shopify.present?
            return three_d_cart if three_d_cart.present?
            return yahoo if yahoo.present?
          end
        end

        def reconnect
          button = StampsElement.new browser.span(css: "div[componentid^=managestoreswindow]>div[id^=toolbar]>div>div>a:nth-child(3)>span>span>span[id$=btnInnerEl]")
          expect("No Store selected from Manage Store grid or Reconnect button is not present.  Check your test").to eql "" unless button.present?

          server_error = Orders::Stores::ServerError.new(param)

          amazon = ModifyAmazonStore.new(param)
          volusion = ModifyVolusionStore.new(param)
          rakuten = ModifyRakutenStore.new(param)
          etsy = ModifyEtsyStore.new(param)
          shopify = ModifyShopifyStore.new(param)
          three_d_cart = Modify3DCartStore.new(param)
          yahoo = ModifyYahooStore.new(param)

          15.times do
            button.click
            if server_error.present?
              logger.info server_error.message
              server_error.ok
            end
            5.times do
              if server_error.present?
                error_str = server_error.message
                logger.info error_str
                server_error.ok
                expect("Server Error: \n#{server_error}").to eql ""
              end
              return rakuten if rakuten.present?
              return volusion if volusion.present?
              return amazon if amazon.present?
              return etsy if etsy.present?
              return shopify if shopify.present?
              return three_d_cart if three_d_cart.present?
              return yahoo if yahoo.present?
            end
            return rakuten if rakuten.present?
            return volusion if volusion.present?
            return amazon if amazon.present?
            return etsy if etsy.present?
            return shopify if shopify.present?
            return three_d_cart if three_d_cart.present?
            return yahoo if yahoo.present?
          end
        end

        def delete_item
          button = StampsElement.new browser.span(css: "div[componentid^=managestoreswindow]>div[id^=toolbar]>div>div>a:nth-child(4)>span>span>span[id$=btnInnerEl]")
          delete_modal = DeleteStoreModal.new(param)
          10.times do
            button.click
            return delete_modal if delete_modal.present?
            button.click
            return delete_modal if delete_modal.present?
            button.click
            return delete_modal if delete_modal.present?
            button.click
            sleep(0.35)
            return delete_modal if delete_modal.present?
          end
        end

        def manual_orders

        end
      end

    end
  end
end