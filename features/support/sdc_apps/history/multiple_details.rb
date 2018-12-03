module SdcHistory
  module MultipleDetails
    class << self
      def loading
        klass = Class.new(SdcPage) do
          page_object(:loading) { { xpath: '(//div[text()="Loading..."])[3]' } }
        end
        klass.new.loading
      end

      def header
        Header.new
      end

    end

    class Header < SdcPage
      #to-do Navya to change the xpaths
      page_object(:title) { { xpath: '//*[contains(@id, "multiPrintDetails")]//*[contains(@id, "title")]//*' } }
      page_object(:toolbar_menu) { { xpath: '//*[contains(@id, "multiPrintDetails")]//*[contains(@class, "x-btn-after-title")]' } }
      page_object(:collapse_panel) { { xpath: '//div[contains(@id, "menu")]//*[text()="Collapse Panel"]' } }
      page_objects(:recipient_name_list) { { xpath: '//*[contains(@id, "multiPrintDetails")][contains(@class,"x-box-target")]//label' } }

      def recipient_name(position)
        xpath_text = "//*[contains(@id, 'multiPrintDetails')][contains(@class,'x-box-target')]//label[#{position}]"
        page_object(:recipient_name_text, required: true, timeout: 10) { { xpath: xpath_text } }
      end
    end

  end
end