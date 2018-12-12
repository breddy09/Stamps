
Then /^set order details ship-to to(?: a |)(?: random address |)(?:to|in|between|) (.*)$/ do |str|
  step 'show order ship-to details'
  address = TestHelper.address_helper_zone(str)
  if address.is_a? Hash
    full_name = address[:full_name]
    company = address[:company]
    street_address1 = address[:street_address]
    street_address2 = address[:street_address2]
    city = address[:city]
    state = address[:state]
    zip = address[:zip]
    str = "#{full_name},#{company},#{street_address1},#{street_address2},#{city} #{state} #{zip}"
  end

  step "set order details ship-to text area to #{str}"
  step 'check for server error'
  TestData.hash[:ship_to_domestic] = address
end

Then /^add order details item (\d+), qty (\d+), id (.+), description (.*)$/ do |item, qty, id, description|
  step "add order details associated item #{item}"
  step "scroll into view order details associated item #{item}"
  step "set Order Details Associated Item #{item} qty to #{qty}"
  step "set Order Details Associated Item #{item} ID to #{id}"
  step "set Order Details Associated Item #{item} description to #{description}"
  step 'blur out on order details form'
  step 'check for server error'
end

Then /^add order details associated item (\d+)$/ do |item|
  order_details = SdcOrders.order_details
  order_details.add_item.safe_wait_until_present(timeout: 2)
  order_details.items_ordered.click unless order_details.add_item.present?
  order_details.add_item.scroll_into_view
  expect(order_details.add_item).to be_present
  order_details.add_item.click
end

Then /^scroll into view order details associated item (\d+)$/ do |item|
  associated_item = SdcOrders.order_details.associated_item
  associated_item.item_qty(item).scroll_into_view
  associated_item.description(item).scroll_into_view
  associated_item.id(item).scroll_into_view
end

Then /^[Ss]et [Oo]rder [Dd]etails Associated Item (\d+) qty to (.*)$/ do |item, qty|

  unless TestData.hash[:details_associated_items].has_key?(item)
    TestData.hash[:details_associated_items][item] = {}
  end
  SdcOrders.order_details.associated_item.item_qty(item).set(qty)
  TestData.hash[:details_associated_items][item][:item_qty] = qty.to_i
  TestData.hash[:items_ordered_qty] += qty.to_i
  step 'save order details data'
end

Then /^[Ss]et [Oo]rder [Dd]etails Associated Item (\d+) ID to (.*)$/ do |item, str|

  TestData.hash[:details_associated_items][item] = {} unless TestData.hash[:details_associated_items].has_key?(item)
  str = TestHelper.rand_alpha_numeric if str.downcase.include?('random')
  SdcOrders.order_details.associated_item.id(item).set(str)
  TestData.hash[:details_associated_items][item][:item_id] = str
  step 'save order details data'
end

Then /^[Ss]et [Oo]rder [Dd]etails Associated Item (\d+) description to (.*)$/ do |item, str|

  TestData.hash[:details_associated_items][item] = {} unless TestData.hash[:details_associated_items].has_key?(item)
  str = TestHelper.rand_alpha_numeric if str.downcase.include?('random')
  SdcOrders.order_details.associated_item.description(item).set(str)
  TestData.hash[:details_associated_items][item][:item_description] = str
  step 'save order details data'
end

Then /^set order details dimensions to length (\d+) width (\d+) height (\d+)$/ do |l, w, h|
  step "set order details length to #{l}"
  step "set order details width to #{w}"
  step "set order details height to #{h}"
end

Then /^[Oo]n [Oo]rder [Dd]etails form, Expand panel$/ do

  pending
  #stamps.orders.order_details.expand
end

Then /^[Oo]n [Oo]rder [Dd]etails form, Delete Item (\d+)$/ do |item|

  pending
  #item = stamps.orders.order_details.items_ordered.item item.to_i
  # item.delete.click
end

