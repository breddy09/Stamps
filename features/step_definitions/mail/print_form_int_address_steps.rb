

#rates only?
Then /^set Print Form Ship-To Country to a random country in PMEI price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMEI, {})["group" + group].values
  country_array = (country_list[rand(country_list.size)]).split("|")
  country_name = country_array[0]
  country_pounds = country_array[1].to_i
  100.times do
    unless TestData.hash[:pounds].nil?
      if TestData.hash[:pounds] > country_pounds
        country_array = country_list[rand(country_list.size)].split("|")
        country_name = country_array[0]
        country_pounds = country_array[1].to_i
      else
        break
      end
    end
  end
  step "set print form mail-to country to #{TestData.hash[:country] = country_name}"
end

Then /^[Ss]et Print Form Ship-To Country to a random country in PMEI Flat Rate price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMEI_flat_rate, {})["group" + group].values
  TestData.hash[:country] = country_list[rand(country_list.size)]
  step "set print form mail-to country to #{TestData.hash[:country]}"
end

Then /^set Print Form Ship-To Country to a random country in PMI price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMI, {})["group" + group].values
  country_array = (country_list[rand(country_list.size)]).split("|")
  country_name = country_array[0]
  country_pounds = country_array[1].to_i
  100.times do
    unless TestData.hash[:pounds].nil?
      if TestData.hash[:pounds] > country_pounds
        country_array = country_list[rand(country_list.size)].split("|")
        country_name = country_array[0]
        country_pounds = country_array[1].to_i
      else
        break
      end
    end
  end
  TestData.hash[:country] = country_name
  step "set print form mail-to country to #{TestData.hash[:country]}"
end

