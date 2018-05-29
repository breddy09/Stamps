module SdcMail
  module SdcPrintForm
    module MailFromContainer
      class MailFrom < SdcPage
        page_object(:drop_down) { { xpath: '//*[@id="sdc-mainpanel-shipfromdroplist-trigger-picker"]' } }
        page_object(:text_field, tag: :text_field) { { xpath: '//*[@name="ShipFrom"]' } }

        def selection(name, str)
          page_object(name) { { xpath: "//li[text()='#{str}']" } }
        end
      end

      def mail_from
        MailFrom.new
      end
    end

    module MailToContainer
      class MailTo < SdcPage
        # Mail To Drop down
        page_object(:dom_drop_down) { { xpath: '//*[@id="sdc-mainpanel-matltocountrydroplist-trigger-picker"]' } }
        page_object(:int_drop_down) { { xpath: '//*[@id="shiptoview-international-targetEl"]//div[contains(@id, "-trigger-picker")][starts-with(@id, "combo")]' } }
        page_objects(:dom_text_field, index: 0, tag: :text_fields) { { xpath: '//input[@name="ShipCountryCode"]' } }
        page_objects(:int_text_field, index: 1, tag: :text_fields) { { xpath: '//input[@name="ShipCountryCode"]' } }
        # Mail To link
        page_object(:link, tag: :u) { { xpath: '//label[contains(@class, "sdc-mainpanel-shiptolinkbtn")]//u' } }
        # Domestic Address
        page_object(:text_area, tag: :textarea) { { xpath: '//textarea[@name="freeFormAddress"]' } }
        # International Address
        page_object(:name, tag: :text_field) { { xpath: '//input[@name="ShipName"]' } }
        page_object(:company, tag: :text_field) { { xpath: '//input[@name="ShipCompany"]' } }
        page_object(:address_1, tag: :text_field) { { xpath: '//input[@name="ShipStreet1"]' } }
        page_object(:address_2, tag: :text_field) { { xpath: '//input[@name="ShipStreet2"]' } }
        page_object(:city, tag: :text_field) { { xpath: '//input[@name="ShipCity"]' } }
        page_object(:province, tag: :text_field) { { xpath: '//input[@name="ShipState"]' } }
        page_object(:postal_code, tag: :text_field) { { xpath: '//input[@name="ShipPostalCode"]' } }
        page_object(:phone, tag: :text_field) { { xpath: '//input[@name="ShipPhone"]' } }

        def selection(name, str)
          page_object(name) { { xpath: "//li[text()='#{str}']" } }
        end
      end

      def mail_to
        MailTo.new
      end
    end

    module EmailTrackingContainer
      class EmailTracking < SdcPage
        text_field(:text_field, tag: :text_field) { { xpath: '//*[@id="sdc-mainpanel-emailtextfield-webpostage-inputEl"]' } }
        page_object(:chooser) { { xpath: '(//*[@id="appMainBodyContent-targetEl"]//div[starts-with(@id, "checkbox-")][contains(@id, "-innerWrapEl")]//input)[0]' } }
        page_object(:verify) { { xpath: '(//div[@class="x-field x-form-item x-form-item-default x-form-type-checkbox x-box-item x-field-default x-hbox-form-item x-form-item-no-label x-form-cb-checked x-form-dirty"])[0]' } }
        chooser(:checkbox, :chooser, :verify, :class, :checked)
      end

      def email_tracking
        EmailTracking.new
      end
    end

    module ExtraServicesContainer
      class ExtraServices < SdcPage
        page_object(:button) { { xpath: '//*[@id="sdc-mainpanel-extraservicesbtn-btnInnerEl"]' } }
        page_object(:cost) { { xpath: '//*[@id="sdc-mainpanel-extraservicespricelabel"]' } }
      end

      def extra_services
        ExtraServices.new
      end
    end

    module WeightContainer
      class Weight < SdcPage
        text_field(:lbs_text_field, tag: :text_field) { { xpath: '//*[@name="Length"]' } }
        page_object(:lbs_increment) { { xpath: '//*[contains(@class,"pounds")]//*[contains(@class,"up")]' } }
        page_object(:lbs_decrement) { { xpath: '//*[contains(@class,"pounds")]//*[contains(@class,"down")]' } }
        sdc_number(:lbs, :lbs_text_field, :lbs_increment, :lbs_decrement)

        text_field(:oz_text_field, tag: :text_field) { { xpath: '//*[@name="WeightOz"]' } }
        page_object(:oz_increment) { { xpath: '//*[contains(@class,"ounces")]//*[contains(@class,"up")]' } }
        page_object(:oz_decrement) { { xpath: '//*[contains(@class,"ounces")]//*[contains(@class,"down")]' } }
        sdc_number(:oz, :oz_text_field, :oz_increment, :oz_decrement)

        page_object(:weigh) { { xpath: '//span[contains(text(), "Weigh")]' } }

        page_object(:auto) { { xpath: '//*[contains(@class,"autoweight-checkbox")]//input' } }
      end

      def weight
        Weight.new
      end
    end

    module DimensionsContainer
      class Dimensions < SdcPage
        text_field(:l_text_field, tag: :text_field) { { xpath: '//*[@name="Length"]' } }
        page_object(:l_increment) { { xpath: '(//div[starts-with(@id, "dimensionsview-")]//*[contains(@class, "up")])[0]' } }
        page_object(:l_decrement) { { xpath: '(//div[starts-with(@id, "dimensionsview-")]//*[contains(@class, "down")])[0]' } }
        sdc_number(:length, :l_text_field, :l_increment, :l_decrement)

        text_field(:w_text_field, tag: :text_field) { { xpath: '//*[@name="Width"]' } }
        page_object(:w_increment) { { xpath: '(//div[starts-with(@id, "dimensionsview-")]//*[contains(@class, "up")])[1]' } }
        page_object(:w_decrement) { { xpath: '(//div[starts-with(@id, "dimensionsview-")]//*[contains(@class, "down")])[1]' } }
        sdc_number(:width, :l_text_field, :l_increment, :l_decrement)

        text_field(:h_text_field, tag: :text_field) { { xpath: '//*[@name="Height"]' } }
        page_object(:h_increment) { { xpath: '(//div[starts-with(@id, "dimensionsview-")]//*[contains(@class, "up")])[2]' } }
        page_object(:h_decrement) { { xpath: '(//div[starts-with(@id, "dimensionsview-")]//*[contains(@class, "down")])[2]' } }
        sdc_number(:height, :h_text_field, :h_increment, :h_decrement)
      end

      def dimensions
        Dimensions.new
      end
    end

    module ServiceContainer
      class Service < SdcPage
        text_field(:text_field, tag: :text_field) { { xpath: '//*[@id="sdc-mainpanel-servicedroplist-inputEl"]' } }
        page_object(:drop_down) { { xpath: '//*[@id="sdc-mainpanel-servicedroplist-trigger-picker"]' } }
        page_object(:cost) { { xpath: '//*[@id="sdc-mainpanel-servicepricelabel"]' } }

        def service_element(name, str)
          page_object(name) { { xpath: "//*[@id='#{data_for(:mail_services, {})[str]}']//td[@class='x-boundlist-item-text']" } }
        end

        def inline_cost_element(name, str)
          page_object(name) { { xpath: "//*[@id='#{data_for(:mail_services, {})[str]}']//td[@class='x-boundlist-item-amount']" } }
        end
      end

      def service
        Service.new
      end
    end

    module InsuranceContainer
      class Insurance < SdcPage
        text_field(:text_field, tag: :text_field) { { xpath: '//*[@id="sdc-mainpanel-insureamtnumberfield-inputEl"]' } }
        page_object(:increment) { { xpath: '//*[@id="sdc-mainpanel-insureamtnumberfield-trigger-spinner"]//*[contains(@class, "up")]' } }
        page_object(:decrement) { { xpath: '//*[@id="sdc-mainpanel-insureamtnumberfield-trigger-spinner"]//*[contains(@class, "down")]' } }
        sdc_number(:oz, :text_field, :increment, :decrement)
        page_object(:cost) { { xpath: '//*[@id="sdc-mainpanel-insurancepricelabel"]' } }
      end

      def insure_for
        Insurance.new
      end
    end

    module TrackingContainer
      class Tracking < SdcPage
        text_field(:text_field, tag: :text_field) { { xpath: '//*[@id="sdc-mainpanel-trackingdroplist-inputEl"]' } }
        page_object(:drop_down) { { xpath: '//*[@id="sdc-mainpanel-trackingdroplist-trigger-picker"]' } }
        page_object(:cost) { { xpath: '//*[@id="sdc-mainpanel-trackingpricelabel"]' } }

        def tracking_element(name, str)
          page_object(name) { { xpath: "//*[@id='#{data_for(:mail_tracking_service, {})[str]}']//td[@class='x-boundlist-item-text']" } }
        end

        def inline_cost_element(name, str)
          page_object(name) { { xpath: "//*[@id='#{data_for(:mail_tracking_service, {})[str]}']//td[@class='x-boundlist-item-amount']" } }
        end
      end

      def tracking
        Tracking.new
      end
    end

    module MailDateContainer
      class Picker < SdcPage
        page_object(:today) { { xpath: '//*[@class="x-datepicker-footer"]//span[contains(@id, "btnInnerEl")]' } }

        def date_elements(name, str)
          page_objects(name) { { xpath: "//div[text()='#{str}']" } }
        end

        def today_element
          page_object(:date_today) { { xpath: '//*[@class="x-datepicker-date"][@title="Today"]' } }
        end

      end

      class MailDate < SdcPage
        page_object(:picker_button) { { xpath: '//div[starts-with(@id, "datefield-")][contains(@id, "-trigger-picker")]' } }
        text_field(:text_field, tag: :text_field) { { xpath: '//input[starts-with(@id, "datefield-")]' } }

        def picker
          Picker.new
        end
      end

      def mail_date
        MailDate.new
      end
    end

    class PrintFormBase < SdcPage
      include MailFromContainer
      include MailToContainer
      include WeightContainer
      include ServiceContainer

      page_object(:show_advanced_options) { { xpath: '//*[text()="Show Advanced Options"]' } }
      page_object(:hide_advanced_options) { { xpath: '//*[text()="Hide Advanced Options"]' } }
    end

    class Stamps < PrintFormBase
      include ExtraServicesContainer

      page_object(:serial_number, tag: :text_field) { { xpath: '//*[@name="NsSerial"]' } }

      page_object(:calc_chooser) { { xpath: '//*[@id="sdc-mainpanel-calculatepostageradio-displayEl"]' } }
      page_object(:calc_verify) { { xpath: '//*[@id="sdc-mainpanel-calculatepostageradio"]' } }
      chooser(:calculate_postage_amount, :del_chooser, :ret_verify,
              :class, :checked)

      page_object(:spec_chooser) { { xpath: '//*[@id="sdc-mainpanel-specifypostageradio-displayEl"]' } }
      page_object(:spc_verify) { { xpath: '//*[@id="sdc-mainpanel-specifypostageradio"]' } }
      chooser(:specify_postage_amount, :del_chooser, :ret_verify,
              :class, :checked)

      text_field(:qty_text_field, tag: :text_field) { { xpath: '//*[@name="NsQuantity"]' } }
      page_object(:qty_increment) { { xpath: '//*[contains(@id,"printPreviewPanel-")]//*[contains(@class,"up")]' } }
      page_object(:qty_decrement) { { xpath: '//*[contains(@id,"printPreviewPanel-")]//*[contains(@class,"down")]' } }
      sdc_number(:quantity, :qty_text_field, :qty_increment, :qty_decrement)
    end

    class ShippingLabels < PrintFormBase
      include EmailTrackingContainer
      include InsuranceContainer
      include TrackingContainer
      include DimensionsContainer
      include ExtraServicesContainer
      include MailDateContainer
    end

    class Envelopes < PrintFormBase
      include ExtraServicesContainer
      include InsuranceContainer
      include ExtraServicesContainer
      include MailDateContainer
    end

    class CertifiedMail < PrintFormBase
      include EmailTrackingContainer
      include DimensionsContainer
      include InsuranceContainer
      include MailDateContainer

      page_object(:cm_chooser) { { xpath: '//*[@id="sdc-mainpanel-cmcheckbox-inputEl"]' } }
      page_object(:cm_verify) { { xpath: '//*[@id="sdc-mainpanel-cmcheckbox"]' } }
      chooser(:certified_mail, :cm_chooser, :cm_verify, :class, :checked)
      page_object(:certified_mail_cost) { { xpath: '//*[@id="sdc-mainpanel-cmpricelabel"]' } }

      page_object(:rr_chooser) { { xpath: '//*[@id="sdc-mainpanel-rrcheckbox-inputEl"]' } }
      page_object(:rr_verify) { { xpath: '//*[@id="sdc-mainpanel-rrcheckbox"]' } }
      chooser(:return_receipt, :rr_chooser, :rr_verify, :class, :checked)
      page_object(:return_receipt_cost) { { xpath: '//*[@id="sdc-mainpanel-rrpricelabel"]' } }

      page_object(:err_chooser) { { xpath: '//*[@id="sdc-mainpanel-rrecheckbox-inputEl"]' } }
      page_object(:err_verify) { { xpath: '//*[@id="sdc-mainpanel-rrecheckbox"]' } }
      chooser(:electronic_return_receipt, :err_chooser, :err_verify, :class, :checked)
      page_object(:electronic_return_receipt_cost) { { xpath: '//*[@id="sdc-mainpanel-rrepricelabel"]' } }

      page_object(:rd_chooser) { { xpath: '//input[contains(@class, "sdc-mainpanel-rdcheckbox")]' } }
      page_object(:rd_verify) { { xpath: '//input[contains(@class, "sdc-mainpanel-rdcheckbox")]/../../..' } }
      chooser(:restricted_delivery, :rd_chooser, :rd_verify, :class, :checked)
      page_object(:restricted_delivery_cost) { { xpath: '//*[@id="restrictedDeliveryCostLabel"]' } }
    end

    class Rolls < PrintFormBase
      include EmailTrackingContainer
      include InsuranceContainer
      include TrackingContainer
      include DimensionsContainer
      include ExtraServicesContainer
      include MailDateContainer
    end
  end
end