Then /^set order details weight to (\d+\.?\d*) lb (\d+\.?\d*) oz$/ do |lbs, oz|
  step "set order details pounds to #{lbs}"
  step "set order details ounces to #{oz}"
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o Country to a random country in PMEI Flat Rate price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMEI_flat_rate, {})['group' + group].values
  TestData.hash[:country] = country_list[rand(country_list.size)]
  SdcLogger.debug "#{"#" * 10} Desired Country: #{TestData.hash[:country]}"
  step "set order details domestic ship-to country to #{TestData.hash[:country]}"
end

Then /^set order details ship-to international address to$/ do |table|
  param = table.hashes.first
  country = param['country']
  full_name = param[:full_name]
  company = param[:company]
  street_address1 = param['street_address1']
  street_address2 = param[:street_address2]
  city = param[:city]
  province = param['province']
  postal_code = param['postal_code']
  phone = param[:phone]
  email = param[:email]

  full_name = full_name.downcase.include?('random') ? TestHelper.rand_full_name : full_name
  company = company.downcase.include?('random') ? TestHelper.rand_comp_name : company
  street_address1 = street_address1.downcase.include?('random') ? TestHelper.rand_alpha_numeric : street_address1
  street_address2 = street_address2.downcase.include?('random') ? TestHelper.rand_suite : street_address2
  city = city.downcase.include?('random') ? TestHelper.rand_alpha_numeric : city
  province = province.downcase.include?('random') ? TestHelper.rand_alpha_numeric : province
  postal_code = postal_code.downcase.include?('random') ? TestHelper.rand_alpha_numeric : postal_code
  phone = phone.downcase.include?('random') ? TestHelper.rand_phone : phone
  email = email.downcase.include?('random') ? TestHelper.rand_email : email

  step "set order details domestic ship-to country to #{country}"
  step "set order details international ship-to name to #{full_name}"
  step "set order details international ship-to company to #{company}"
  step "set order details international ship-to address 1 to #{street_address1}"
  step "set order details international ship-to address 2 to #{street_address2}"
  step "set order details international ship-to city to #{city}"
  step "set order details international ship-to province to #{province}"
  step "set order details international ship-to postal code to #{postal_code}"
  step "set order details international ship-to phone to #{phone}"
  step "set order details international ship-to email to #{email}"
end

Then /^set order details ship-to domestic address to$/ do |table|
  param = table.hashes.first
  country = param['country']
  full_name = param[:full_name]
  company = param[:company]
  street_address1 = param['street_address1']
  street_address2 = param[:street_address2]
  city = param[:city]
  state = param[:state]
  zip = param[:zip]
  phone = param[:phone]
  email = param[:email]

  full_name = full_name.downcase.include?('random') ? TestHelper.rand_full_name : full_name
  company = company.downcase.include?('random') ? TestHelper.rand_comp_name : company

  if street_address2 && street_address2.downcase.include?('random')
    street_address2 = TestHelper.rand_alpha_numeric(min: 2, max: 7)
  end

  if country.nil? || country.size.zero?
    country = 'United States'
  end

  if phone.nil? || phone.downcase.include?('random')
    phone = TestHelper.rand_phone
  end

  if email.nil? || email.downcase.include?('random')
    email = TestHelper.rand_email
  end
  ship_to = "#{full_name},#{company},#{street_address1},#{street_address2},#{city} #{state} #{zip}"

  step "set order details domestic ship-to country to #{country}"
  step 'check for server error'
  step "set order details ship-to text area to #{ship_to}"
  step "set order details phone to #{phone}"
  step "set order details email to #{email}"
  step 'check for server error'
  step 'hide order ship-to details'

  TestData.hash[:full_name] = full_name
  TestData.hash[:company] = company
  TestData.hash[:street_address1] = street_address1
  TestData.hash[:street_address2] = street_address2
  TestData.hash[:city] = city
  TestData.hash[:state] = state


  address = SdcOrders.order_details.ship_to.domestic.address.text_value
  result = TestHelper.address_str_to_hash(address)[:company]
  result
end

