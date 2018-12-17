Then /^expect print details on history is present$/ do
  step 'wait while loading history details panel'
  expect(SdcHistory.details.header.title).to be_present
end

Then /^expect return to on history print details contain (.*)$/ do |str|
  expect(SdcHistory.details.addresses.return_to.text_value).to include(str)
end

Then /^wait while loading history details panel$/ do
  SdcHistory.details.loading.safe_wait_until_present(timeout: 8)
  SdcHistory.details.loading.wait_while_present(timeout: 240)
end

# Addresses
Then /^expect address shipped to in history transaction details displayed (?:correct|(.*))$/ do |address|
  shipped_address = SdcHistory.details.addresses
  shipped_address.shipped_to.flash
  address ||= TestData.hash[:address]
  if TestData.hash[:email_tracking].nil?
    total_address =  address
  else
    total_address =  address + "\n" + TestData.hash[:email_tracking]
  end
  #total_address =  address + "\n" + TestData.hash[:email_tracking]
  #expect(shipped_address.shipped_to.text_value). to eql(total_address)
  address_arr = address.split("\n")
  address_lines_count = address_arr.length
  total_address_arr = total_address.split("\n")
  if address_lines_count.to_i.eql? 6
    #remove department value from the address array
    total_address_arr.delete(total_address_arr[2])
    expect(shipped_address.shipped_to.text_value.split("\n")). to eql(total_address_arr)
  else
    expect(shipped_address.shipped_to.text_value). to eql(total_address)
  end
end


Then /^expect address shipped to contains (\d+) lines$/ do |lines|
  shipped_address = SdcHistory.details.addresses
  address = shipped_address.shipped_to.text_value
  address = address.split("\n")
  address_lines_count = address.length
  expect(address_lines_count.to_i). to eql(lines.to_i)
  SdcLogger.info "Shipped to address contains #{address_lines_count} lines"
end

Then /^set search prints tracking number on history filter panel to (?:newly added|(.*))$/ do |str|
  search =  SdcHistory.filter_panel.search
  search.search_prints.safe_wait_until_present(timeout: 10)
  str ||= TestData.hash[:tracking_number]
  search.search_prints.set(str)
end

# Header Menu

Then /^click transaction details header menu dropdown$/ do
  history_detail = SdcHistory.details.header
  history_detail.toolbar_menu.safe_wait_until_present(timeout: 10)
  history_detail.toolbar_menu.click
end

Then /^expect email tracking info link on the transaction detail menu dropdown is available$/ do
  history_detail = SdcHistory.details.header
  history_detail.email_tracking_info.flash
  expect(history_detail.email_tracking_info.present?).to be true
end

Then /^click email tracking info link on transaction detail menu dropdown$/ do
  history_detail = SdcHistory.details.header
  history_detail.email_tracking_info.safe_wait_until_present(timeout: 10)
  history_detail.email_tracking_info.click
end

Then /^expect print receipt link on the transaction detail menu dropdown is available$/ do
  history_detail = SdcHistory.details.header
  history_detail.print_receipt.flash
  expect(history_detail.print_receipt.present?).to be true
end

Then /^click print receipt link on transaction detail menu dropdown$/ do
  history_detail = SdcHistory.details.header
  history_detail.print_receipt.safe_wait_until_present(timeout: 10)
  history_detail.print_receipt.click
  sleep 3
end

Then /^expect create return label link on the transaction detail menu dropdown is available$/ do
  history_detail = SdcHistory.details.header
  history_detail.create_return_label.flash
  expect(history_detail.create_return_label.present?).to be true
end

Then /^expect track on usps.com link on the transaction detail menu dropdown is available$/ do
  history_detail = SdcHistory.details.header
  history_detail.track_on_usps.flash
  expect(history_detail.track_on_usps.present?).to be true
end

Then /^expect file claim link on the transaction detail menu dropdown is available$/ do
  history_detail = SdcHistory.details.header
  history_detail.file_claim.flash
  expect(history_detail.file_claim.present?).to be true
end

Then /^expect file claim link on the transaction detail menu dropdown is not available$/ do
  history_detail = SdcHistory.details.header
  expect(history_detail.file_claim.present?).to be false
end

Then /^click file claim link on transaction detail menu dropdown$/ do
  history_detail = SdcHistory.details.header
  history_detail.file_claim.safe_wait_until_present(timeout: 10)
  history_detail.file_claim.click
  step 'expect insurance claim form modal is displayed'
end

Then /^expect collapse panel link on the transaction detail menu dropdown is available$/ do
  history_detail = SdcHistory.details.header
  history_detail.collapse_panel.flash
  expect(history_detail.collapse_panel.present?).to be true
end

# info steps

Then /^expect printed status on history transaction details is present$/ do
  step 'wait while loading history details panel'
  SdcHistory.details.status.flash
  expect(SdcHistory.details.status).to be_present
end

