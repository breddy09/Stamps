

Then /^Set Order Details Add Item$/ do
  orders.order_details.add_item
  @item_count += 1
  log.info "Item #{@item_count} added."
end

Then /^Set Order Details Line Item Quantity to (.*)$/ do |qty|
  step "Set Order Details Line Item #{@item_count} Quantity to #{qty}"
end

Then /^Set Order Details Line Item (\d+) Quantity to (.*)$/ do |line_item, qty|
  @line_item_qty = qty
  log.info "Set Order Details Line Item #{line_item} Quantity to #{@line_item_qty}"

  item_object = orders.order_details.item line_item
  item_object.qty qty
end

Then /^Set Order Details Line Item ID to (.*)$/ do |id|
  step "Set Order Details Line Item #{@item_count} ID to #{id}"
end

Then /^Set Order Details Line Item (\d+) ID to (.*)$/ do |line_item, id|
  @line_item_id = id
  log.info "Set Order Details Line Item #{line_item} ID to #{@line_item_id}"

  item_object = orders.order_details.item line_item
  item_object.id (id.downcase.include? "random") ? test_helper.random_alpha_numeric : id
end

Then /^Set Order Details Line Item Description to (.*)$/ do |description|
  step "Set Order Details Line Item #{@item_count} Description to #{description}"
end

Then /^Set Order Details Line Item (\d+) Description to (.*)$/ do |line_item, description|
  @line_item_description = description
  log.info "Set Order Details Line Item #{line_item} Description to #{@line_item_description}"

  item_object = orders.order_details.item line_item
  item_object.description (description.downcase.include? "random") ? test_helper.random_alpha_numeric : description
end

Given /^Add Order Details Form Item - Quantity (.*), ID (.*), Description (.*)$/ do |qty, id, description|
  log.info "Step: Add Order Details Form Item - Quantity #{qty}, ID #{id}, Description #{description}"
  step "Set Order Details Add Item"
  step "Set Order Details Line Item Quantity to #{qty}"
  step "Set Order Details Line Item ID to #{id}"
  step "Set Order Details Line Item Description to #{description}"
end

And /^Set Order Details Form Ship-From to (\w+)$/ do |value|
  log.info "Step: Set Order Details Form Ship-From to: \n #{value}"
  orders.order_details.ship_from.select value
end

And /^Set Order Details Form Ship-To address to$/ do |table|
  ship_to = OrdersHelper.instance.address_hash_to_str table.hashes.first
  log.info "Step: Set Order Details Form Ship-To address to \n#{ship_to}"
  step "Set Order Details Form Ship-To address to #{ship_to}"
end

When /^Set Order Details Form Ship-To address to (.*)$/ do |address|
  log.info "Step: Set Order Details Form Ship-To address to \"#{address}\""

  if address.downcase.include? "random"
    random_ship_to_address = test_helper.random_ship_to
    formatted_address = OrdersHelper.instance.format_address(random_ship_to_address)
  else
    formatted_address = OrdersHelper.instance.format_address address
  end

  log.info "Set Order Details Form Ship-To address to \"#{formatted_address}\""

  orders.order_details.ship_to.address.set formatted_address
  begin
    step "Set Order Details Form Phone to #{random_ship_to_address["phone"]}"
    step "Set Order Details Form Email to #{random_ship_to_address["email"]}"
  rescue
    #ignroe
  end
end

And /^Set Order Details Form Ship-To to ambiguous address$/ do |table|
  ambiguous_address = OrdersHelper.instance.format_address table.hashes.first
  log.info "Step: Set Order Details Form Ship-To to ambiguous address \n#{ambiguous_address}"
  @ambiguous_address_module = orders.order_details.ship_to.ambiguous.set ambiguous_address
end

Then /^Select row (\d{1,2}) from Exact Address Not Found module$/ do |row|
  log.info "Step: Select row #{row} from Exact Address Not Found module"
  @ambiguous_address_module.row row
end

Then /^Expect "Exact Address Not Found" module to appear/ do
  log.info "Expectation: Expect \"Exact Address Not Found\" module to appear"
  expect(@ambiguous_address_module.present?).to be true
end

When /^Set Order Details Form Phone to (.*)$/ do |phone|
  @order_details_phone = (phone.to_s.strip.downcase.include? "random")?(test_helper.random_phone):phone
  begin
    log.info "Step: Order Details Form Phone to \"#{@order_details_phone}\""
    orders.order_details.ship_to.address.phone.set @order_details_phone
  end unless @order_details_phone.length == 0
end

When /^Set Order Details Form Email to (.*)$/ do |email|
  @order_details_email = (email.to_s.strip.downcase.include? "random")?(test_helper.random_email):email
  begin
    log.info "Step: Set Order Details Form Email to \"#{@order_details_email}\""
    orders.order_details.ship_to.address.email.set @order_details_email
  end unless @order_details_email.length == 0
end