# order_id = TestData.hash[:order_id].values.last
# result = SdcGrid.grid_column(:phone).data(order_id)
Then /^set order details ship-to text area to (.*)$/ do |address|
  address = TestHelper.format_address(address)
  order_details = SdcOrders.order_details
  ship_to = order_details.ship_to
  step 'show order ship-to details'
  domestic = SdcOrders.order_details.ship_to.domestic
  3.times do
    domestic.address.set(address)
    order_details.weight_label.click if order_details.weight_label.present?
    break if ship_to.show_less.present?
    order_details.service_label.double_click if order_details.service_label.present?
    order_details.order_id.double_click if order_details.order_id.present?
    order_details.reference_no_label.double_click if order_details.reference_no_label.title.present?
    order_details.title.double_click if order_details.title.present?
    ship_to.show_less.safe_wait_until_present(timeout: 1)
    break if ship_to.show_less.present?
  end
  TestData.hash[:ship_to_domestic] = address
  step 'save order details data'
end

Then /^hide order ship-to details$/ do
  ship_to = SdcOrders.order_details.ship_to
  step 'blur out on order details form'
  ship_to.show_less.click if ship_to.show_less.present?
end

Then /^show order ship-to details$/ do
  ship_to = SdcOrders.order_details.ship_to
  ship_to.show_details.safe_wait_until_present(timeout: 2)
  ship_to.show_details.click if ship_to.show_details.present?
end

Then /^blur out on order details form$/ do
  order_details = SdcOrders.order_details
  order_details.reference_no_label.scroll_into_view
  order_details.reference_no_label.safe_double_click
  order_details.weight_label.scroll_into_view
  order_details.weight_label.click
  order_details.service_label.scroll_into_view
  order_details.service_label.safe_double_click
  order_details.order_id.scroll_into_view
  order_details.order_id.safe_double_click
  order_details.reference_no_label.scroll_into_view
  order_details.reference_no_label.safe_double_click
  order_details.title.scroll_into_view
  order_details.title.safe_double_click
  step 'check for server error'
end

Then /^set order details phone to (?:random|(.*))$/ do |str|
  step 'show order ship-to details'
  str ||= TestHelper.rand_phone
  SdcOrders.order_details.ship_to.domestic.phone.set(str)
  TestData.hash[:phone] = str
  step 'save order details data'
end

Then /^set order details email to (?:random|(.*))$/ do |str|
  step 'show order ship-to details'
  str ||= TestHelper.rand_email
  SdcOrders.order_details.ship_to.domestic.email.set(str)
  TestData.hash[:email] = str
  step 'save order details data'
end

Then /^expect order details ship-to phone is (?:correct|(.*))$/ do |str|
  step 'show order ship-to details'
  str ||= TestData.hash[:phone]
  domestic = SdcOrders.order_details.ship_to.domestic
  domestic.phone.scroll_into_view
  domestic.phone.wait_until_present(timeout: 10)
  result = domestic.phone.text_value
  expect(result).to eql(str)
end

Then /^expect order details ship-to email is (?:correct|(.*))$/ do |str|
  step 'show order ship-to details'
  str ||= TestData.hash[:email]
  domestic = SdcOrders.order_details.ship_to.domestic
  domestic.email.scroll_into_view
  domestic.email.wait_until_present(timeout: 10)
  result = domestic.email.text_value
  expect(result).to eql(str)
end

Then /^[Oo]n [Oo]rder [Dd]etails form, [Hh]ide [Ii]nternational [Ss]hip-[Tt]o fields$/ do

  pending
  #stamps.orders.order_details.ship_to.international.hide_ship_to_details
end

Then /^expect order details ship-to name is (?:correct|(.*))$/ do |str|
  step 'show order ship-to details'
  str ||= TestData.hash[:full_name]
  address = SdcOrders.order_details.ship_to.domestic.address.text_value
  result = TestHelper.address_str_to_hash(address)[:name]
  expect(result).to eql(str)
end

Then /^expect order details ship-to company name is (?:correct|(.*))$/ do |str|
  step 'show order ship-to details'
  str ||= TestData.hash[:company]
  domestic = SdcOrders.order_details.ship_to.domestic
  domestic.address.scroll_into_view
  domestic.address.wait_until_present(timeout: 10)
  address = domestic.address.text_value
  result = TestHelper.address_str_to_hash(address)[:company]
  expect(result).to eql(str)
