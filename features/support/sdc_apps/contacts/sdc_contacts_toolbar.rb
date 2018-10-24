module SdcContacts

class Toolbar < SdcPage
  #page_object(:toolbar){{xpath: '//*[contains(@class,"x-toolbar sdc-toolbar")]'}}
  page_object(:add, tag: :span, required: true, timeout: 45) { {xpath: '//span[text()="Add"]'} }
  page_object(:delete) { {xpath: '//span[contains(@id, "button-")][text()="Delete"]'} }
  page_object(:print_postage) { {xpath: '//span[contains(@id, "button-")][text()="Print Postage"]'} }
  page_object(:groups, required: true, timeout: 20) { { xpath: '//span[contains(@id, "button-")][text()="Groups"]'}}
  page_object(:cost_codes, required: true, timeout: 20) { { xpath: '//span[contains(@id, "button-")][text()="Cost Codes"]'}}
  page_object(:ref){{xpath: '//span[contains(@id,"button-")][text()="Ref #"]'}}
  page_object(:import) { {xpath: '//*[contains(@class, "sdc-icon-import")]'} }
  page_object(:export) { {xpath: '//*[contains(@class, "sdc-icon-export")]'} }
  page_object(:feedback) { {xpath: '//*[contains(@class, "sdc-icon-feedback")]'} }
  page_object(:settings) { {xpath: '//*[contains(@class, "sdc-icon-settings")]'} }

end

class CostCodesDropdown< SdcPage
  #page_object(:toolbar){{xpath: '//*[contains(@class,"x-toolbar sdc-toolbar")]'}}
  #page_object(:cost_codes) { {xpath: '//*[@id="CostCodesMenu"]'} } ID Chnages
  page_object(:cost_codes_change_costcode, required: true, timeout: 10) { { xpath: '//span[contains(@id,"menuitem-")][text()="Change Cost Code"]'}}
  page_object(:cost_codes_add_edit_costcode, required: true, timeout: 10) { { xpath: '//span[contains(@id,"menuitem-")][text()="Add/Edit Cost Codes"]'}}
end

class ToolbarSettings< SdcPage
  #page_object(:menu_button, required: true, timeout: 20) { { xpath: '//a[contains(@class, "x-btn toolbar-menu")]' } }
  page_object(:settings_columns, required: true, timeout: 10) { { xpath: '//div[contains (@class,"x-menu-item")]/a/span[contains(@class, "x-menu-item-indent-left-arrow")][text()="Columns"]'}}
  page_object(:settings_freeze_columns,required: true, timeout: 10) { { xpath: '//*[text()="Freeze Columns"]'}}

  def setting_columns_menu_item(column)
     "//span[contains(@id,'menucheckitem-')][text()='#{column}']"
   end

  def setting_columns_menu_item_checkbox(column)
    chooser_xpath = "#{setting_columns_menu_item(column)}/following-sibling::div[1]"
    chooser_name = "men_item_chooser_name"
    page_object(chooser_name) { { xpath: chooser_xpath } }
    #verify_xpath = "//div[contains(@class,'x-menu-item-default')]"
    #verify_xpath="//span[text()='#{column}']/ancestor::div[contains(@class,'x-menu-item-default')]"
    verify_xpath = "#{setting_columns_menu_item(column)}/ancestor::div[contains(@class,'x-menu-item-default')]"
    verify_name = "grid_verify_name"
    page_object(verify_name) { { xpath: verify_xpath } }
    menu_item_checkbox_name = "grid_checkbox_name_test"
    SdcPage.chooser(menu_item_checkbox_name, chooser_name, verify_name, :class, 'unchecked')
    instance_eval(menu_item_checkbox_name)
  end

  def checkbox_checked(column)
    xpath="//span[text()='#{column}']/ancestor::div[contains(@class,'x-menu-item')]"
    item=page_object(:parent_item){{xpath: xpath}}
    #item.attribute_value("class")
    class_value =  item.attribute_value("class")
    class_value.include?("unchecked")
  end

end

  class << self
    def toolbar
      Toolbar.new
    end

    def cost_codes_dropdown
      CostCodesDropdown.new
    end

    def toolbar_settings
      ToolbarSettings.new
    end
  end

end