When /^Expect system (.*) Order Form$/ do |status|
  log.info "Expectation: Expect system #{status} Order Form"

  actual = orders.order_details.present?
  if status == 'hides'
    actual.should eql false
  elsif status == 'displays'
    actual.should eql true
  end
end

When /^Hide Order Details Form Ship-To fields$/ do
  log.info "Step: Hide Order Details Form Ship-To fields"
  orders.order_details.ship_to.hide
  log.info "done."
  #end_step step
end

When /^Set Order Details Form Pounds to (\d*)$/ do |value|
  begin
    log.info "Step: Set Order Details Form Pounds to \"#{value}\""
    orders.order_details.lbs.set value
  end unless value.length == 0
end

When /^Set Order Details Form Ounces to (\d*)$/ do |value|
  begin
    log.info "Step: Set Order Details Form Ounces to \"#{value}\""
    orders.order_details.oz.set value
  end unless value.length == 0
end

When /^Set Order Details Form Length to (\d*)$/ do |value|
  begin
    log.info "Step: Set Order Details Form Length to \"#{value}\""
    orders.order_details.length.set value
  end unless value.length == 0
end

When /^Set Order Details Form Width to (\d*)$/ do |value|
  begin
    log.info "Step: Set Order Details Form Width to \"#{value}\""
    orders.order_details.width.set value
  end unless value.length == 0
end

When /^Set Order Details Form Height to (\d*)$/ do |value|
  begin
    log.info "Step: Set Order Details Form Height to \"#{value}\""
    orders.order_details.height.set value
  end unless value.length == 0
end

And /^Set Order Details Form Service to \"(.*)\"$/ do |service|
  log.info "Step: Set Order Details Form Service to #{service}"
  orders.order_details.service.select service
end

Then /^Set Order Details Form Tracking to \"([\w ]*)\"$/ do |value|
  log.info "Step: Set Order Details Form Tracking to #{value}"
  begin
    orders.order_details.tracking.select value
  end unless value.length == 0
end

Then /^Expect Order Details Tracking tooltip for (.*) to be (.*)$/ do |lov, expectation|

  actual_tooltip = orders.order_details.tracking.tooltip value
  #log.info actual_tooltip
  cost = orders.order_details.tracking.cost value
  #log.info cost
end

And /^Set Order Details Form Insured Value to \$([\d*\.?\d*]*)$/ do |value|
  log.info "Step: Set Order Details Form Insured Value to #{value}"
  orders.order_details.insured_value.set value
end

When /^Set order details with$/ do |table|
  log.info "Step: Set order details with..."
  orders.order_details.edit_details table.hashes.first
end

Then /^Add Ship-From address$/ do |ship_from|
  log.info "Step: Add Ship-From address #{ship_from}"
  orders.order_details.ship_from.select("Manage Shipping Addresses...").add ship_from.hashes.first
end

Then /^Add Ship-From address (\w+)$/ do |address|
  ship_from = (address.include?'random')?(test_helper.random_ship_from):address
  log.info "Step:  Add Ship-From address #{(address.include?'random')?ship_from:(address)}"
  @ship_from_address = orders.order_details.ship_from.select("Manage Shipping Addresses...").add ship_from
  log.info "Random address added: #{@ship_from_address}"
end

Then /^Expect (\w+) Ship-From address was added$/ do |address|
  log.info "Expectation: Expect #{address} Ship-From address was added"
  raise "Unsupported Ship-From address:  #{address}" unless address.downcase.include? "random"
  begin
    log.info "Search for \n#{@ship_from_address}.  Address was #{(orders.order_details.ship_from.select("Manage Shipping Addresses...").address_located?(@ship_from_address))?'Located':'Not Located'}"
  end unless @ship_from_address.nil?
end

Then /^Delete (\w+) Ship-From address$/ do |address|
  log.info "Step: Delete #{address} Ship-From address"
  begin
    if address.downcase == "random"
      raise "Illegal State Exception:  @ship_from_address is nil" if @ship_from_address.nil?
      orders.order_details.ship_from.select("Manage Shipping Addresses...").delete @ship_from_address
    elsif address.downcase == "all"
      orders.order_details.ship_from.select("Manage Shipping Addresses...").delete_all.close_window
    else
      raise "Test parameter exception.  #{address} is not a valid parameter for this test."
    end
  rescue
    #This is a housekeeping task and should never fail.
  end
end

Then /^Delete Ship-From Row (\d+) from Manage Shipping Addresses Modal/ do |row|
  log.info "Step: Delete Ship-From Row #{row} from Manage Shipping Addresses Modal"
  orders.order_details.ship_from.select("Manage Shipping Addresses...").delete_row(row)
end

Then /^Set Order Details Form Ship-From to Manage Shipping Addresses$/ do
  log.info "Step: Set Order Details Form Ship-From to Manage Shipping Addresses"
  orders.order_details.ship_from.select("Manage Shipping Addresses...").add table.hashes.first
end