end

Then /^expect order details ship-to cleansed street address is (.*)$/ do |str|
  step 'show order ship-to details'
  domestic = SdcOrders.order_details.ship_to.domestic
  domestic.address.scroll_into_view
  domestic.address.wait_until_present(timeout: 10)
  address = domestic.address.text_value
  result = TestHelper.address_str_to_hash(address)[:street]
  expect(result).to eql(str)
end

Then /^expect order details ship-to cleansed city is (.*)$/ do |str|
  step 'show order ship-to details'
  domestic = SdcOrders.order_details.ship_to.domestic
  domestic.address.scroll_into_view
  domestic.address.wait_until_present(timeout: 10)
  address = domestic.address.text_value
  result = TestHelper.address_str_to_hash(address)[:city]
  expect(result).to eql(str)
end

Then /^expect order details ship-to cleansed state is (.*)$/ do |str|
  step 'show order ship-to details'
  domestic = SdcOrders.order_details.ship_to.domestic
  domestic.address.scroll_into_view
  domestic.address.wait_until_present(timeout: 10)
  address = domestic.address.text_value
  result = TestHelper.address_str_to_hash(address)[:state]
  expect(result).to eql(str)
end

Then /^expect order details ship-to cleansed zip plus 4 code is (.*)$/ do |str|
  step 'show order ship-to details'
  domestic = SdcOrders.order_details.ship_to.domestic
  domestic.address.scroll_into_view
  domestic.address.wait_until_present(timeout: 10)
  address = domestic.address.text_value
  result = TestHelper.address_str_to_hash(address)[:zip_full]
  expect(result).to eql(str)
end

Then /^expect order details ship-to cleansed zip code is (.*)$/ do |str|
  step 'show order ship-to details'
  domestic = SdcOrders.order_details.ship_to.domestic
  domestic.address.scroll_into_view
  domestic.address.wait_until_present(timeout: 10)
  address = domestic.address.text_value
  result = TestHelper.address_str_to_hash(address)[:zip]
  expect(result).to eql(str)
end

Then /^set order details service to (.*)$/ do |str|
  key = str.split(' ').first
  grid_service = TestData.hash[:service_look_up][key]
  TestData.hash[:grid_service] = grid_service
  order_details = SdcOrders.order_details
  service = order_details.service
  service.selection(name: :selection_element, str: str)
  service.text_field.scroll_into_view
  service.drop_down.scroll_into_view
  service.drop_down.click
  service.drop_down.click unless service.selection_element.present?
  service.selection_element.click unless service.selection_element.class_disabled?
  expect(service.text_field.text_value).to include(str)
  service.wait_until(timeout: 15) { service.cost.text_value.parse_digits.to_f.round(2) > 0 }
  step 'check for server error'
  step 'save order details data'
  TestData.hash[:service] = str
end

Then /^set order details pounds to (.+)$/ do |str|
  order_details = SdcOrders.order_details
  weight = order_details.weight
  weight.lbs.set(str)
  TestData.hash[:pounds] = str
  step 'save order details data'
end

Then /^set order details ounces to (.+)$/ do |str|
  order_details = SdcOrders.order_details
  weight = order_details.weight
  weight.oz.set(str)
  TestData.hash[:ounces] = str
  step 'save order details data'
end

Then /^set order details ounces to (.+) by arrows$/ do |val|
  oz = SdcOrders.order_details.weight.oz
  iterations = val.to_i - oz.text_value.to_i
  iterations.abs.times do oz.increment.click end if iterations > 0
  iterations.abs.times do oz.decrement.click end if iterations < 0
  step "expect order details ounces is #{val.to_i}"
  TestData.hash[:ounces] = oz.text_value
  step 'save order details data'
end