Then /^expect tracking number on history transaction details is (?:correct|(.*))$/ do |tracking_number|
  tracking = SdcHistory.details.tracking_number
  tracking_number ||= TestData.hash[:tracking_number]
  tracking.flash
  expect(tracking.text_value.to_s). to eql(tracking_number.to_s)
end

Then /^except create return label on history transaction details is enabled$/ do
  return_label = SdcHistory.details.create_return_label
  return_label.scroll_into_view
  return_label.flash
  expect(return_label.attribute_value('class').include?('disabled')).to be false
end

Then /^expect file claim link on the transaction detail panel is available$/ do
  history_detail = SdcHistory.details
  history_detail.file_claim.flash
  expect(history_detail.file_claim.present?).to be true
end

Then /^expect file claim link on the transaction detail panel is enabled$/ do
  history_detail = SdcHistory.details
  expect(history_detail.file_claim.enabled?).to be true
end

Then /^expect printed status on history transaction details is not present$/ do
  expect(SdcHistory.details.status).not_to be_present
end

Then /^expect file claim link on the transaction detail panel is not available$/ do
  history_detail = SdcHistory.details
  history_detail.file_claim.flash
  expect(history_detail.file_claim.present?).to be false
end

Then /^except create return label on history transaction details is disabled$/ do
  return_label = SdcHistory.details.create_return_label
  return_label.scroll_into_view
  expect(return_label.attribute_value('class').include?('disabled')).to be true
end

Then /^expect transaction details for single print is available$/ do
  step 'wait while loading history details panel'
  expect(SdcHistory.details.header.title).to be_present
end

Then /^expect address shipped to in history transaction details displays as (?:default|(.*))$/ do |shipped_address|
  address = SdcHistory.details.addresses
  # shipped_address||= TestData.hash[:username]
  shipped_address ||= TestData.hash[:mail_from_address]
  shipped_address = shipped_address.split(' ')
  expect(address.shipped_to.text_value.to_s.include?(shipped_address[0].to_s)).to be true
end

Then /^expect return to address on history transaction details displayed (?:correct|(.*))$/ do |address|
  return_to = SdcHistory.details.addresses.return_to
  return_to.flash
  address ||= TestData.hash[:address]
  address_arr = address.split("\n")
  address_lines_count = address_arr.length
  if address_lines_count.to_i.eql? 6
    address_arr.delete(address_arr[2])
    expect(return_to.text_value.split("\n")). to eql(address_arr)
  else
    expect(return_to.text_value). to eql(TestData.hash[:address])
  end
end

Then /^expect return to address on history transaction details is (?:default|(.*))$/ do |return_address|
  return_to = SdcHistory.details.addresses.return_to
  return_to.flash
  # return_address ||= TestData.hash[:username]
  return_address ||= TestData.hash[:mail_from_address]
  return_address = return_address.split(' ')
  expect(return_to.text_value.to_s.include?(return_address[0].to_s)).to be true
end

Then /^expect services is present on history transaction details$/ do
  services =  SdcHistory.details.services
  services.title.safe_wait_until_present(timeout: 10)
  services.title.flash
  services.title.scroll_into_view
  expect(services.title).to be_present
end

Then /^expect price on services history transaction details is (?:correct|(.*))$/ do |price|
  service = SdcHistory.details.services
  price ||= TestData.hash[:service_price]
  service.service_price.flash
  service.service_price.scroll_into_view
  expect(service.service_price.text_value.to_f).to equal(price.to_f)
end

Then /^expect service total on history transaction details is (?:correct|(.*))$/ do |service_total|
  service = SdcHistory.details.services
  service.price.flash
  service.price.scroll_into_view
  p 'nil value'
  p TestData.hash[:insure_for].nil?
  if TestData.hash[:insure_for].nil? && TestData.hash[:tracking].to_s. eql?('USPS Tracking')
    expect(service.price.text_value.to_f).to equal(service.service_price.text_value.to_f)
  elsif TestData.hash[:tracking].to_s. eql?('USPS Tracking') && TestData.hash[:insure_for].nil?.to_s.casecmp('false').zero?
    service.file_claim_cost.flash
    expect(service.file_claim_cost).to be_present
    service_total ||= TestData.hash[:insure_for_extra_price].remove('$').to_f + TestData.hash[:service_price].remove('$').to_f
    expect(service.price.text_value.remove('$').to_f).to eq(service_total.to_f)
  elsif TestData.hash[:tracking].to_s. eql?('Signature Required') && TestData.hash[:insure_for].nil?.to_s.casecmp('false').zero?
    service.file_claim_cost.flash
    service.signature_cost.flash
    expect(service.signature_cost).to be_present
    service_total ||= TestData.hash[:insure_for_extra_price].remove('$').to_f + TestData.hash['service_price'].remove('$').to_f + TestData.hash[:tracking_cost].remove('$').to_f
    expect(service.price.text_value.remove('$').to_f).to eq(service_total.to_f.ceil(2))
  end
end

