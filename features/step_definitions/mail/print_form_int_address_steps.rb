#rates only
Then /^set Print Form Ship-To Country to a random country in PMEI price group (.*)$/ do |group|
  country_name = TestHelper.select_random_country(:country_groups_PMEI, group)
  TestData.hash[:country] = country_name
  step "set print form mail-to country to #{country_name}" if country_name
end

Then /^[Ss]et Print Form Ship-To Country to a random country in PMEI Flat Rate price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMEI_flat_rate, {})["group" + group].values
  TestData.hash[:country] = country_list[rand(country_list.size)]
  step "set print form mail-to country to #{TestData.hash[:country]}"
end

Then /^set Print Form Ship-To Country to a random country in PMI price group (.*)$/ do |group|
  country_name = TestHelper.select_random_country(:country_groups_PMI, group)
  TestData.hash[:country] = country_name
  step "set print form mail-to country to #{country_name}" if country_name
end

Then /^set Print Form Ship-To Country to a random country in PMI Flat Rate price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMI_flat_rate, {})["group" + group].values
  TestData.hash[:country] = country_list[rand(country_list.size)]
  step "set print form mail-to country to #{TestData.hash[:country]}" unless SdcMail.print_form.mail_to.text_field.text_value.eql?(TestData.hash[:country])
end
