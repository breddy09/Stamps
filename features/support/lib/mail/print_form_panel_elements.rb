module Stamps
  module Mail
    module PrintFormPanel

      class UpgradePlan < Browser::StampsModal
        attr_reader :window_title, :close_btn, :upgrade_now_btn, :not_yet_btn, :paragraph_element

        def initialize(param)
          super
          @window_title = StampsElement.new(browser.div(text: "Upgrade Plan"))
          @close_btn = StampsElement.new(browser.img(text: "img[class*=close]"))
          @upgrade_now_btn = StampsElement.new(browser.span(text: "Upgrade Now"))
          @not_yet_btn = StampsElement.new(browser.span(text: "Not Yet"))
          @paragraph_element = StampsElement.new(browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]"))
        end

        def present?
          window_title.present?
        end

        def close
          close_btn.click_while_present
        end

        def paragraph
          paragraph_element.text
        end

        def not_yet
          not_yet_btn.click_while_present
        end

        def upgrade_now
          upgrade_now_btn.click_while_present
          expect(browser.url).to include(param.test_env), "User rerouted to an external URL. You are no longer in #{param.test_env}. Check URL #{browser.url}"
        end
      end

      module PrintMediaHelper
        def print_media(str)
          case str
            when /Stamps/
              print_media = :stamps
            when /Shipping Label/
              print_media = :labels
            when /Envelope/
              print_media = :envelopes
            when /Certified Mail/
              print_media = :certified_mails
            when /Roll/
              print_media = :rolls
            when /Manage Printing Options/
              print_media = :manage_printing_options
            else
              #ignore
          end
          expect([:stamps, :labels, :envelopes, :certified_mails, :rolls, :manage_printing_options]).to include(print_media)
          print_media
        end

        def selected_sub_str(str)
          case str
            when /Stamps/
              return 'Stamps'
            when /Shipping Label - Paper/
              return 'Paper'
            when /Shipping Label - SDC-1200/
              return 'SDC-1200'
            when /Shipping Label - 5x8/
              return 'Shipping Label - 5 '
            when /Envelope - 10/
              return 'Envelope - #10'
            when /Envelope - 9/
              return 'Envelope - #9'
            when /Envelope - A9/
              return 'Envelope - #A9'
            when /Envelope - 6/
              return 'Envelope - #6'
            when /Envelope - A2/
              return 'Envelope - #A2'
            when /Envelope - 7/
              return 'Envelope - #7'
            when /Envelope - 11/
              return 'Envelope - #11'
            when /Envelope - 12/
              return 'Envelope - #12'
            when /Certified Mail Label - SDC-3610/
              return 'SDC-3610'
            when /Certified Mail Label - SDC-3710/
              return 'SDC-3710'
            when /Certified Mail Label - SDC-3910/
              return 'SDC-3910'
            when /Certified Mail Label - SDC-3930/
              return 'SDC-3930'
            when /Certified Mail Label - SDC-3810/
              return 'SDC-3810'
            when /Roll 4x6/
              return 'Roll - 4'
            when /Roll 418x614/
              return 'Roll - 4 '
            when /Manage Printing Options/
              return 'Manage Printing Option...'
            else
              #ignore
          end
        end

        def mpo_search_str(str)
          case str
            when /Stamps/
              return 'stamps'
            when /Shipping Label - Paper/
              return 'Shipping Label - 8 '
            when /Shipping Label - SDC-1200/
              return 'Shipping Label - Stamps.com SDC-1200'
            when /Shipping Label - 5x8/
              return 'Shipping Label - 5 '
            when /Envelope - 10/
              return 'Envelope - #10'
            when /Envelope - 9/
              return 'Envelope - #9'
            when /Envelope - A9/
              return 'Envelope - #A9'
            when /Envelope - 6/
              return 'Envelope - #6'
            when /Envelope - A2/
              return 'Envelope - #A2'
            when /Envelope - 7/
              return 'Envelope - #7'
            when /Envelope - 11/
              return 'Envelope - #11'
            when /Envelope - 12/
              return 'Envelope - #12'
            when /Certified Mail Label - SDC-3610/
              return 'Certified Mail Label - Stamps.com SDC-3610'
            when /Certified Mail Label - SDC-3710/
              return 'Certified Mail Label - Stamps.com SDC-3710'
            when /Certified Mail Label - SDC-3910/
              return 'Certified Mail Label - Stamps.com SDC-3910'
            when /Certified Mail Label - SDC-3930/
              return 'Certified Mail Label - Stamps.com SDC-3930'
            when /Certified Mail Label - SDC-3810/
              return 'Certified Mail #11 Envelope - Stamps.com SDC-3810'
            when /Roll 4x6/
              return 'Roll - 4" x 6" Shipping Label'
            when /Roll 418x614/
              return 'Roll - 4 '
            else
              #ignore
          end
        end

        def selection_element(str)
          case str
            when /Stamps/
              return 'stamps'
            when /Shipping Label - Paper/
              return 'Shipping Label - 8 '
            when /Shipping Label - SDC-1200/
              return 'Shipping Label - Stamps.com SDC-1200'
            when /Shipping Label - 5x8/
              return 'Shipping Label - 5 '
            when /Envelope - 10/
              return 'Envelope - #10'
            when /Envelope - 9/
              return 'Envelope - #9'
            when /Envelope - A9/
              return 'Envelope - #A9'
            when /Envelope - 6/
              return 'Envelope - #6'
            when /Envelope - A2/
              return 'Envelope - #A2'
            when /Envelope - 7/
              return 'Envelope - #7'
            when /Envelope - 11/
              return 'Envelope - #11'
            when /Envelope - 12/
              return 'Envelope - #12'
            when /Certified Mail Label - SDC-3610/
              return 'Certified Mail Label - Stamps.com SDC-3610'
            when /Certified Mail Label - SDC-3710/
              return 'Certified Mail Label - Stamps.com SDC-3710'
            when /Certified Mail Label - SDC-3910/
              return 'Certified Mail Label - Stamps.com SDC-3910'
            when /Certified Mail Label - SDC-3930/
              return 'Certified Mail Label - Stamps.com SDC-3930'
            when /Certified Mail Label - SDC-3810/
              return 'Certified Mail #11 Envelope - Stamps.com SDC-3810'
            when /Roll 4x6/
              return 'Roll - 4" x 6" Shipping Label'
            when /Roll 418x614/
              return 'Roll - 4 '
            else
              #ignore
          end
        end
      end

      class ManagePrintOptionsModal < Browser::StampsModal
        include PrintMediaHelper

        attr_accessor :stamps, :search_field, :search_result, :save_button, :close_button

        def initialize(param)
          super
          @search_field = StampsTextBox.new(browser.text_field(css: "[placeholder='Search']"))
          @save_button = StampsElement.new(browser.span(text: "Save"))
          @close_button = StampsElement.new(browser.img(class: "x-tool-img x-tool-close"))
        end

        def present?
          search_field.present?
        end

        def wait_until_present(*args)
          search_field.wait_until_present(*args)
        end

        def show_all
          show_stamps
          show_shipping_label_paper
          show_shipping_label_sdc1200
          show_shipping_label_5x8
          show_envelope_10
          show_envelope_9
          show_envelope_a9
          show_envelope_6
          show_envelope_a2
          show_envelope_7
          show_envelope_11
          show_envelope_12
          show_certified_mail_sdc3610
          show_certified_mail_sdc3710
          show_certified_mail_sdc3910
          show_certified_mail_sdc3930
          show_certified_mail_sdc3810
          show_roll_4x6
          show_roll_418x614
          save
        end

        def show_stamps
          show("Stamps")
        end

        def show_shipping_label_paper
          show("Shipping Label - Paper")
        end

        def show_shipping_label_sdc1200
          show("Shipping Label - SDC-1200")
        end

        def show_shipping_label_5x8
          show("Shipping Label - 5x8")
        end

        def show_envelope_10
          show("Envelope - 10")
        end

        def show_envelope_9
          show("Envelope - 9")
        end

        def show_envelope_a9
          show("Envelope - A9")
        end

        def show_envelope_6
          show("Envelope - 6")
        end

        def show_envelope_a2
          show("Envelope - A2")
        end

        def show_envelope_7
          show("Envelope - 7")
        end

        def show_envelope_11
          show("Envelope - 11")
        end

        def show_envelope_12
          show("Envelope - 12")
        end

        def show_certified_mail_sdc3610
          show("Certified Mail Label - SDC-3610")
        end

        def show_certified_mail_sdc3710
          show("Certified Mail Label - SDC-3710")
        end

        def show_certified_mail_sdc3910
          show("Certified Mail Label - SDC-3910")
        end

        def show_certified_mail_sdc3930
          show("Certified Mail Label - SDC-3930")
        end

        def show_certified_mail_sdc3810
          show("Certified Mail Label - SDC-3810")
        end

        def show_roll_4x6
          show("Roll 4x6")
        end

        def show_roll_418x614
          show("Roll 418x614")
        end

        def show(str)
          search(str).check
        end

        def search(str)
          search_field.set(mpo_search_str(str))
          30.times do
            sleep(0.05)
            break if browser.divs(css: "[class=x-grid-row-checker]").size == 1
          end
          search_result_count = browser.divs(css: "[class=x-grid-row-checker]").size
          expect(search_result_count).to eql(1), "Search Results yield more than 1. Got #{search_result_count}"

          clickable_element = browser.div(css: "[class=x-grid-row-checker]")
          verify = browser.div(css: "[class=x-grid-row-checker]").parent.parent.parent.parent.parent
          @search_result = Stamps::Browser::StampsCheckBox.new(clickable_element, verify, "class", "selected")
        end

        def save
          save_button.click_while_present
          sleep(1)
          expect(save_button.present?).to be(false), "Failed to save Manage Print Options, modal might still be open. Check your test."
        end

        def close
          close_button.click_while_present
          sleep(1)
          expect(close_button.present?).to be(false), "Failed to close Manage Print Options, modal might still be open. Check your test."
        end
      end

      class PrintOn < Browser::StampsModal
        include PrintFormBlurOut
        include PrintMediaHelper

        attr_accessor :drop_down, :text_box, :upgrade_plan, :manage_printing_options_lov, :manage_printing_options

        def initialize(param)
          super
          @drop_down = StampsElement.new(browser.div(css: "div[id^=printmediadroplist-][id$=-trigger-picker]"))
          @text_box = StampsTextBox.new(browser.text_field(name: "PrintMedia"))
          @upgrade_plan = UpgradePlan.new(param)
          @manage_printing_options_lov = StampsElement.new(browser.li(text: 'Manage Printing Options...'))
          @manage_printing_options = ManagePrintOptionsModal.new(param)
        end

        def present?
          text_box.present?
        end

        def manage_printing_options_modal
          # Open Mange Print Options modal
          begin
            10.times do
              break if manage_printing_options.present?
              drop_down.click unless manage_printing_options_lov.present?
              manage_printing_options_lov.click
              sleep(0.25)
            end
            expect(manage_printing_options.present?).to be(true), "Unable to open Manage Printing Options modal"
          end unless manage_printing_options.present?
          manage_printing_options
        end

        def show_all_print_media
          drop_down.click unless manage_printing_options_lov.present?
          5.times do
            break if browser.lis(css: "li[class*=x-boundlist-item]").size == 20
          end
          manage_printing_options_modal.show_all if browser.lis(css: "li[class*=x-boundlist-item]").size < 20
        end

        def print_on(str)
          drop_down.wait_until_present(4)
          drop_down.click
          param.print_media = print_media(str)
          selected_sub_str = selected_sub_str(str)
          mpo_search_str = mpo_search_str(str)

          10.times do
            begin
              if text_box.text.include?(selected_sub_str)
                drop_down.click if manage_printing_options_lov.present?
                return param.print_media
              end

              selection = StampsElement.new(browser.li(css: "li[class^=#{(data_for(:mail_print_media, {})[str]).split(',').first}][data-recordindex='#{(data_for(:mail_print_media, {})[str]).split(',').last}']"))
              drop_down.click unless manage_printing_options_lov.present?
              if selection.present?
                selection.scroll_into_view
                selection.click
                selection.click
              elsif manage_printing_options_lov.present? && !selection.present?
                show_all_print_media
              end
            rescue
              #ignore
            end
            sleep(0.15)
          end
          drop_down.click unless manage_printing_options_lov.present?
          expect(selection.present?).to be(true), "Print On selection #{selection} is not in the Print On dropdown List of Values. Manually add it in Manage Printing Options modal." if manage_printing_options_lov.present?
          expect(text_box.text).to include(selected_sub_str), "Print On media selection failed. Expected textbox.text to include #{selected_sub_str}, got \"#{text_box.text}\""
        end

        def tooltip(selection)
          selection_field = StampsElement.new browser.div(text: selection)
          10.times do
            drop_down.click unless selection_field.present?
            return selection_field.attribute_value "data-qtip" if selection_field.present?
          end
        end
      end

      class MailToCountry < Browser::StampsModal
        attr_reader :dom_text_area, :dom_dd, :int_dd, :dom_textbox, :int_textbox
        include PrintFormBlurOut

        def initialize(param)
          super
          @dom_text_area = MailDomTextArea.new(param)
          @dom_dd = StampsTextBox.new(browser.div(id: "sdc-mainpanel-matltocountrydroplist-trigger-picker"))
          @int_dd = StampsTextBox.new(browser.div(css: "div[id=shiptoview-international-targetEl]>div:nth-child(1)>div>div>div[id^=combo]>div>div>div[id$=trigger-picker]"))
          @dom_textbox = StampsTextBox.new(browser.text_field(id: "sdc-mainpanel-matltocountrydroplist-inputEl"))
          @int_textbox = StampsTextBox.new(browser.inputs(name: "ShipCountryCode")[1])
        end

        def enabled?

        end

        def domestic?
          30.times do
            return true if dom_dd.present?
            sleep(0.025)
            return false if int_dd.present?
            sleep(0.025)
          end
          expect(dom_dd.present? || int_dd.present?).to be(true), "Unable to determine if Mail-To Country dropdown is for domestic or international."
        end

        def drop_down
          StampsTextBox.new((domestic?)? dom_dd : int_dd)
        end

        def text_box
          StampsTextBox.new((domestic?)? dom_textbox : int_textbox)
        end

        def select(str)
          begin
            drop_down.click
            selection = StampsElement.new(browser.lis(text: str)[(domestic?)? 0 : 1])
            30.times do
              begin
                drop_down.click unless selection.present?
                selection.scroll_into_view
                selection.click
                blur_out
                break if text_box.text == str
              rescue
                #ignore
              end
            end
          end unless text_box.text == str

          expect(text_box.text).to eql(str)
          blur_out
        end
      end

      class MailToInt < Browser::StampsModal
        attr_reader :country, :name, :company, :address_1, :address_2, :city, :province, :postal_code, :phone
        include PrintFormBlurOut

        def initialize(param)
          super
          @name = StampsTextBox.new(browser.text_field(name: "ShipName"))
          @company = StampsTextBox.new(browser.text_field(name: "ShipCompany"))
          @address_1 = StampsTextBox.new(browser.text_field(name: "ShipStreet1"))
          @address_2 = StampsTextBox.new(browser.text_field(name: "ShipStreet2"))
          @city = StampsTextBox.new(browser.text_field(name: "ShipCity"))
          @province = StampsTextBox.new(browser.text_field(name: "ShipState"))
          @postal_code = StampsTextBox.new(browser.text_field(name: "ShipPostalCode"))
          @phone = StampsTextBox.new(browser.text_field(css: "div[id=shiptoview-international-targetEl]>div>div>div>div>div>div>div>input[name=ShipPhone]"))
        end
      end

      class MailDomTextArea < StampsTextBox
        def initialize(param)
          super(param.browser.textarea(id: "sdc-mainpanel-shiptotextarea-inputEl"))
        end
      end

      class MailToDom < Browser::StampsModal
        attr_reader :text_area, :country
        include PrintFormBlurOut

        def initialize(param)
          super
          @text_area = MailDomTextArea.new(param)
        end

        def set(address)
          text_area.click
          text_area.set(address)
          text_area.click
          text_area.double_click
          text_area.click
          text_area.double_click
          blur_out
          blur_out
          blur_out
        end
      end

      class PrintFormEmail < Browser::StampsModal
      end

      class PrintFormWeight < Browser::StampsModal
        attr_reader :auto_weigh, :weigh_button, :mail_pounds, :mail_ounces
        include PrintFormBlurOut

        def initialize(param)
          super
          @auto_weigh = StampsCheckBox.new browser.input(id: "div[class*=autoweight-checkbox]>div>div>input[id^=checkbox]"), browser.table(id: "sdc-mainpanel-autoweightcheckbox"), "class", "checked"
          @weigh_btn = StampsElement.new browser.span(text: "Weigh")

          text_box = browser.text_field(name: "WeightLbs")
          inc_btn = browser.div(css: "div[class*=pounds-numberfield]>div>div>div>div[class*=spinner-up]")
          dec_btn = browser.div(css: "div[class*=pounds-numberfield]>div>div>div>div[class*=spinner-down]")
          @mail_pounds = StampsNumberField.new(text_box, inc_btn, dec_btn)

          text_box = browser.text_field(name: "WeightOz")
          inc_btn = browser.div(css: "div[class*=ounces-numberfield]>div>div>div>div[class*=spinner-up]")
          dec_btn = browser.div(css: "div[class*=ounces-numberfield]>div>div>div>div[class*=spinner-down]")
          @mail_ounces = StampsNumberField.new(text_box, inc_btn, dec_btn)
        end

        def present?
          mail_pounds.present? && mail_ounces.present?
        end
      end

      class PrintFormDimensions < Browser::StampsModal
        attr_accessor :length, :width, :height

        def initialize(param)
          super
          text_box = browser.text_field(name: "Length")
          inc_btn = browser.div(css: "div[id^=dimensionsview-][id$=-targetEl]>div:nth-child(1)>div>div>div>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=dimensionsview-][id$=-targetEl]>div:nth-child(1)>div>div>div>div[class*=down]")
          @length = StampsNumberField.new(text_box, inc_btn, dec_btn)

          text_box = browser.text_field(name: "Width")
          inc_btn = browser.div(css: "div[id^=dimensionsview-][id$=-targetEl]>div:nth-child(3)>div>div>div>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=dimensionsview-][id$=-targetEl]>div:nth-child(3)>div>div>div>div[class*=down]")
          @width = StampsNumberField.new(text_box, inc_btn, dec_btn)

          text_box = browser.text_field(name: "Height")
          inc_btn = browser.div(css: "div[id^=dimensionsview-][id$=-targetEl]>div:nth-child(5)>div>div>div>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=dimensionsview-][id$=-targetEl]>div:nth-child(5)>div>div>div>div[class*=down]")
          @height = StampsNumberField.new(text_box, inc_btn, dec_btn)
        end
      end

      class PrintFormMailFrom < Browser::StampsModal
        attr_reader :text_box, :drop_down, :manage_shipping_address
        include PrintFormBlurOut

        def initialize(param)
          super
          @text_box = StampsTextBox.new(browser.text_field(id: "sdc-mainpanel-shipfromdroplist-inputEl"))
          @drop_down = StampsElement.new(browser.div(id: "sdc-mainpanel-shipfromdroplist-trigger-picker"))
          @manage_shipping_address = MailManageShippingAddresses.new(param)
        end

        def present?
          text_box.present?
        end

        def selection_element(str)
          if str.downcase.include?('default')
            selection = StampsElement.new(browser.lis(css: "ul[id^=boundlist-][id$=-listEl]>li[class*=x-boundlist-item]")[0])
          else
            # verify str is in Ship-From drop-down list of values
            lovs = []
            browser.lis(css: "ul[id^=boundlist-][id$=-listEl]>li[class*='x-boundlist-item']").each_with_index { |element, index| lovs[index] = element.text }
            expect(lovs).to include(/#{str}/), "Ship From drop-down list of values: #{lovs} does not include #{str}"
            selection = StampsElement.new(browser.li(text: /#{str}/))
          end
          StampsElement.new(selection)
        end

        def select(str)
          drop_down.click

          if str.downcase.include? "manage shipping"
            10.times do
              begin
                selection = selection_element(str)
                selection.click
                return manage_shipping_address if manage_shipping_address.present?
                drop_down.click unless selection.present?
              rescue
                #ignore
              end
            end
          else
            10.times do
              selection = selection_element(str)
              selection.click
              break if text_box.text.length > 0
              drop_down.click unless selection.present?
            end
          end
        end
      end

      class PrintFormService < Browser::StampsModal
        attr_reader :text_box, :drop_down
        include PrintFormBlurOut

        def initialize(param)
          super
          @text_box = StampsTextBox.new browser.text_field(id: "sdc-mainpanel-servicedroplist-inputEl")
          @drop_down = StampsElement.new browser.div(id: "sdc-mainpanel-servicedroplist-trigger-picker")
        end

        def select(str)
          logger.info "Select service #{str}"
          selection = StampsElement.new browser.td(css: "li[id='#{data_for(:mail_services, {})[str]}']>table>tbody>tr>td[class*=text]")
          20.times do
            begin
              break if (text_box.text).include?(str)
              drop_down.click unless selection.present?
              selection.scroll_into_view
              selection.click
            rescue
              #ignore
            end
          end
          expect(text_box.text).to include(str)
          logger.info "#{text_box.text} service selected."
          selection
        end

        def cost(selection)
          cost_label = StampsElement.new browser.td css: "tr[data-qtip*='#{selection}']>td:nth-child(3)"
          20.times {
            begin
              drop_down.click unless cost_label.present?
              if cost_label.present?
                service_cost = test_helper.remove_dollar_sign(cost_label.text).to_f.round(2)
                logger.info "Service Cost for \"#{selection}\" is #{service_cost}"
                return service_cost
              end
            rescue
              #ignore
            end
          }
          blur_out
        end

        def tooltip(selection)
          button = drop_down
          selection_label = StampsElement.new browser.tr css: "tr[data-qtip*='#{selection}']"
          10.times {
            begin
              button.click unless selection_label.present?
              if selection_label.present?
                tooltip = selection_label.attribute_value "data-qtip"
                logger.info "Service Tooltip for \"#{selection}\" is #{tooltip}"
                return tooltip
              end
            rescue
              #ignore
            end
          }
          blur_out
        end

        def price
          StampsElement.new(browser.label(id: "sdc-mainpanel-servicepricelabel"))
        end

      end

      class StampAmount < Browser::StampsModal
        def text_box
          StampsTextBox.new(browser.text_field name: "stampAmount")
        end

        def set(value)
          text_field = text_box
          text_field.set(value)
          logger.info "Pounds set to #{text_field.text}"
        end

        def increment value
          button = StampsElement.new browser.div css: "div[id^=fieldcontainer-][id$=-innerCt]>div[id^=fieldcontainer-][id$=-targetEl]>table[id^=numberfield]>tbody>tr>td>table>tbody>tr>td>div[class*=up]"
          value.to_i.times do
            button.click
          end
        end

        def decrement value
          button = StampsElement.new browser.div css: "div[id^=fieldcontainer-][id$=-innerCt]>div[id^=fieldcontainer-][id$=-targetEl]>table[id^=numberfield]>tbody>tr>td>table>tbody>tr>td>div[class*=down]"
          value.to_i.times do
            button.click
          end
        end
      end

      class PrintFormEmail < Browser::StampsModal
        attr_reader :checkbox, :text_box
        def initialize(param)
          super
          @checkbox = StampsCheckBox.new browser.input(id: "sdc-mainpanel-emailcheckbox-inputEl"), browser.table(id: "sdc-mainpanel-emailcheckbox"), "class", "checked"
          @text_box = StampsTextBox.new browser.text_field(id: "sdc-mainpanel-emailtextfield-inputEl")
        end

        def set(value)
          checkbox.check
          text_box.set(value)
        end
      end

      class MailTracking < Browser::StampsModal

        def text_box
          StampsTextBox.new browser.text_field name: "tracking"
        end

        def drop_down
          StampsElement.new(browser.divs(css: "div[class*=x-form-arrow-trigger]")[7])
        end

        def select(selection)
          logger.info "Select Tracking #{selection}"
          box = text_box
          button = drop_down
          selection_label = StampsElement.new browser.div text: selection
          10.times {
            begin
              button.click #unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.click
              selected_tracking = box.text
              logger.info "Selected Tracking #{selected_tracking} - #{(selected_tracking.include? selection)?"done": "tracking not selected"}"
              break if selected_tracking.include? selection
            rescue
              #ignore
            end
          }
          logger.info "Tracking selected: #{selection}"
          selection_label
        end

        def price
          StampsElement.new browser.label id: "sdc-mainpanel-trackingpricelabel"
        end
      end

      class PrintFormInsureFor < Browser::StampsModal
        def checkbox

        end

        def text_box
          StampsTextBox.new browser.text_field id: "sdc-mainpanel-insureamtnumberfield-inputEl"
        end

        def increment value

        end

        def decrement value

        end

        def price
          StampsElement.new browser.label id: "sdc-mainpanel-insurancepricelabel"
        end
      end

      class PrintFormCostCode < Browser::StampsModal
        def text_box
          StampsTextBox.new browser.text_field name: "costCodeId"
        end

        def drop_down
          buttons = browser.divs css: "div[class*=x-form-arrow-trigger]"
          button = StampsElement.new(buttons.last)
        end

        def select(selection)
          logger.info "Select Cost Code #{selection}"

          box = text_box
          button = drop_down
          selection_label = StampsElement.new browser.div text: selection
          sleep(0.35)
          10.times {
            begin
              button.click #unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.click
              selected_cost_code = box.text
              logger.info "Selected Cost Code #{selected_cost_code} - #{(selected_cost_code.include? selection)?"done": "cost code not selected"}"
              break if selected_cost_code.include? selection
            rescue
              #ignore
            end
          }
          logger.info "Origin Country selected: #{selection}"
          selection_label
        end

      end

      class PrintFormQuantity < Browser::StampsModal
        def text_box
          StampsTextBox.new(browser.text_field css: "input[class*='sdc-previewpanel-quantitynumberfield']")
        end

        def set(value)
          text_field = text_box
          text_field.set(value)
          logger.info "Quantity set to #{text_field.text}"
        end

        def increment value
          button = StampsElement.new(browser.divs(css: "div[class*=x-form-spinner-up]")[7])
          value.to_i.times do
            button.click
          end
        end

        def decrement value
          button = StampsElement.new(browser.divs(css: "div[class*=x-form-spinner-down]")[7])
          value.to_i.times do
            button.click
          end
        end
      end

      class PrintFormMailToLink < Browser::StampsModal
        attr_accessor :link, :contacts_modal

        def initialize(param)
          super
          @link = StampsElement.new(browser.span(css: "label[class*=sdc-mainpanel-shiptolinkbtn]>span>span>span[id$=btnInnerEl]"))
          @contacts_modal = MailSearchContactsModal.new(param)
        end

        def click
          15.times do
            sleep(0.35)
            return contacts_modal if contacts_modal.present?
            link.click
          end
          expect(contacts_modal.present?).to be(true)
        end
      end

      class PrintFormMailTo < Browser::StampsModal
        attr_reader :mail_to_link, :mail_to_country
        include PrintFormBlurOut

        def initialize(param)
          super
          @mail_to_country = MailToCountry.new(param)
          @mail_to_link = PrintFormMailToLink.new(param)
        end

        def address
          blur_out
          if mail_to_country.domestic?
            @address = MailToDom.new(param)
          else
            @address = MailToInt.new(param)
          end
        end

        def country(str)
          expect(mail_to_country.present?).to be(true)
          blur_out
          mail_to_country.select(str)
          address
        end
      end

      class PrintFormCustoms < Browser::StampsModal
        attr_reader :button, :customs_form

        def initialize(param)
          super
          @button = StampsElement.new(browser.span(id: "sdc-mainpanel-editcustombtn-btnInnerEl"))
          @customs_form = Stamps::Common::Customs::CustomsInformation.new(param)
        end

        def edit_form
          15.times do
            return customs_form if customs_form.present?
            button.scroll_into_view
            button.click
            sleep(0.2)
          end
          expect(customs_form.present?).to be(true)
        end

        def restrictions

        end

        def i_agree_to_insurance_terms
        end
      end


    end
  end
end