Then /^expect carrier on services history transaction details is (?:correct|(.*))$/ do |carrier|
  service = SdcHistory.details.services
  # noinspection RubyUnusedLocalVariable
  carrier ||= TestData.hash[:tracking]
  service.carrier.flash
  service.carrier.scroll_into_view
  expect(service.carrier.text_value).to eq('USPS')
end

Then /^expect service on services history transaction details is (?:correct|(.*))$/ do |service|
  services =  SdcHistory.details.services
  service ||= TestData.hash[:service]
  service = service.split(' ')
  service_names = data_for(:mail_abbrevations, {})
  service_value = service_names[service[0]]
  services.service.scroll_into_view
 if service_value. eql?('First Class Mail International')
   expect(services.service.text_value.include?('First Class International')).to be true
   else
   expect(services.service.text_value.include?(service_value)).to be true
 end
end

Then /^expect packaging on services history transaction details is (?:correct|(.*))$/ do |service|
  services =  SdcHistory.details.services
  service ||= TestData.hash[:service]
  service = service.split(' ')
  services.packaging.flash
  services.packaging.scroll_into_view
  expect(services.packaging.text_value.include?(service[1])).to be true
end

Then /^expect weight on services history transaction details is (?:correct|(.*))$/ do |weight|
  service =  SdcHistory.details.services
  weight ||= TestData.hash[:lbs].to_s + ' lbs. ' + TestData.hash[:oz].to_s + ' oz.'
  service.weight.flash
  service.weight.scroll_into_view
  expect(service.weight.text_value).to eq(weight.remove('.0'))
end

Then /^expect tracking on services history transaction details is (?:correct|(.*))$/ do |tracking|
  service = SdcHistory.details.services
  tracking ||= TestData.hash[:tracking]

  if tracking. eql?('USPS Tracking')
    service.tracking.flash
    service.tracking.scroll_into_view
    expect(service.tracking.text_value).to include(tracking)
  else
    service.tracking_signature.flash
    service.tracking_signature.scroll_into_view
    expect(service.tracking_signature.text_value).to include('Electronic Signature Confirmation')
  end
end

Then /^expect insurance on services history transaction details is (?:correct|(.*))$/ do |insurance|
  service = SdcHistory.details.services
  insurance ||= TestData.hash[:insure_for]
  service.insurance.flash
  service.insurance.scroll_into_view
  expect(service.insurance.text_value.to_s).to eq('$' + insurance.to_s)
end

Then /^expect reference on history transaction details is (?:correct|(.*))$/ do |reference|
  details = SdcHistory.details.reference
  reference ||= TestData.hash[:reference_number]
  details.reference.flash
  details.reference.scroll_into_view
  expect(details.reference.text_value).to eq(reference)
end

Then /^expect cost code on history transaction details is (?:correct|(.*))$/ do |cost_code|
  details = SdcHistory.details.reference.cost_code
  cost_code ||= TestData.hash[:cost_code]
  details.text_field.flash
  expect(details.text_field.text_value).to eq(cost_code)
end

Then /^expect user on history transaction details is (?:correct|(.*))$/ do |user|
  details = SdcHistory.details.reference
  user ||= TestData.hash[:username]
  details.user.flash
  details.user.scroll_into_view
  expect(details.user.text_value.to_s.upcase).to eq(user.to_s.upcase)
end

Then /^expect email tracking info on history transaction details is disabled$/ do
  email = SdcHistory.details.email_tracking_info
  email.scroll_into_view
  expect(email.attribute_value('class').include?('disabled')).to be true
end

Then /^expect email tracking info on history transaction details is enabled$/ do
  email = SdcHistory.details.email_tracking_info
  email.scroll_into_view
  email.flash
  expect(email.attribute_value('class').include?('disabled')).to be false
end

Then /^expect customs information section on history transaction details is present$/ do
  customs_info = SdcHistory.details.customs_information
  customs_info.title.scroll_into_view
  customs_info.title.to be_present
end

Then /^expect package contents on customer information section of history transaction details is (?:correct|(.*))$/ do |package|
  customs_info = SdcHistory.details.customs_information
  package ||= TestData.hash[:customs_package_contents]
  customs_info.package_contents.scroll_into_view
  expect(customs_info.package_contents.text_value).to eq(package)
end

Then /^expect non delivery information on customer information section of history transaction details is (?:correct|(.*))$/ do |option|
  customs_info = SdcHistory.details.customs_information
  option ||= TestData.hash[:customs_non_delivery_options]
  customs_info.non_delivery.scroll_into_view
  expect(customs_info.non_delivery.text_value).to eq(option)
end

Then /^expect ITN on customer information section of history transaction details is (?:correct|(.*))$/ do |itn|
  customs_info = SdcHistory.details.customs_information
  itn ||=  TestData.hash[:customs_itn_no]
  customs_info.itn.scroll_into_view
  expect(customs_info.itn.text_value).to eq(itn)

end