Then /^set order details length to (\d*)$/ do |str|
  order_details = SdcOrders.order_details
  dimensions = order_details.dimensions
  dimensions.length.wait_until_present(timeout: 10)
  dimensions.length.set(str)
  expect(dimensions.length.text_value).to eql str
  TestData.hash[:length] = str
  step 'save order details data'
end

Then /^set order details width to (\d*)$/ do |str|
  order_details = SdcOrders.order_details
  dimensions = order_details.dimensions
  dimensions.width.wait_until_present(timeout: 10)
  dimensions.width.set(str)
  expect(dimensions.width.text_value).to eql str
  TestData.hash[:width] = str
  step 'save order details data'
end

Then /^set order details height to (\d*)$/ do |str|
  order_details = SdcOrders.order_details
  dimensions = order_details.dimensions
  dimensions.height.wait_until_present(timeout: 10)
  dimensions.height.set(str)
  expect(dimensions.height.text_value).to eql str
  TestData.hash[:height] = str
  step 'save order details data'
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]ervice is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:service]
  result = SdcOrders.order_details.service.text_field.text_value
  expect(result).to include(str)
end

Then /^expect order details international service is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:int_service]
  result = SdcOrders.order_details.service.text_field.text_value
  expect(result).to include(str)
  step 'save order details data'
end

Then /^set order details domestic ship-to country to (.*)$/ do |str|
  step 'show order ship-to details'
  country = SdcOrders.order_details.ship_to.domestic.country
  3.times do
    country.text_field.set str
    country.text_field.set str
    country.text_field.send_keys :enter
    step 'blur out on order details form'
    country.text_field.scroll_into_view
    break if country.text_field.text_value.eql? str
  end
  expect(country.text_field.text_value).to eql str
  TestData.hash[:country] = str
end

Then /^set order details international ship-to country to a random country in (.*) price group (.*)$/ do |str, number|
  group = case str
    when /PMI/
      :country_groups_PMI
    when /PMEI/
      :country_groups_PMEI
    when /PMI Flat Rate/
      :country_groups_PMI_flat_rate
    when /PMEI Flat Rate/
      :country_groups_PMEI_flat_rate
  end
  country_list = data_for(group, {})["group" + number].values
  TestData.hash[:country] = country_list[rand(country_list.size)].sub!(/\|.*$/, '')
  # return if SdcOrders.order_details.ship_to.international.country.text_field.text_value.eql?(TestData.hash[:country])
  step "set order details international ship-to country to #{TestData.hash[:country]}" unless
      SdcOrders.order_details.ship_to.international.country.text_field.text_value.eql?(TestData.hash[:country])
end

Then /^set order details international ship-to country to (.*)$/ do |str|
  step 'show order ship-to details'
  country = SdcOrders.order_details.ship_to.international.country
  country.drop_down.click
  selection = country.selection(str)
  selection.scroll_into_view
  selection.click
  actual_result = country.text_field.text_value
  expect(actual_result).to eql str
  TestData.hash[:country] = str
end

Then /^set order details international ship-to name to (.*)$/ do |str|
  str = TestHelper.rand_full_name if str.downcase.include?('random')
  international = SdcOrders.order_details.ship_to.international
  international.name.wait_until_present(timeout: 5)
  international.name.send_keys(:enter)
  international.name.send_keys(:tab)
  international.name.set(str)
  international.name.click
  TestData.hash[:full_name] = str
end

Then /^set order details international ship-to company to (.*)$/ do |str|
  str = TestHelper.rand_full_name if str.downcase.include?('random')
  international = SdcOrders.order_details.ship_to.international
  international.company.wait_until_present(timeout: 2)
  international.company.send_keys(:enter)
  international.company.send_keys(:tab)
  international.company.set(str)
  international.company.click
  TestData.hash[:company] = str
end

Then /^set order details international ship-to address 1 to (.*)$/ do |str|
  str = TestHelper.rand_full_name if str.downcase.include?('random')
  international = SdcOrders.order_details.ship_to.international
  international.address1.wait_until_present(timeout: 2)
  international.address1.send_keys(:enter)
  international.address1.send_keys(:tab)
  international.address1.set(str)
  international.address1.click
  TestData.hash[:street_address1] = str
