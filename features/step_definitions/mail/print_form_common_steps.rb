# encoding: utf-8
# These driver fields exists on all forms (i.e. Stamps, Envelopes, Shipping Label and Certified Mail)
Then /^[Ss]elect Print On (.*)$/ do |media|
  stamps.mail.print_on(TestData.store[:print_on]=media)
end

Then /^[Bb]lur out on [Pp]rint [Ff]orm$/ do
  stamps.mail.print_form.blur_out
end

Then /^[Ss]et Print form Mail-From to (.*)$/ do |value|
  stamps.mail.print_form.mail_from.select(TestData.store[:ship_from]=value)
end

Then /^[Cc]heck Print form [Ee]mail [Tt]racking checkbox$/ do
  stamps.mail.print_form.email_tracking.email_checkbox.click
end

Then /^[Ss]et Print form [Pp]ounds to (\d+)$/ do |pounds|
  stamps.mail.print_form.weight.pounds.set(TestData.store[:pounds]=pounds)
end

Then /^[Ss]et Print form [Oo]unces to (\d+)$/ do |ounces|
  stamps.mail.print_form.weight.ounces.set(TestData.store[:ounces]=ounces)
end

Then /^[Ss]et Dimensions to length (\d+) width (\d+) height (\d+)$/ do |length, width, height|
  step "set Print form Length to #{length}"
  step "set Print form width to #{width}"
  step "set Print form height to #{height}"
end

# dimension expectations
Then /^[Ee]xpect Print form Length is (?:correct|(\d+))$/ do |str|
  expect(stamps.mail.print_form.dimensions.length.text.to_i).to eql(((str.nil?)?TestData.store[:length] : str).to_i)
end

Then /^[Ee]xpect Print form width is (?:correct|(\d+))$/ do |str|
  expect(stamps.mail.print_form.dimensions.width.text.to_i).to eql(((str.nil?)?TestData.store[:width] : str).to_i)
end

Then /^[Ee]xpect Print form height is (?:correct|(\d+))$/ do |str|
  expect(stamps.mail.print_form.dimensions.height.text.to_i).to eql(((str.nil?)?TestData.store[:height] : str).to_i)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Ss]ervice (.*) is not present in dropdown list$/ do |service|
  expect(stamps.mail.print_form.service.select_service(TestData.store[:service]=service).present?).to be(false)
end

Then /^[Ss]elect [Pp]rint [Ff]orm [Ss]ervice (.*)$/ do |str|
#  step "blur out on print form"
  stamps.mail.print_form.service.select_service(TestData.store[:service]=str)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Ss]ervice [Cc]ost [Ff]or (.*) is (.*)$/ do |service, cost|
  step "blur out on print form"
  stamps.mail.print_form.service.service_cost(TestData.store[:service]=service).to eql("$#{cost}")
end

When /^[Pp]rint [Ll]abel$/ do
  stamps.mail.mail_toolbar.print_label
end

When /^[Cc]lick Print Sample button on Print form$/ do
  @print_window=stamps.mail.mail_toolbar.print_sample
end

When /^[Ss]elect on [Pp]rint [Pp]review [Pp]anel, [Ll]eft side starting label$/ do
  stamps.mail.print_preview.select_left_label
end

Then /^[Ee]xpect on [Pp]rint [Pp]review [Pp]anel, left side label is selected$/ do
  expect(stamps.mail.print_preview.left_selected?).to be(true), "Left Label image doesn't exists on Print form"
end

When /^[Ss]elect on [Pp]rint [Pp]review [Pp]anel, [Rr]ight side starting label$/ do
  stamps.mail.print_preview.select_right_label
end

Then /^[Ee]xpect on [Pp]rint [Pp]review [Pp]anel, right side label is selected$/ do
  expect(stamps.mail.print_preview.right_selected?).to be(true), "Right Label image doesn't exists on Print form"
end

Then /^[Ss]et Print form [Mm]ail-[Tt]o [Cc]ountry to (.*)$/ do |country|
  20.times do # work around for rating problem
    stamps.mail.print_form.mail_to.mail_to_country.select_country(TestData.store[:country]=country)
    break if stamps.mail.print_form.mail_to.mail_to_country.textbox.text.include?(TestData.store[:country]) && stamps.mail.print_form.service.has_rates?
  end
  expect(stamps.mail.print_form.service).to be_has_rates, "Mail service list of values does not have rates."
  expect(stamps.mail.print_form.mail_to.mail_to_country.textbox.text).to eql(TestData.store[:country])
end

Then /^[Ss]ave Print Form Total Cost$/ do
  TestData.store[:total_ship_cost]=stamps.mail.mail_toolbar.total
end

Then /^[Ss]ave Print Form Mail From$/ do
  TestData.store[:ship_from]=stamps.mail.print_form.mail_from.textbox.text
end

Then /^[Cc]lick on [Bb]uy [Mm]ore [Ll]abels link$/ do
  stamps.mail.print_preview.buy_more_labels.link.click
end

#AB_ORDERSAUTO_3516
Then /^[Ee]xpect Print form service is empty$/ do
  expect(stamps.mail.print_form.service.textbox.text).eql?("")
end