Then /^Edit Ship-From address for name = \"(.*)\", company = \"(.*)\" and city = \"(.*)\" to;$/ do |name, company, city, new_address|
  log.info "Step: Edit Ship-From address for name = \"#{name}\", company = \"#{company}\" and city = \"#{city}\" to #{new_address}"
  orders.order_details.ship_from.select("Manage Shipping Addresses...").edit_address name, company, city,  new_address.hashes.first
end

Then /^Expect Pounds tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expected|
  log.info "Expectation: Expect Pounds tooltip to display - The maximum value for this field is #{expected}"
  actual = orders.order_details.pounds_max_value
  #log_expectation_eql "Maximum Pounds", expected, actual
  actual.should eql expected
end

Then /^Expect Ounces tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expected|
  log.info "Expectation: Expect Ounces tooltip to display - The maximum value for this field is #{expected}"
  actual = orders.order_details.ounces_max_value
  #log_expectation_eql "Maximum Pounds", expected, actual
  actual.should eql expected
end

Then /^Expect Order Details Form Service Cost inline price for "([a-zA-Z -\/]+)" to be greater than \$([0-9.]*)$/ do |service, expected|
  log.info "Expectation: Expect Order Details Form Service Cost inline price for #{service} to be greater than #{expected}"
  actual = orders.order_details.service.cost service
  10.times { |counter|
    #log_expectation_eql "#{counter}. #{service} Inline Rate", expected, actual, (actual.to_f >= expected.to_f)
    break if actual.to_f >= expected.to_f
    actual = orders.order_details.service.cost service
  }
  actual.to_f.should be >= expected.to_f
end

Then /^Expect Order Details Form Service Tooltip for "(.*)" to include "(.*)"$/ do |service, tooltip_content|
  log.info "Expectation: Expect Order Details Form Service Tooltip for \"#{service}\" to include \"#{tooltip_content}\""
  tooltips = tooltip_content.split ","
  actual_tooltip = orders.order_details.service.tooltip service
  tooltips.each { |tooltip|
    log.info "Does #{tooltip} exist in tooltip?  #{(actual_tooltip.include? tooltip)?"Yes.":"No."}"
    actual_tooltip.should include tooltip
  }
end

Then /^Expect Service Cost to be \$(.*)$/ do |expected|
  log.info "Expectation: Expect Service Cost to be $#{expected}"
  actual = orders.order_details.service_cost
  begin
    10.times { |counter|
      #log_expectation_eql "#{counter}. Service Cost", expected, actual
      break if actual.eql? expected
      actual = orders.order_details.service_cost
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Tracking Cost to be \$([0-9.]*)$/ do |expected|
  log.info "Expectation: Expect Tracking Cost to be #{expected}"
  begin
    actual = orders.order_details.tracking_cost
    10.times { |counter|
      #log_expectation_eql "#{counter}. Tracking Cost", expected, actual
      break if actual.eql? expected
      actual = orders.order_details.tracking_cost
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Verify Order Details Form Total Amount$/ do
  log.info "Step: Verify Order Details Form Total Amount"
end

Then /^Expect Insurance Cost to be \$([0-9.]*)$/ do |expected|
  log.info "Expectation: Expect Insurance Cost to be #{expected}"
  begin
    actual = orders.order_details.insurance_cost
    10.times { |counter|
      #log_expectation_eql "#{counter}. Insurance Cost", expected, actual
      break if actual.eql? expected
      actual = orders.order_details.insurance_cost
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Order Details Form Service to be \"(.*)\"$/ do |expected|
  log.info "Expectation: Expect Order Details Form Service to be #{expected}"
  begin
    actual = orders.order_details.service.text_box.text
    10.times { |counter|
      included = actual.include? expected
      break if included
      actual = orders.order_details.service.text_box.text
    }
    expect(actual.include? expected).to be true
  end unless expected.length == 0
end

Then /^Expect Order Details Form Tracking to be \"([\w\s]*)\"$/ do |expected|
  log.info "Expectation: Expect Order Details Form Tracking to be #{expected}"
  begin
    actual = orders.order_details.tracking.text_box.text
    10.times { |counter|
      #log_expectation_eql "#{counter}. Tracking Selected", expected, actual
      break if actual.eql? expected
      actual = orders.order_details.tracking.text_box.text
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Order Details Form Total to be \$(.*)$/ do |expected|
  log.info "Expectation: Expect Order Details Form Total to be $#{expected}"
  begin
    10.times { |counter|
      orders.order_details.click_form
      sleep 1
      actual = orders.order_details.total
      orders.order_details.click_form
      #log_expectation_eql "#{counter}. Total Cost", expected, actual
      orders.order_details.click_form
      sleep 1
      break if actual.eql? expected
    }
    actual = orders.order_details.total
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect (\d+) orders selected$/ do |expected|
  log.info "Expectation: Expect #{expected} orders selected"
  orders.multi_order.order_count.should eql expected
end