end

Then /^set order details international ship-to address 2 to (.*)$/ do |str|
  str = TestHelper.rand_full_name if str.downcase.include?('random')
  international = SdcOrders.order_details.ship_to.international
  international.address2.wait_until_present(timeout: 2)
  international.address2.send_keys(:enter)
  international.address2.send_keys(:tab)
  international.address2.set(str)
  international.address2.click
  TestData.hash[:street_address2] = str
end

Then /^set order details international ship-to city to (.*)$/ do |str|
  str = TestHelper.rand_full_name if str.downcase.include?('random')
  international = SdcOrders.order_details.ship_to.international
  international.city.wait_until_present(timeout: 2)
  international.city.send_keys(:enter)
  international.city.send_keys(:tab)
  international.city.set(str)
  international.city.click
  TestData.hash[:city] = str
end

Then /^set order details international ship-to province to (.*)$/ do |str|
  str = TestHelper.rand_full_name if str.downcase.include?('random')
  international = SdcOrders.order_details.ship_to.international
  international.province.wait_until_present(timeout: 2)
  international.province.send_keys(:enter)
  international.province.send_keys(:tab)
  international.province.set(str)
  international.province.click
  TestData.hash[:province] = str
end

Then /^set order details international ship-to postal code to (.*)$/ do |str|
  str = TestHelper.rand_full_name if str.downcase.include?('random')
  international = SdcOrders.order_details.ship_to.international
  international.postal_code.wait_until_present(timeout: 2)
  international.postal_code.send_keys(:enter)
  international.postal_code.send_keys(:tab)
  international.postal_code.set(str)
  international.postal_code.click
  TestData.hash[:postal_code] = str
end

Then /^set order details international ship-to phone to (.*)$/ do |str|
  str = TestHelper.rand_full_name if str.downcase.include?('random')
  step 'show order ship-to details'
  international = SdcOrders.order_details.ship_to.international
  international.phone.wait_until_present(timeout: 2)
  international.phone.send_keys(:enter)
  international.phone.send_keys(:tab)
  international.phone.set(str)
  international.phone.click
  TestData.hash[:phone] = str
end

Then /^set order details international ship-to email to (.*)$/ do |str|
  str = TestHelper.rand_full_name if str.downcase.include?('random')
  step 'show order ship-to details'
  international = SdcOrders.order_details.ship_to.international
  international.email.wait_until_present(timeout: 2)
  international.email.send_keys(:enter)
  international.email.send_keys(:tab)
  international.email.set(str)
  TestData.hash[:email] = str
end

Then /^check order details insure-for checkbox$/ do
  SdcOrders.order_details.insure_for.checkbox.check
end

Then /^uncheck order details insure-for checkbox$/ do

  pending
  #  stamps.orders.order_details.insure_for.checkbox.uncheck
end

Then /^set order details insure-for to (\d+\.\d{2})$/ do |str|
  insure_for = SdcOrders.order_details.insure_for
  insure_for.checkbox.scroll_into_view
  insure_for.checkbox.check
  begin
    SdcPage.browser.wait_until(timeout: 3) do
      insure_for.checkbox.checked?
    end
  rescue
    # ignore
  end
  expect(insure_for.checkbox.checked?). to be(true), 'Cannot check Insure-for checkbox'
  insure_for.amount.set(str)
  insure_for.cost.scroll_into_view
  insure_for.cost.safe_click
  step 'click through insurance terms and conditions'
  TestData.hash[:insured_value] = str.to_f
  step 'blur out on order details form'
  step 'save order details data'
end

Then /^set order details tracking to (.*)$/ do |str|
  tracking = SdcOrders.order_details.tracking
  selection = tracking.selection_element(value: str)
  tracking.drop_down.click
  3.times do
    selection.scroll_into_view
    selection.safe_wait_until_present(timeout: 1)
    selection.safe_click
    break if tracking.text_field.text_value.eql?(str)
    tracking.drop_down.click unless selection.present?
  end
  expect(tracking.text_field.text_value).to eql(str)
  TestData.hash[:tracking] = str
  step 'save order details data'
