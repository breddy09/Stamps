

Then /^[Ii]n [Pp]rint [Mm]odal, click [Pp]rint button Incomplete Order$/ do
  @incomplete_order_modal=stamps.orders.orders_toolbar.toolbar_print.click #this needs to change
  expect("Incomplete Order Modal did not open").to eql "click print modal print button Incomplete Order" unless @incomplete_order_modal.instance_of? Orders::Toolbar::PrintIncompleteOrderError
end

Then /^[Ee]xpect [Pp]rint [Mm]odal Incomplete Order Error Message (.*)$/ do |expectation|
  expect(@incomplete_order_modal.error_message).to include(expectation)
end

Then /^[Ii]n [Pp]rint modal, click Close [Bb]utton$/ do
  stamps.orders.orders_print_modal.close
end

Then /^[Ss]et [Pp]rint [Mm]odal [Pp]rinter to \"(.*)\"$/ do |printer|
  step "Orders print modal printer dropdown is present"
  stamps.orders.orders_print_modal.printer.select(printer)
end

Then /^[Ss]et [Oo]rders [Pp]rint [Mm]odal [Pp]rinter ?(?:|(.*))$/ do |printer|
  step "expect orders print modal is present"
  step "Orders print modal printer dropdown is present"
  expect(test_param[:printer]=(printer.nil?)? modal_param.printer : printer).to_not be_nil, "PRINTER parameter is not defined. Printing tests must define PRINTER value either in cucumber.yml file or in Jenkins."
  if test_param[:printer].include?('\\') #validate printer format
    expect(test_param[:printer]).to match(/\\.+\.*/)
    test_param[:printer]=/\\\\(.+)\\/.match(test_param[:printer])[1]
  end
  expect(stamps.orders.orders_print_modal.printer.select(test_param[:printer])).to_not be_nil, "Unable to select printer \"#{test_param[:printer]}\". \nMake sure \"#{test_param[:printer]}\" is configured for host #{modal_param.hostname}. \nUSR: #{test_param[:username]}, #{modal_param.web_app.to_s.capitalize}(#{modal_param.test_env.upcase})"
end

Then /^[Oo]rders [Pp]rint [Mm]odal [Pp]rinter [Dd]rop[Dd]own is present$/ do
  expect(stamps.orders.orders_print_modal.printer).to be_present, "Print modal Printer dropdown is not present. Check that StampsConnect is connected. You might need to re-login on this PC #{modal_param.hostname}"
end

Then /^[Ee]xpect [Pp]rint [Mm]odal [Pp]rint [Mm]odal is [Pp]resent$/ do
  expect(stamps.orders.orders_print_modal).to be_present, "Orders Print Modal is not present"
end

Then /^[Cc]lick [Pp]rint [Mm]odal [Pp]rint [Bb]utton$/ do
  stamps.orders.orders_print_modal.print
  # @ship_date=print_modal.ship_date.textbox.text
  # @paper_tray=print_modal.paper_tray.textbox.text
  # @printer=print_modal.printer.textbox.text
  # @printing_on=print_modal.printing_on.textbox.text
  # @printing_error=print_modal.print
  # sleep(4)
end

Then /^[Ee]xpect [Oo]rders [Pp]rint [Mm]odal is [Pp]resent$/ do
  expect(stamps.orders.orders_print_modal).to be_present, "Orders Print modal is NOT present"
end

Then /^ReIn [Pp]rint modal, Reprint$/ do
  stamps.orders.orders_toolbar.reprint.reprint
end

Then /^[Ss]et [Pp]rint [Mm]odal Ship Date to today(?:| plus (\d+))$/ do |day|
  step "expect print modal ship date dropdown is present"
  stamps.orders.orders_print_modal.ship_date.date_picker.today_plus((day.nil?)?0:day.to_i)
end

Then /^[Ee]xpect [Pp]rint [Mm]odal Ship Date is (\d+) day\(s\) from today/ do |day|
  step "expect print modal ship date dropdown is present"
  expect(stamps.orders.orders_print_modal.ship_date.textbox.text).to eql(test_helper.date_printed(day))
end

Then /^[Ee]xpect [Pp]rint [Mm]odal [Ss]hip [Dd]ate [Dd]rop[Dd]own is present$/ do
  expect(stamps.orders.orders_print_modal.ship_date).to be_present, "Ship Date dropdown is not present. Check that StampsConnect is connected. You might need to re-login on this PC #{modal_param.hostname}"
end

Then /^[Ii]n [Pp]rint modal, check Hide Mail Value$/ do
  expect(stamps.orders.orders_print_modal.print_options.hide_postage_value).to
end

Then /^[Ii]n [Pp]rint modal, uncheck Hide Mail Value$/ do
  stamps.orders.orders_print_modal.print_options.hide_postage_value.uncheck
end

