module Stamps
  module Orders
    module Settings
      #todo-rob re-work changes to Settings Fields tests
      class Pounds < Browser::StampsModal
        attr_reader :textbox, :inc_bthn, :dec_btn

        def initialize(param)
          super
          @textbox=StampsTextbox.new(browser.text_field(name: 'sdc-resetfieldswin-poundsnumberfield-inputEl'))
          @inc_bthn=StampsField.new(browser.div(css: "div#sdc-resetfieldswin-poundsnumberfield-trigger-spinner>div[class*=up]"))
          @dec_btn=StampsField.new(browser.div(css: "div#sdc-resetfieldswin-poundsnumberfield-trigger-spinner>div[class*=down]"))
        end

        def text
          textbox.text
        end

        def set(value)
          textbox.set(value)
          logger.info "Pounds set to #{textbox.text}"
          expect(text).to eql value
        end

        def increment value
          value.to_i.times do
            inc_bthn.click
          end
        end

        def decrement value
          value.to_i.times do
            dec_btn.click
          end
        end
      end

      class Ounces < Browser::StampsModal
        attr_reader :textbox, :inc_btn, :dec_btn

        def initialize(param)
          super
          @textbox=StampsTextbox.new(browser.text_field(name: 'sdc-resetfieldswin-ouncesnumberfield-inputEl'))
          @inc_btn=StampsField.new(browser.div(css: "div#sdc-resetfieldswin-ouncesnumberfield-trigger-spinner>div[class*=up]"))
          @dec_btn=StampsField.new(browser.div(css: "div#sdc-resetfieldswin-ouncesnumberfield-trigger-spinner>div[class*=down]"))
        end

        def text
          textbox.text
        end

        def set(value)
          textbox.set(value)
          logger.info "Pounds set to #{textbox.text}"
          expect(text).to eql value
        end

        def increment value
          value.to_i.times do
            inc_btn.click
          end
        end

        def decrement value
          value.to_i.times do
            dec_btn.click
          end
        end
      end

      class Weight < Browser::StampsModal
        attr_reader :lb, :oz

        def initialize(param)
          super
          @lb=Pounds.new(param)
          @oz=Ounces.new(param)
        end

        def enabled?
          StampsField.new(browser.text_field(name: 'sdc-resetfieldswin-poundsnumberfield-inputEl')).enabled?
        end

        def checkbox
          checkbox_field=browser.span(id: "sdc-resetfieldswin-weightcheckbox-displayEl")
          verify_field=checkbox_field.parent.parent.parent
          attribute_name="class"
          attribute_value="checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end
      end

      class Length < Browser::StampsModal
        attr_reader :textbox, :inc_btn, :dec_btn

        def initialize(param)
          super
          @textbox=StampsTextbox.new(browser.text_field(name: 'sdc-resetfieldswin-lengthnumberfield-inputEl'))
          @inc_btn=StampsField.new(browser.div css: "div#sdc-resetfieldswin-lengthnumberfield-trigger-spinner>div[class*=up]")
          @dec_btn=StampsField.new(browser.div css: "div#sdc-resetfieldswin-lengthnumberfield-trigger-spinner>div[class*=down]")
        end

        def text
          textbox.text
        end

        def set(value)
          textbox.set(value)
          logger.info "Pounds set to #{textbox.text}"
          expect(text).to eql value
        end

        def increment value
          value.to_i.times do
            inc_btn.click
          end
        end

        def decrement value
          value.to_i.times do
            dec_btn.click
          end
        end
      end

      class Width < Browser::StampsModal
        attr_reader :textbox, :inc_btn, :dec_btn

        def initialize(param)
          super
          @textbox=StampsTextbox.new(browser.text_field name: 'sdc-resetfieldswin-widthnumberfield-inputEl')
          @inc_btn=StampsField.new(browser.div css: "div#sdc-resetfieldswin-widthnumberfield-trigger-spinner>div[class*=up]")
          @dec_btn=StampsField.new(browser.div css: "div#sdc-resetfieldswin-widthnumberfield-trigger-spinner>div[class*=down]")
        end

        def text
          textbox.text
        end

        def set(value)
          textbox.set(value)
          logger.info "Pounds set to #{textbox.text}"
          expect(text).to eql value
        end

        def increment value
          value.to_i.times do
            inc_btn.click
          end
        end

        def decrement value
          value.to_i.times do
            dec_btn.click
          end
        end
      end

      class Height < Browser::StampsModal
        attr_reader :textbox

        def initialize(param)
          super
          @textbox=StampsTextbox.new(browser.text_field name: 'sdc-resetfieldswin-heightnumberfield-inputEl')
        end

        def text
          textbox.text
        end

        def set(value)
          textbox.set(value)
          logger.info "Pounds set to #{textbox.text}"
          expect(text).to eql value
        end

        def increment value
          button=StampsField.new(browser.div css: "div#sdc-resetfieldswin-heightnumberfield-trigger-spinner>div[class*=up]")
          value.to_i.times do
            button.click
          end
        end

        def decrement value
          button=StampsField.new(browser.div css: "div#sdc-resetfieldswin-heightnumberfield-trigger-spinner>div[class*=down]")
          value.to_i.times do
            button.click
          end
        end
      end

      class SettingsLogoffDropDown < Browser::StampsModal
        def textbox
          (cache[:textbox].nil?||!cache[:textbox].present?)?cache[:textbox]=StampsField.new(
              browser.text_field(css: "[id^=generaltabview-][id$=-targetEl] [id^=form-][id$=-targetEl]>div:nth-child(4) input")):cache[:textbox]
        end

        def dropdown
          (cache[:dropdown].nil?||!cache[:dropdown].present?)?cache[:dropdown]=StampsField.new(
              browser.div(css: "[id^=generaltabview-][id$=-targetEl] [id^=form-][id$=-targetEl]>div:nth-child(4) [class*=arrow-trigger]")):cache[:dropdown]
        end

        def five_min
          select("5 min.")
        end

        def ten_min
          select("10 min.")
        end

        def fifteen_min
          select("15 min.")
        end

        def thirty_min
          select("30 min.")
        end

        def one_hour
          select("1 hour")
        end

        def two_hours
          select("2 hours")
        end

        private
        def select(str)
          selection=StampsField.new(browser.li(text: str))
          10.times do
            return textbox.text if textbox.text==str
            dropdown.click unless selection.present?
            selection.click
          end
          nil
        end
      end

      class PostDateDropDown < Browser::StampsModal
        attr_reader :textbox, :dropdown

        def initialize(param)
          super
          @textbox=StampsTextbox.new browser.text_field(css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(4)>div>div>div>div>div>div>div>div>input")
          @dropdown=StampsField.new browser.div css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(4)>div>div>div>div>div>div>div>div[id$=picker]"
        end

        def text
          textbox.text
        end

        def select(selection)
          selection_label=StampsField.new browser.li text: selection
          10.times do
            break if textbox.text.include? selection
            dropdown.click unless selection_label.present?
            selection_label.click
          end
          expect(textbox.text).to include(selection)
        end

        def twelve_am
          select "12:00 a.m."
        end

        def one_am
          select "1:00 a.m."
        end

        def two_am
          select "2:00 a.m."
        end

        def three_am
          select "3:00 a.m."
        end

        def four_am
          select "4:00 a.m."
        end

        def five_am
          select "5:00 a.m."
        end

        def six_am
          select "6:00 a.m."
        end

        def seven_am
          select "7:00 a.m."
        end

        def eight_am
          select "8:00 a.m."
        end

        def nine_am
          select "9:00 a.m."
        end

        def ten_am
          select "10:00 a.m."
        end

        def eleven_am
          select "11:00 a.m."
        end

        def twelve_pm
          select "12:00 p.m."
        end

        def one_pm
          select "1:00 p.m."
        end

        def two_pm
          select "2:00 p.m."
        end

        def three_pm
          select "3:00 p.m."
        end

        def four_pm
          select "4:00 p.m."
        end

        def five_pm
          select "5:00 p.m."
        end

        def six_pm
          select "6:00 p.m."
        end

        def seven_pm
          select "7:00 p.m."
        end

        def eight_pm
          select "8:00 p.m."
        end

        def nine_pm
          select "9:00 p.m."
        end

        def ten_pm
          select "10:00 p.m."
        end

        def eleven_pm
          select "11:00 p.m."
        end
      end

      class PostageBalanceDropDown < Browser::StampsModal
        attr_reader :textbox, :dropdown

        def initialize(param)
          super
          @textbox=StampsTextbox.new browser.text_field(css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(5)>div>div>div>div>div>div>div>div>input")
          @dropdown=StampsField.new browser.div(css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(5)>div>div>div>div>div>div>div>div[id$=picker]")
        end

        def select(selection)
          selection_label=StampsField.new browser.li text: selection
          10.times do
            break if textbox.text.include? selection
            dropdown.click unless selection_label.present?
            selection_label.click
          end
          expect(textbox.text).to include(selection)
        end

        def zero
          select "$0"
        end

        def ten
          select "$10"
        end

        def twenty_five
          select "$25"
        end

        def fifty
          select "$50"
        end

        def one_hundred
          select "$100"
        end

        def two_hundred_fifty
          select "$250"
        end

        def five_hundred
          select "$500"
        end
      end

      class Dimensions < Browser::StampsModal
        attr_reader :length, :width, :height

        def initialize(param)
          super
          @length=Length.new(param)
          @width=Width.new(param)
          @height=Height.new(param)
        end

        def enabled?
          StampsField.new(browser.text_field name: 'sdc-resetfieldswin-lengthnumberfield-inputEl').enabled?
        end

        def checkbox
          checkbox_field=browser.span(id: "sdc-resetfieldswin-dimensionscheckbox-displayEl")
          verify_field=checkbox_field.parent.parent.parent
          StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
        end
      end

      class ResetFields < Browser::StampsModal
        def present?
          (browser.div text: "Reset Fields").present?
        end

        def service
          checkbox_field=browser.span id: "sdc-resetfieldswin-servicecheckbox-displayEl"
          verify_field=checkbox_field.parent.parent.parent
          StampsCheckbox.new checkbox_field, verify_field, v, "checked"
        end

        def weight
          Weight.new(param)
        end

        def dimensions
          Dimensions.new(param)
        end

        def ship_to_address
          checkbox_field=browser.span id: "sdc-resetfieldswin-shiptoaddresscheckbox-displayEl"
          verify_field=checkbox_field.parent.parent.parent
          attribute_name="class"
          attribute_value="checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def tracking
          checkbox_field=browser.span id: "sdc-resetfieldswin-trackingcheckbox-displayEl"
          verify_field=checkbox_field.parent.parent.parent
          attribute_name="class"
          attribute_value="checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def extra_services
          checkbox_field=browser.span id: "sdc-resetfieldswin-extraservicescheckbox-displayEl"
          verify_field=checkbox_field.parent.parent.parent
          attribute_name="class"
          attribute_value="checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def insurance
          checkbox_field=browser.span id: "sdc-resetfieldswin-insurancecheckbox-displayEl"
          verify_field=checkbox_field.parent.parent.parent
          attribute_name="class"
          attribute_value="checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def reference_numbers
          checkbox_field=browser.span id: "sdc-resetfieldswin-referencenumberscheckbox-displayEl"
          verify_field=checkbox_field.parent.parent.parent
          attribute_name="class"
          attribute_value="checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def cost_code
          checkbox_field=browser.span id: "sdc-resetfieldswin-costcodecheckbox-displayEl"
          verify_field=checkbox_field.parent.parent.parent
          attribute_name="class"
          attribute_value="checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def customs
          checkbox_field=browser.span id: "sdc-resetfieldswin-customscheckbox-displayEl"
          verify_field=checkbox_field.parent.parent.parent
          attribute_name="class"
          attribute_value="checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def quantity
          checkbox_field=browser.span id: "sdc-resetfieldswin-quantitycheckbox-displayEl"
          verify_field=checkbox_field.parent.parent.parent
          attribute_name="class"
          attribute_value="checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def stamps_amount
          checkbox_field=browser.span id: "sdc-resetfieldswin-stampsamountcheckbox-displayEl"
          verify_field=checkbox_field.parent.parent.parent
          attribute_name="class"
          attribute_value="checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def auto_advance_label_position
          parent=(browser.label :text=> "Auto-Advance Label Position (NetStamps and Label Sheets)").parent
          checkbox_field=parent.span(:class=> 'x-form-checkbox')
          verify_field=checkbox_field.parent.parent.parent
          attribute_name="class"
          attribute_value="checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def close
          button=StampsField.new(browser.span text: "Close")
          5.times do
            return unless button.present?
            button.click
            sleep(0.35)
            return unless present?
          end
        end
      end

      class GeneralSettings < Browser::StampsModal

        def general
          @general=browser.span(text: 'General')
        end

        def title
          StampsField.new(browser.div text: "Orders Settings")
        end

        def present?
          title.present?
        end

        def services
          checkbox_field=browser.span(css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(2)>div>div>div>div>div>div>div>span")
          verify_field=checkbox_field.parent.parent.parent
          StampsCheckbox.new(checkbox_field, verify_field, "class", "checked")
        end

        def log_off
          SettingsLogoffDropDown.new(param)
        end

        def post_date
          PostDateDropDown.new(param)
        end

        def postage_balance
          PostageBalanceDropDown.new(param)
        end

        def print_confirm
          checkbox_field=browser.span css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(6)>div>div>div>div>div>div>div>span"
          verify_field=checkbox_field.parent.parent.parent
          attribute_name="class"
          attribute_value="checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def reset_fields
          modal=ResetFields.new(param)
          button=StampsField.new browser.span text: "Select..."
          10.times do
            button.click unless modal.present?
            return modal if modal.present?
          end
        end

        def usps_terms
          checkbox_field=browser.span css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(8)>div>div>div>div>div>div>div>span"
          verify_field=checkbox_field.parent.parent.parent
          attribute_name="class"
          attribute_value="checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def contacts
          checkbox_field=browser.span css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(10)>div>div>div>div>div>div>div>span"
          verify_field=checkbox_field.parent.parent.parent
          attribute_name="class"
          attribute_value="checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def shipments
          checkbox_field=browser.span css: "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(15)>div>div>div>div>div>div>div>span"
          verify_field=checkbox_field.parent.parent.parent
          attribute_name="class"
          attribute_value="checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def save
          button=StampsField.new(browser.span text: "Done")
          10.times do
            button.click
            return unless button.present?
          end
        end

        def close
          button=StampsField.new(browser.img css: "img[class$=close]")
          10.times do
            button.click
            return unless button.present?
          end
        end
      end


      module GeneralSettingsContainer
        def gen_settings_header
          (cache[:gen_settings].nil?||!cache[:gen_settings].present?)?cache[:gen_settings]=StampsField.new(
              browser.label(text: "General Settings")):cache[:gen_settings]
        end

        def services
          (cache[:services].nil?||!cache[:services].present?)?cache[:services]="":cache[:services]
        end

        def logoff
          (cache[:services].nil?||!cache[:services].present?)?cache[:services]=SettingsLogoffDropDown.new(param):cache[:services]
        end

        def postdate
        end

        def account_balance
          #create account balance class having drop=down $$$ and Auto-fund account
        end

        def print_options
          # create class having two checkboxes
        end

        def reset_fields
          # ResetFields modal
        end

        def usps_terms
          #create class having checkbox and USPS Privacy Act Statement link and modal from clicking link
        end

        def contacts
          #checkbox
        end
      end

      module EmailNotificationContainer
        def shipments
          #checkbox & edit link
        end

        def deliveries
          #checkbox & edit link
        end
      end

      class GeneralTabView < Browser::StampsModal
        include GeneralSettingsContainer
        include EmailNotificationContainer

        def present?
          gen_settings_header.present?
        end
      end

      class InternationalTabView < Browser::StampsModal
        def gen_settings_header
          (cache[:gen_settings_header].nil?||!cache[:gen_settings_header].present?)?cache[:gen_settings_header]=StampsField.new(
              browser.label(text: "Default Customs Information")[0]):cache[:gen_settings_header]
        end

        def package_contents

        end


        def non_delivery_options

        end


        def customs_declarations

        end


        def itn_number

        end


        def when_to_include_itn

        end
      end

      class LabelMessagesTabView < Browser::StampsModal

      end

    end
  end
end