end

Then /^set order details reference to (.*)$/ do |str|
  SdcOrders.order_details.reference_no.set(str)
  TestData.hash[:reference_no] = str
  step 'save order details data'
end

Then /^set order details ship-from to (.+)$/ do |str|
  ship_from = SdcOrders.order_details.ship_from
  unless ship_from.text_field.text_value.eql? str
    ship_from.selection_element(str)
    ship_from.drop_down.scroll_into_view.click unless ship_from.selection.present?
    if ship_from.selection.present?
      ship_from.selection.scroll_into_view.click
    else
      address = '90245,Automation,1990 E Grand Avenue,El Segundo,California,90245,United States,4157944522'
      step "add default ship-from shipping address #{address}"
      ship_from.selection_element(str)
      ship_from.drop_down.click unless ship_from.selection.present?
      ship_from.selection.click
    end
  end
  unless str.eql? 'Manage Shipping Addresses...'
    result = ship_from.text_field.text_value
    expect(result).to eql str
  end
  TestData.hash[:ship_from] = str
end

Then /^expect order details associated item (\d+) qty is (?:correct|(\d+))$/ do |item, str|
  str ||= TestData.hash[:details_associated_items][item][:item_qty]
  result = SdcOrders.order_details.associated_item.item_qty(item).text_value.to_i
  expect(result).to eql(str.to_i)
end

Then /^expect order details associated item (\d+) ID is (?:correct|(.*))$/ do |item, str|
  str ||= TestData.hash[:details_associated_items][item][:item_id]
  result = SdcOrders.order_details.associated_item.id(item).text_value
  expect(result).to eql str
end

Then /^expect order details associated item (\d+) Description is (?:correct|(.*))$/ do |item, str|
  str ||= TestData.hash[:details_associated_items][item][:item_description]
  result = SdcOrders.order_details.associated_item.description(item).text_value
  expect(result).to eql str
end

Then /^expect order details service cost is (?:correct|(\d+.\d*))$/ do |str|
  str ||= TestData.hash[:service_cost]
  result = SdcOrders.order_details.service.cost.text_value
  cost = result.parse_digits.to_f.round(2)
  expect(cost).to eql(str.to_f.round(2))
end

Then /^expect order details tracking cost is (?:correct|(\d+.\d*))$/ do |str|
  str ||= TestData.hash[:tracking_cost]
  result = SdcOrders.order_details.tracking.cost.text_value
  cost = result.parse_digits.to_f.round(2)
  expect(cost).to eql(str.to_f.round(2))
end

Then /^expect order details pounds? (?:is (\d+)|and saved Pounds? are the same)$/ do |str|
  str ||= TestData.hash[:pounds]
  weight = SdcOrders.order_details.weight
  weight.lbs.scroll_into_view
  weight.lbs.wait_until_present(timeout: 10)
  result = weight.lbs.text_value.to_f
  expect(result).to eql(str.to_f.round(2))
end

Then /^expect order details ounces? (?:is (\d+)|and saved Ounces? are the same)$/ do |str|
  str ||= TestData.hash[:ounces]
  weight = SdcOrders.order_details.weight
  weight.oz.scroll_into_view
  weight.oz.wait_until_present(timeout: 10)
  result = weight.oz.text_value.to_f
  expect(result).to eql(str.to_f.round(2))
end

Then /^expect order details length is (\d+)$/ do |str|
  str ||= TestData.hash[:length]
  dimensions = SdcOrders.order_details.dimensions
  dimensions.length.scroll_into_view
  dimensions.length.wait_until_present(timeout: 10)
  result = dimensions.length.text_value.to_f
  expect(result).to eql(str.to_f.round(2))
end

Then /^expect order details width is (\d+)$/ do |str|
  str ||= TestData.hash[:width]
  dimensions = SdcOrders.order_details.dimensions
  dimensions.width.scroll_into_view
  dimensions.width.wait_until_present(timeout: 10)
  result = dimensions.width.text_value.to_f
  expect(result).to eql(str.to_f.round(2))
