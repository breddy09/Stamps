
Then /^[Ee]xpect [Pp]rint [Ff]orm Print Media Tooltip is (.*)$/ do |selection|
  pending #stamps.mail.print_on.tooltip selection
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Print Media (.*) is disabled$/ do |selection|
  pending #stamps.mail.print_on.disabled? selection
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Print Media (.*) is enabled$/ do |selection|
  pending #stamps.mail.print_on.enabled? selection
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Ship-To address is (.*)$/ do |address|
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Pp]rint [Oo]n [Ff]ield is present$/ do
  pending #expect(stamps.mail.print_media.drop_down.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Mm]ail [Ff]rom Field is present$/ do
  pending
  #expect(stamps.mail.print_form.mail_from.textbox.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Mm]ail [Tt]o [Ll]ink is present$/ do
  pending #expect(stamps.mail.print_form.mail_to.mail_to_link.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Mm]ail [Tt]o [Cc]ountry [Ff]ield is present$/ do
  pending #expect(stamps.mail.print_form.mail_to.mail_to_country.dom_dd.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Ee]mail [Cc]heck [Bb]ox is present$/ do
  pending #expect(stamps.mail.print_form.email_tracking.email_checkbox.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Ee]mail [Ff]ield is present$/ do
  pending #expect(stamps.mail.print_form.email_tracking.email_textbox.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Pp]ounds [Ff]ield is present$/ do
  pending #expect(stamps.mail.print_form.weight.pounds.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Oo]unces [Ff]ield is present$/ do
  pending #expect(stamps.mail.print_form.weight.ounces.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Ww]eigh [Bb]utton is present$/ do
  pending #expect(stamps.mail.print_form.weight.weigh.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Auto Weigh check box is present$/ do
  pending #expect(stamps.mail.print_form.weight.auto_weigh.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Ss]ervice [Ff]ield is present$/ do
  pending #expect(stamps.mail.print_form.service.textbox.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Ss]ervice [Pp]rice is present$/ do
  pending #expect(stamps.mail.print_form.service.price.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Insure For Field is present$/ do
  pending #expect(stamps.mail.print_form.insure_for.insure_for_amt.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Insure For Price is present$/ do
  pending #expect(stamps.mail.print_form.insure_for.price.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Tracking Field is present$/ do
  pending #expect(stamps.mail.print_form.tracking.textbox.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Tracking Price is present$/ do
  pending #expect(stamps.mail.print_form.tracking.price.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Label Image Preview is present$/ do
  pending #stamps.mail.print_form.advanced_options.print_receipt.check
  #expect(pending #stamps.mail.print_preview.outer_image_preview.left_image_preview.present?).to be(true)
  #expect(stamps.mail.print_preview.inner_image_preview.right_image_preview.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Hide Mail Value check box is present$/ do
  pending #expect(stamps.mail.print_form.advanced_options.hide_label_value.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Print Receipt check box is present$/ do
  pending #expect(stamps.mail.print_form.advanced_options.print_receipt.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Print Reference Number check box is present$/ do
  pending #expect(stamps.mail.print_form.advanced_options.print_reference_number.present?).to be(true)
end


Then /^[Ee]xpect [Pp]rint [Ff]orm [Tt]oolbar [Mm]enu Reset Button is present$/ do
  pending #expect(stamps.mail.toolbar_menu.reset_fields.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Tt]oolbar [Mm]enu Settings Button is present$/ do
  pending #expect(stamps.mail.toolbar_menu.settings.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Tt]oolbar [Mm]enu Feedback Button is present$/ do
  pending #expect(stamps.mail.toolbar_menu.feedback.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Mail Total is present$/ do
  pending #expect(stamps.mail.mail_toolbar.total.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm Print Sample Button is present$/ do
  pending #expect(stamps.mail.mail_toolbar.sample_button.present?).to be(true)
end

Then /^[Ee]xpect Print form Print Button is present$/ do
  pending #expect(stamps.mail.mail_toolbar.print_button.present?).to be(true)
end