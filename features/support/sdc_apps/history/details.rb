module SdcHistory
  module Details
    class << self
      def loading
        klass = Class.new(SdcPage) do
          page_object(:loading) { { xpath: '(//div[text()="Loading..."])[3]' } }
        end
        klass.new.loading
      end

      def status
        klass = Class.new(SdcPage) do
          page_object(:status) { { xpath: '//div[contains(@class, "sdc-ship-status")]' } }
        end
        klass.new.status
      end

      def tracking
        klass = Class.new(SdcPage) do
          page_object(:tracking) { { xpath: '//div[contains(@class, "tracking-collapsed")][not(contains(@class, "disabled"))]' } }
        end
        klass.new.tracking
      end

      def create_return_label
        klass = Class.new(SdcPage) do
          page_object(:create_return_label) { { xpath: '//*[text()="Create Return Label"][contains(@class, "small")]/../../..' } }
        end
        klass.new.create_return_label
      end

      def email_tracking_info
        klass = Class.new(SdcPage) do
          page_object(:email_tracking_info) { { xpath: '//*[text()="Email Tracking Info"][contains(@id, "button")]/../../..' } }
        end
        klass.new.email_tracking_info
      end
	  
	  def file_claim
        klass = Class.new(SdcPage) do
          page_object(:file_claim) { { xpath: '//*[text()="File Claim"][contains(@id, "button")][1]' } }
        end
        klass.new.file_claim
      end

      def header
        Header.new
      end

      def addresses
        Addresses.new
      end

      def services
        Services.new
      end

      def reference
        Reference.new
      end

      def customs_information
        CustomsInformation.new
      end
    end

    class CustomsInformation <SdcPage
      page_object(:title) { { xpath: '//*[text()="Customs Information"]' } }
      page_object(:package_contents) { { xpath: '//*[text()="Package Contents:"]/following::div//div' } }
      page_object(:package_contents_label) { { xpath: '//*[text()="Package Contents:"]' } }
      page_object(:non_delivery) { { xpath: '//*[text()="Non-Delivery:"]/following::div//div' } }
      page_object(:non_delivery_label) { { xpath: '//*[text()="Non-Delivery:"]' } }
      page_object(:itn) { { xpath: '//*[text()="ITN:"]/following::div//div' } }
      page_object(:itn_label) { { xpath: '//*[text()="ITN:"]' } }

    end

    class ParcelGuardInformation <SdcPage
      page_object(:title) { { xpath: '//*[text()="Parcel Guard Insurance"]' } }
      page_object(:status) { { xpath: '//*[text()="Status:"]/following::div[1]' } }
      page_object(:status_label) { { xpath: '//*[text()="Status:"]' } }
      page_object(:max_claim_amount) { { xpath: '//*[text()="Max Claim Amount:"]/following::label[1]' } }

    end
    class Header < SdcPage
      page_object(:title) { { xpath: '//*[contains(@id, "singlePrintDetailsForm_header")]//*[contains(@id, "title")]//*' } }
      page_object(:toolbar_menu) { { xpath: '//*[contains(@class, "x-btn-after-title")]' } }
      page_object(:toolbar_menu_tooltip) { { xpath: '//b[text()="More"]' } }
      page_object(:file_claim) { { xpath: '//div[contains(@id, "menu")]//*[text()="File Claim"]' } }
      page_object(:create_return_label) { { xpath: '//div[contains(@id, "menu")]//*[text()="Create Return Label"]' } }
      page_object(:email_tracking_info) { { xpath: '//div[contains(@id, "menu")]//*[text()="Email Tracking Info"]' } }
      page_object(:track_on_usps) { { xpath: '//div[contains(@id, "menu")]//*[text()="Track on USPS.com"]' } }
      page_object(:print_receipt) { { xpath: '//div[contains(@id, "menu")]//*[text()="Print Receipt"]' } }
      page_object(:collapse_panel) { { xpath: '//div[contains(@id, "menu")]//*[text()="Collapse Panel"]' } }
    end

    class Addresses < SdcPage
      page_object(:title) { { xpath: '//div[text()="Loading..."]' } }
      page_object(:after_title_tool) { { xpath: '//div[text()="Loading..."]' } }

      page_object(:shipped_to) { { xpath: '//*[text()="Shipped To:"]/../../div/*' } }
      page_object(:shipped_from) { { xpath: '//*[text()="Shipped From:"]/../../div/*' } }
      page_object(:return_to) { { xpath: '//*[text()="Return To:"]/../../div/*' } }
    end

    class Services < SdcPage
      page_object(:title) { { xpath: '//div[text()="Services"][contains(@id, "title")]' } }
      page_object(:after_title_tool) { { xpath: '//a[contains(@class,"before-title")]//*[contains(@class, "sdc-icon-services")]' } }
      page_object(:price) { { xpath: '//*[contains(@class,"after-title")][contains(@class, "services-total")]' } }
      page_object(:file_claim) { { xpath: '//div[contains(@class,"x-title-item")][text()="Services"]//following::span[contains(text(),"File Claim")][1]' } }
      page_object(:carrier) { { xpath: '//*[text()="Carrier:"]/../../div/*' } }
      page_object(:carrier_label) { { xpath: '//*[text()="Carrier:"]' } }
      page_object(:service) { { xpath: '//*[text()="Service:"]/../../div/*' } }
      page_object(:service_label) { { xpath: '//*[text()="Service:"]' } }
      page_object(:service_price) { { xpath: '//*[text()="Service:"]//following::div[contains(@class,"service-detail-amt")][1]' } }
      page_object(:packaging) { { xpath: '//*[text()="Packaging:"]/../../div/*' } }
      page_object(:packaging_label) { { xpath: '//*[text()="Packaging:"]' } }
      page_object(:insurance) { { xpath: '//*[text()="Insurance:"]/../../div/*' } }
      page_object(:insurance_label) { { xpath: '//*[text()="Insurance:"]' } }
      page_object(:file_claim_cost) { { xpath: '//div[contains(@class,"x-title-item")][text()="Services"]//following::span[contains(text(),"File Claim")][1]//following::div[@role="textbox"][1]' } }
      page_object(:tracking_label) { { xpath: '//*[text()="Insurance:"]//following::span[text()="Tracking:"][2]' } }
      page_object(:tracking) { { xpath: '//*[text()="Insurance:"]//following::span[text()="Tracking:"][2]//following::div[2]' } }
      page_object(:tracking_signature) { { xpath: '//*[text()="Electronic Signature Confirmation"]' } }
      page_object(:signature_cost) { { xpath: '//*[text()="Electronic Signature Confirmation"]//following::div[contains(@class,"service-detail-amt")][1]' } }
      page_object(:weight) { { xpath: '//*[text()="Weight:"]/../../div/*' } }
      page_object(:weight_label) { { xpath: '//*[text()="Weight:"]' } }

      page_object(:stamps_qty) { { xpath: '//*[text()="Stamp Qty:"]/following::div/div' } }
      page_object(:stamps_qty_label) { { xpath: '//*[text()="Stamp Qty:"]' } }

    end

    class Reference < SdcPage
      page_object(:title) { { xpath: '//div[contains(@class,"sdc-detailssection-header-title")]//div[contains(@class,"x-title-item")][text()="Reference"]' } }
      page_object(:after_title_tool) { { xpath: '' } }
      page_object(:user) { { xpath: '//span[text()="User:"]//following::div[contains(@class,"x-form-display-field")][1]'}}
      page_object(:user_label) { { xpath: '//span[text()="User:"]'}}
      page_object(:printed_on) { { xpath: '//span[text()="Printed On:"]//following::div[contains(@class,"x-form-display-field")][1]'}}
      page_object(:printed_on_label) { { xpath: '//span[text()="Printed On:"]'}}
      page_object(:sacan_form_id) { { xpath: '//span[text()="SCAN Form ID:"]//following::div[contains(@class,"x-form-display-field")][1]'}}
      page_object(:reference) { { xpath: '//span[text()="Reference #:"]//following::div[contains(@class,"x-form-display-field")][1]'}}

    def cost_code
        HistoryDetailCostcode.new
    end
    end

    class HistoryDetailCostcode <SdcPage
      page_object(:text_field, tag: :text_field) { { xpath: '//span[text()="Cost Code:"]/following::input[1]' } }
      page_object(:drop_down) { { xpath: '//span[text()="Cost Code:"]//following::div[contains(@class, "arrow")]' } }
      page_objects(:costcode_list){ { xpath: '//div[contains(@id, "changeCostCode")]//following::li' } }

      def costcode_random(position)
        xpath_text = "//div[contains(@id, 'changeCostCode')]//following::li[#{position}]"
        page_object(:costcode_text, required: true, timeout: 10) { { xpath: xpath_text } }
      end

      def selection(value)
        page_object(:selection_obj) { { xpath: "//li[text()='#{value}']" } }
      end

    end

  end
end