end

Then /^expect order details height is (\d+)$/ do |str|
  str ||= TestData.hash[:height]
  dimensions = SdcOrders.order_details.dimensions
  dimensions.height.scroll_into_view
  dimensions.height.wait_until_present(timeout: 10)
  result = dimensions.height.text_value.to_f
  expect(result).to eql(str.to_f.round(2))
end

Then /^expect order details tracking is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:tracking]
  tracking = SdcOrders.order_details.tracking
  tracking.text_field.scroll_into_view
  tracking.text_field.wait_until_present(timeout: 10)
  result = tracking.text_field.text_value
  expect(result).to eql(str)
end

Then /^expect order details is present$/ do
  order_details = SdcWebsite.orders.order_details
  expect(order_details.title.text).to include('Order')
end

Then /^expect order details ship-from is (?:correct|(.*))$/ do |str|
  step 'show order ship-to details'
  str ||= TestData.hash[:ship_from]
  if str
    ship_from = SdcOrders.order_details.ship_from
    ship_from.text_field.scroll_into_view
    ship_from.text_field.wait_until_present(timeout: 10)
    result = ship_from.text_field.text_value
    expect(result).to eql(str)
  end
end

Then /^expect order details reference number is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:reference_no]
  result = SdcOrders.order_details.reference_no.text_value
  expect(result).to eql(str)
end

Then /^expect order details insure-for is (?:correct|(\d+\.\d{2}))$/ do |str|
  str ||= TestData.hash[:insured_value]
  insure_for = SdcOrders.order_details.insure_for
  insure_for.amount.scroll_into_view
  result = insure_for.amount.text_value.to_f.round(2)
  expect(result).to eql(str.to_f)
end

Then /^set order details reference number to (?:a random string|(.*))$/ do |str|
  str ||= TestHelper.rand_alpha_numeric
  order_details = SdcOrders.order_details
  order_details.reference_no.scroll_into_view
  order_details.reference_no.set(str)
  order_details.reference_no.click
  order_details.reference_no_label.click
  order_details.reference_no_label.click
  TestData.hash[:reference_no] = str
  step 'save order details data'
end

Then /^expect order details ship from is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:ship_from]
  ship_from = SdcOrders.order_details.ship_from
  ship_from.text_field.scroll_into_view
  result = ship_from.text_field.text_value
  expect(result).to include(str)
end

Then /^expect order details ship-to country is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:country]
  result = SdcOrders.order_details.ship_to.domestic.country.text_field.text_value
  expect(result).to eql str
end

Then /^expect order details international ship-to name is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:full_name]
  result = SdcOrders.order_details.ship_to.international.name.text_value
  expect(result).to eql(str)
end

Then /^expect order details international ship-to company is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:company]
  result = SdcOrders.order_details.ship_to.international.company.text_value
  expect(result).to eql str
end

Then /^expect order details international ship-to address 1 is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:street_address1]
  result = SdcOrders.order_details.ship_to.international.address1.text_value
  expect(result).to eql str
end

Then /^expect order details international ship-to address 2 is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:street_address2]
  result = SdcOrders.order_details.ship_to.international.address2.text_value
  expect(result).to eql str
end

Then /^expect order details international ship-to city is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:city]
  result = SdcOrders.order_details.ship_to.international.city.text_value
  expect(result).to eql str
end

Then /^expect order details international ship-to province is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:province]
  result = SdcOrders.order_details.ship_to.international.province.text_value
  expect(result).to eql str
end

Then /^expect order details international ship-to postal code is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:postal_code]
  result = SdcOrders.order_details.ship_to.international.postal_code.text_value
  expect(result).to eql str
end

Then /^expect order details international ship-to phone is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:phone]
  result = SdcOrders.order_details.ship_to.international.phone.text_value
  expect(result).to eql str
end

Then /^expect order details international ship-to email is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:email]
  result = SdcOrders.order_details.ship_to.international.email.text_value
  expect(result).to eql str
end

