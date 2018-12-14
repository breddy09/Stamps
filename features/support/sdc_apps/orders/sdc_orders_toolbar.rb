module SdcOrders

  class SdcOrdersToolbar < SdcPage
    page_object(:add, tag: :span, required: true, timeout: 45) { {xpath: '//span[text()="Add"]'} }
    page_object(:settings) { {id: 'settingsButton-btnWrap'} }
    page_object(:print) { {xpath: '//*[text()="Print"]'} }
    page_object(:move) { {xpath: '//*[text()="Move"]'} }
    page_object(:tags) { {xpath: '//*[text()="Tags"][contains(@id, "button")]'} }
    page_object(:tags_tooltip) { {xpath: '//b[contains(text(), "Tags")]'} }
    page_object(:more_actions) { {xpath: '//*[text()="More Actions"]'} }
    page_object(:import) { {xpath: '//*[contains(@class, "sdc-icon-import")]'} }
    page_object(:export) { {xpath: '//*[contains(@class, "sdc-icon-export")]'} }
    page_object(:refresh) { {xpath: '//*[contains(@class, "sdc-icon-refresh")]'} }
    page_object(:feedback) { {xpath: '//*[contains(@class, "sdc-icon-feedback")]'} }
  end

end
