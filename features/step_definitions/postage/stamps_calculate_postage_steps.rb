# encoding: utf-8

Then /^Stamps: Select Calculate Postage Amount/ do
  log.info "Step:  Select Stamps Calculate Postage Amount"
  @stamps = postage.stamps if @postage_form.nil?
  @stamps.calculate_postage_amount
end

Then /^Stamps: Set Weight (\d+) lbs (\d+) oz$/ do |lbs, oz|
  log.info "Step:  Set Stamps Weight #{lbs} lbs #{oz} oz"
  @stamps = postage.stamps if @postage_form.nil?
  weight = @stamps.calculate_postage_amount.weight
  weight.lbs.set lbs
  weight.oz.set oz
end

Then /^Stamps: Set Calculate Postage Service to \"(.*)\"/ do |service|
  log.info "Step: Envelopes: Set Print Postage Service to: \n #{service}"
  @stamps.calculate_postage_service.select service
end

Then /^Stamps: Open Extra Services$/ do

end