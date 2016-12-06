# encoding: utf-8

Then /^Mail Stamps: Select Specify Mail Amount/ do
  logger.step "Select Stamps Specify Mail Amount"
  stamps.mail.netstamps.specify_postage_amount
end

Then /^Mail Stamps: Set Stamp Amount to \$(.*)$/ do |amount|
  logger.step "Set Stamps Stamp Amount to $#{amount}"
  stamps.mail.netstamps.specify_postage_amount.stamp_amount.set amount
end

Then /^Mail Stamps: Set Specify Mail Service to (.*)/ do |service|
  logger.step "Envelopes: Set Print Mail Service to: \n #{service}"
  stamps.mail.netstamps.specify_service_drop_list.select service
end

Then /^Mail Stamps: Select Specify Mail Service Media Mail$/ do
  step "Mail Stamps: Set Specify Mail Service to Media Mail (2 - 3 Days)"
end

Then /^Mail Stamps: Select Specify Mail Service First Class$/ do
  step "Mail Stamps: Set Specify Mail Service to First Class Mail (1 - 3 Days)"
end