Then /^[Ee]xpect [Pp]rint [Mm]odal Hide Mail Value CheckBox is checked$/ do
  30.times do
    stamps.orders.orders_print_modal.click
    break if stamps.orders.orders_print_modal.print_options.hide_postage_value.checked?
  end
  expect(stamps.orders.orders_print_modal.print_options.hide_postage_value.checked?).to be(true)
end

Then /^[Ii]n [Pp]rint modal, check Email Tracking Details to Recipients$/ do
  stamps.orders.orders_print_modal.print_options.email_tracking.check
end

Then /^[Ii]n [Pp]rint modal, uncheck Email Tracking Details to Recipients$/ do
  stamps.orders.orders_print_modal.print_options.email_tracking.uncheck
end

Then /^[Ii]n [Pp]rint modal, uncheck [Pp]rint Reference # on Shipping Label$/ do
  stamps.orders.orders_print_modal.print_options.print_reference_no.uncheck
end

Then /^[Ii]n [Pp]rint modal, check [Pp]rint Reference # on Shipping Label$/ do
  stamps.orders.orders_print_modal.print_options.print_reference_no.check
end

When /^[Ss]elect [Pp]rint [Mm]odal left-side label$/ do
  stamps.orders.orders_print_modal.starting_label.select_left_label
end

When /^[Ss]elect [Pp]rint [Mm]odal right-side label$/ do
  stamps.orders.orders_print_modal.starting_label.select_right_label
end

Then /^[Ee]xpect [Pp]rint [Mm]odal right-side label is selected$/ do
  expect(stamps.orders.orders_print_modal.starting_label.right_selected?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Mm]odal left-side label is selected$/ do
  expect(stamps.orders.orders_print_modal.starting_label.left_selected?).to be(true)
end

Then /^[Ss]et [\w]rint [Mm]odal [Pp]rint-On to \"(.*)\"$/ do |expectation|
  stamps.orders.orders_print_modal.printing_on.select(expectation)
end

Then /^[Ee]xpect [Pp]rint [Mm]odal [Pp]rinting On Label is (.*)$/ do |expectation|
  expect(stamps.orders.orders_print_modal.printing_on.label.text).to eql expectation
end

Then /^[Ss]elect [Pp]rinter \"(.*)\"$/ do |printer|
  step "Orders print modal printer dropdown is present"
  stamps.orders.orders_print_modal.printer.select(printer)
end

Then /^Close Reprint Modal$/ do
  stamps.orders.orders_toolbar.reprint.close
end

Then /^[\w]lose Label Unavailable Modal$/ do
  stamps.orders.orders_toolbar.ok.close
end

Then /^[Pp]rint expecting error (.*)$/ do |error_message|
  modal=stamps.orders.orders_print_modal.print_expecting_error
  actual=modal.error_message
  modal.ok
  expect(actual).to include error_message
end

Then /^[Pp]rint expecting (.*) selected orders have errors and cannot be printed. To print the remaining orders, click Continue.$/ do |error_message|
  modal=stamps.orders.orders_print_modal.print_expecting_error
  actual=modal.error_message
  modal.continue.print
  expect(actual).to eql "#{error_message} selected orders have errors and cannot be printed.\nTo mail the remaining orders, click Continue."
end

Then /^[Pp]rint expecting invalid address error$/ do
  stamps.orders.orders_print_modal.print_invalid_address.close
end

When /^[Pp]rint expecting rating error$/ do
  modal=stamps.orders.orders_print_modal.print_expecting_rating_error
  actual=modal.error_message
  modal.close
  expect(actual).to include "An error occurred while attempting to rate your mail"
end

When /^[Pp]rint expecting some orders can not be printed$/ do
  modal=stamps.orders.orders_print_modal.print_expecting_error
  actual=modal.error_message
  modal.continue.print
  expect(actual).to include "To mail the remaining orders, click Continue"
end

Then /^[Ee]xpect [Pp]rint [Mm]odal Title is \"You have (.*) label\(s\) ready to print\"$/ do |expectation|
  actual=stamps.orders.orders_print_modal.label_count
  stamps.orders.orders_print_modal.close
  expect("You have #{actual} label(s) ready to mail").to eql("You have #{expectation} label(s) ready to mail")
end

Then /^[Ee]xpect [Pp]rint [Mm]odal number of required label sheets is (\d+)$/ do |sheets|
  expect(stamps.orders.orders_print_modal.label_count).to eql(sheets.to_i)
end

Then /^[Pp]rint raises a [Pp]rinting Error/ do
  expect(stamps.orders.print.print_sample_expecting_error).to raise_error(PrintingError)
end

Then /^[Ii]n [Pp]rint modal, click [Pp]rint button Sample$/ do
  stamps.orders.orders_print_modal.print_sample
end

Then /^[Ii]n [Pp]rint modal, click [Pp]rint button Sample raises a [Pp]rinting Error/ do
  expect(stamps.orders.orders_print_modal.print_sample_expecting_error).to raise_error(PrintingError)
end

Then /^[Ee]xpect (.*) pane selected$/ do |value|

end

Then /^[Ss]elect (.*) pane$/ do |value|

end



