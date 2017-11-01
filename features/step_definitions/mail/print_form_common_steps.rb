# encoding: utf-8

# These browser elements exists on all forms (i.e. Stamps, Envelopes, Shipping Label and Certified Mail)
Then /^[Ss]elect Print On (.*)$/ do |media|
  expect(data_for(:mail_print_media, {})[test_param[:print_on] = media]).to_not be_nil, "\"#{test_param[:print_on]}\" is not a valid Print media. Valid options are:\n#{data_for(:mail_print_media, {}).keys}"
  expect(stamps.mail.print_on(test_param[:print_on])).to_not be_nil, "Unable to select Print media #{test_param[:print_on]}. Check your test."
end

Then /^[Bb]lur out on [Pp]rint [Ff]orm$/ do
  stamps.mail.print_form.blur_out
end

Then /^[Ss]et Print form Mail-From to (.*)$/ do |value|
  test_param[:ship_from] = value
  stamps.mail.print_form.mail_from.select(test_param[:ship_from])
end

Then /^[Ss]et Print form [Pp]ounds to (\d+)$/ do |pounds|
  test_param[:pounds] = pounds
  stamps.mail.print_form.mail_weight.mail_pounds.set(test_param[:pounds])
end

Then /^[Ss]et Print form [Oo]unces to (\d+)$/ do |ounces|
  test_param[:ounces] = ounces
  stamps.mail.print_form.mail_weight.mail_ounces.set(test_param[:ounces])
end

Then /^[Ss]et Dimensions to length (\d+) width (\d+) height (\d+)$/ do |length, width, height|
  step "set Print form Length to #{length}"
  step "set Print form width to #{width}"
  step "set Print form height to #{height}"
end

# dimension expectations
Then /^[Ee]xpect Print form Length is (?:correct|(\d+))$/ do |length|
  length = test_param[:length] if length.nil?
  expect(stamps.mail.print_form.dimensions.length.text.to_i).to eql(length.to_i)
end

Then /^[Ee]xpect Print form width is (?:correct|(\d+))$/ do |width|
  width = test_param[:width] if width.nil?
  expect(stamps.mail.print_form.dimensions.width.text.to_i).to eql(width.to_i)
end

Then /^[Ee]xpect Print form height is (?:correct|(\d+))$/ do |height|
  height = test_param[:height] if height.nil?
  expect(stamps.mail.print_form.dimensions.height.text.to_i).to eql(height.to_i)
end

Then /^[Ss]elect Print form [Ss]ervice (.*)$/ do |service|
  test_param[:service] = service
  step "blur out on print form"
  stamps.mail.print_form.mail_service.select(test_param[:service])
end

When /^[Pp]rint [Ll]abel$/ do
  stamps.mail.mail_toolbar.print_label
end

When /^[Cc]lick Print Sample button on Print form$/ do
  @print_window = stamps.mail.mail_toolbar.print_sample
end

Then /^[Cc]lick Search Contacts close button$/ do
  stamps.mail.print_form.mail_to.mail_to_link.click.close
end

Then /^[Ss]et Print form [Mm]ail-[Tt]o [Cc]ountry to (.*)$/ do |country|
  test_param[:country] = country
  test_config.logger.step "#{"#"*10} Desired Country: #{test_param[:country]}"
  step "blur out on print form"
  # work around for rating problem
  10.times do
    stamps.mail.print_form.mail_to.country(test_param[:country])
    sleep(0.25)
    break if stamps.mail.print_form.mail_to.mail_to_country.textbox.text.include?(test_param[:country]) && stamps.mail.print_form.mail_service.has_rates?
  end
  expect(stamps.mail.print_form.mail_to.mail_to_country.textbox.text).to include test_param[:country]
  step "blur out on print form"
end

Then /^[Ss]ave Print Form Total Cost$/ do
test_param[:total_ship_cost] = stamps.mail.mail_toolbar.total
end

Then /^[Ss]ave Print Form Mail From$/ do
  test_param[:ship_from] = stamps.mail.print_form.mail_from.textbox.text
end






