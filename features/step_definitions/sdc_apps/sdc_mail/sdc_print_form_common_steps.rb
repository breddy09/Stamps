
Then /^[Ss]elect Print On (.+)$/ do |str|
  if SdcEnv.new_framework
    print_on = SdcMail.print_on
    print_on.selection(:selection_element, str)
    print_on.drop_down.wait_until_present(timeout: 3)
    print_on.text_field.wait_until_present(timeout: 3)
    print_on.drop_down.safe_click
    print_on.selection_element.wait_until_present(timeout: 3)
    print_on.drop_down.click unless print_on.selection_element.present?
    print_on.selection_element.click
    print_on.text_field.wait_until_present(timeout: 3)
    expect(print_on.text_field.text_value).to eql(str) unless str.include? 'Manage'
  else
    stamps.mail.print_on(str)
  end
#  SdcMail.print_media = SdcPrintMediaHelper.to_sym(str)
  TestData.hash[:print_media] = str
end



Then /^check (.+) in Manage Print Options$/ do |str|
  manage_print_options = SdcMail.modals.manage_print_options
  manage_print_options.search.set str
end
#Then click save on Manage Print Options

Then /^[Ss]how Advanced Options$/ do
  if SdcEnv.new_framework
    SdcMail.print_form.show_advanced_options
    expect(SdcMail.print_form.extra_services.text_value).to eql 'Select...'
  else
    stamps.mail.print_form.advanced_options.show
    expect(stamps.mail.print_form.advanced_options).to be_present, 'Print Media error in Advanced Options. Check your feature file workflow.'
  end
end