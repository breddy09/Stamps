
Then /^expect ship-to country on mail is (?:correct|(.*))$/ do |str|
  str||=TestData.hash[:country]
  mail_to = SdcMail::SdcPrintForm::MailToContainer::MailTo.new
  actual_value = mail_to.dom_text_field
  expect(actual_value.text_value.to_s).to eql(str.to_s)
end

Then /^expect ship-to address on mail is (?:correct|(.*))$/ do |str|
    full_name||= TestData.hash[:full_name]
    company||= TestData.hash[:company]
    street_address||= TestData.hash[:street_address]
    city||= TestData.hash[:city]
    state||= TestData.hash[:state]
    postal_code||= TestData.hash[:postal_code]

  states = {
      "AA (Armed Forces)" => "AA", "AE (Armed Forces)" => "AE", "Alaska" => "AK","Alabama" => "AL", "AP (Armed Forces)" => "AP",
      "Arkansas" => "AR", "American Samoa" => "AS", "Arizona" => "AZ", "California" => "CA",  "Colorado" => "CO",
      "Connecticut" => "CT", "Dist. of Columbia" => "DC", "Delaware" => "DE", "Florida" => "FL", "Federated States Of Micronesia" => "FM",
      "Georgia" => "GA", "Guam" => "GU", "Hawaii" => "HI", "Iowa" => "IA", "Idaho" => "ID", "Illinois" => "IL",
      "Indiana" => "IN", "Kansas" => "KS", "Kentucky" => "KY", "Louisiana" => "LA", "Massachusetts" => "MA",
      "Maryland" => "MD", "Maine" => "ME", "Marshall Islands" => "MH", "Michigan" => "MI", "Minnesota" => "MN",
      "Missouri" => "MO", "Northern Mariana Islands" => "MP", "Mississippi" => "MS", "Montana" => "MT", "North Carolina" => "NC",
      "North Dakota" => "ND", "Nebraska" => "NE", "New Hampshire" => "NH", "New Jersey" => "NJ", "New Mexico" => "NM",
      "Nevada" => "NV", "New York" => "NY", "Ohio" => "OH", "Oklahoma" => "OK", "Oregon" => "OR",
      "Pennsylvania" => "PA", "Puerto Rico" => "PR", "Palau" => "PW", "Rhode Island" => "RI", "South Carolina" => "SC",
      "South Dakota" => "SD", "Tennessee" => "TN", "Texas" => "TX", "Utah" => "UT", "Virginia" => "VA", "Virgin Islands" => "VI",
      "Vermont" => "VT", "Washington" => "WA", "Wisconsin" => "WI", "West Virginia" => "WV", "Wyoming" => "WY"
  }
  state_abbver = states[state]
  address = "#{full_name}\n#{company}\n#{street_address}\n#{city}, #{state_abbver} #{postal_code}"
  mail_to = SdcMail::SdcPrintForm::MailToContainer::MailTo.new
  actual_value = mail_to.text_area
  expect(actual_value.text_value.to_s).to eql(address.to_s)
end

Then /^expect email on mail is (?:correct|(.*))$/ do |str|
  str||=TestData.hash[:email]
  email_obj = SdcMail::SdcPrintForm::EmailTrackingContainer::EmailTracking.new
  actual_value = email_obj.text_field
  expect(actual_value.text_value.to_s).to eql(str.to_s)
end

Then /^expect reference # on mail is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:reference_number]
  advanced_options = SdcMail::SdcPrintForm::AdvancedOptionsContainer::AdvancedOptions.new
  actual_value = advanced_options.reference_num
  expect(actual_value.text_value.to_s).to eql(str.to_s)
end

Then /^expect cost code on mail is (?:correct|(.*))$/ do |str|
    temp||= TestData.hash[:cost_code]
    if temp.eql? ""
      str  = "None"
    else
      str||= TestData.hash[:cost_code]
    end

  advanced_options = SdcMail::SdcPrintForm::AdvancedOptionsContainer::AdvancedOptionsCostCode.new
  actual_value = advanced_options.text_field
  expect(actual_value.text_value.to_s).to eql(str.to_s)
end