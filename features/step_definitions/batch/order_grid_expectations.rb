
# | name | company    | street_address      | city          | state | zip   | country       | phone       |  email
Then /^Expect Ship-To address to be;$/ do |table|
  expected_values = table.hashes.first
  step "Expect order-grid Recipient Name to be #{expected_values[:name]}"
  step "Expect order-grid Company Name to be #{expected_values[:company]}"
  step "Expect order-grid Street Address to be #{expected_values[:street_address]}"
  step "Expect order-grid City to be #{expected_values[:city]}"
  step "Expect order-grid State to be #{expected_values[:state]}"
  step "Expect order-grid Zip Code to be #{expected_values[:zip]}"
  step "Expect order-grid Phone to be #{expected_values[:phone]}"
  step "Expect order-grid Email to be #{expected_values[:email]}"
end

Then /^Expect order-grid Recipient Name to be (.*)$/ do |expected_value|
  actual_value = batch.grid.recipient(Batch.order_id)
  log_expectation_eql "Recipient Name", expected_value, actual_value
  actual_value.should eql expected_value
end

Then /^Expect order-grid Company Name to be (.*)$/ do |expected_value|
  #begin_step step =  "Expect order-grid Company Name to be \"#{expected_value}\""
  actual_value = batch.grid.company(Batch.order_id)
  log_expectation_eql "Company Name", expected_value, actual_value
  expect(actual_value).to eql expected_value
  #end_step step
end

Then /^Expect order-grid Street Address to be ([\w\s-]+)$/ do |expected_value|
  actual_value = batch.grid.street_address(Batch.order_id)
  log_expectation_eql "Street Address", expected_value, actual_value
  actual_value.should eql expected_value
end

Then /^Expect order-grid City to be ([\w\s]+)$/ do |expected_value|
  #begin_step step =  "Expect order-grid City to be \"#{expected_value}\""
  actual_value = batch.grid.city(Batch.order_id)
  log_expectation_eql "City", expected_value, actual_value
  actual_value.should eql expected_value
end

Then /^Expect order-grid State to be ([a-zA-Z]+)$/ do |expected_value|
  actual_value = batch.grid.state(Batch.order_id)
  log_expectation_eql "State", expected_value, actual_value
  actual_value.should eql expected_value
end

Then /^Expect order-grid Zip Code to be ([0-9]+)$/ do |expected_value|
  #begin_step step =  "Expect order-grid Zip Code to be \"#{expected_value}\""
  actual_value = batch.grid.zip(Batch.order_id)
  log_expectation_eql "Zip", expected_value, actual_value
  actual_value.should eql expected_value
end

Then /^Expect order-grid Email to be ([\S]+@[\S]+\.[a-z]{3})$/ do |expected_value|
  actual_value = batch.grid.email(Batch.order_id)
  log_expectation_eql "Email", expected_value, actual_value
  actual_value.should eql expected_value
end

Then /^Expect order-grid Phone to be ([\(]?[0-9]{3}[\)]?[\s]?[0-9]{3}[\s-]?[0-9]{4})$/ do |expected_value|
  actual_value = batch.grid.phone(Batch.order_id)
  log_expectation_eql "Phone", expected_value, actual_value
  actual_value.should eql expected_value
end

Then /^Expect order-grid Pounds to be (\d+)$/ do |expected_value|
  actual_value = batch.grid.pounds(Batch.order_id)
  log_expectation_eql "Pounds", expected_value, actual_value
  actual_value.should eql expected_value
end

Then /^Expect order-grid Ounces to be (\d+)$/ do |expected_value|
  actual_value = batch.grid.ounces(Batch.order_id)
  log_expectation_eql "Ounces", expected_value, actual_value
  actual_value.should eql expected_value
end

Then /^Expect order-grid Weight to be (\d+) lbs. (\d+) oz.$/ do |pounds, ounces|
  expected_value = "#{pounds} lbs. #{ounces} oz."
  actual_value = batch.grid.weight(Batch.order_id)
  log_expectation_eql "Weight", expected_value, actual_value
  actual_value.should eql expected_value
end

# | insured_value  | pounds  | ounces | length  | width | height  |
Then /^Expect Order details to be;$/ do |table|
  expected_value_hash = table.hashes.first
  step "Expect order-grid Insured Value to be #{expected_value_hash[:insured_value]}"
  step "Expect order-grid Weight to be #{expected_value_hash[:pounds]} lbs. #{expected_value_hash[:ounces]} oz."
end

Then /^Expect order-grid Insured Value to be (\d*\.?\d*)$/ do |expected_value|
  actual_value = batch.grid.insured_value(Batch.order_id)
  log_expectation_eql "Insurance", expected_value, actual_value
  actual_value.should eql expected_value
end

Then /^Expect new Order ID created$/ do
  expect(Batch.order_id.to_i).to be > 999
end
