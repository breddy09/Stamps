Then /^Sort Orders Grid by Age in Ascending order$/ do
  sorted = batch.grid.age.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Age in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Age in Descending order$/ do
  sorted = batch.grid.age.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Age in Descending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Order ID in Ascending order$/ do
  sorted = batch.grid.order_id.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Order ID in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Order ID in Descending order$/ do
  sorted = batch.grid.order_id.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Order ID in Descending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Order Date in Ascending order$/ do
  sorted = batch.grid.order_date.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Order Date in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Order Date in Descending order$/ do
  sorted = batch.grid.order_date.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Order Date in Descending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Recipient in Ascending order$/ do
  sorted = batch.grid.recipient.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Recipient in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Recipient in Descending order$/ do
  sorted = batch.grid.recipient.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Recipient in Descending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Company in Ascending order$/ do
  sorted = batch.grid.company.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Company in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Company in Descending order$/ do
  sorted = batch.grid.company.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Company in Descending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Address in Ascending order$/ do
  sorted = batch.grid.address.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Address in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Address in Descending order$/ do
  sorted = batch.grid.address.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Address in Descending order"
  sorted.should be true
end

Then /^Sort Orders Grid by City in Ascending order$/ do
  sorted = batch.grid.city.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by City in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by City in Descending order$/ do
  sorted = batch.grid.city.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by City in Descending order"
  sorted.should be true
end

Then /^Sort Orders Grid by State in Ascending order$/ do
  sorted = batch.grid.state.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by State in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by State in Descending order$/ do
  log.info "Step:  "
  sorted = batch.grid.state.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by State in Descending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Zip in Ascending order$/ do
  sorted = batch.grid.zip.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by State in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Zip in Descending order$/ do
  sorted = batch.grid.zip.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Zip in Descending orde"
  sorted.should be true
end

Then /^Sort Orders Grid by Country in Ascending order$/ do
  sorted = batch.grid.country.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Country in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Country in Descending order$/ do
  sorted = batch.grid.country.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Country in Descending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Phone in Ascending order$/ do
  sorted = batch.grid.phone.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Phone in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Phone in Descending order$/ do
  sorted = batch.grid.phone.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Phone in Descending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Email in Ascending order$/ do
  sorted = batch.grid.email.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Email in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Email in Descending order$/ do
  sorted = batch.grid.email.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Email in Descending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Qty in Ascending order$/ do
  sorted = batch.grid.qty.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Qty in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Qty in Descending order$/ do
  sorted = batch.grid.qty.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Qty in Descending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Item SKU in Ascending order$/ do
  sorted = batch.grid.item_sku.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Item SKU in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Item SKU in Descending order$/ do
  sorted = batch.grid.item_sku.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Item SKU in Descending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Item Name in Ascending order$/ do
  sorted = batch.grid.item_name.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Item Name in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Item Name in Descending order$/ do
  sorted = batch.grid.item_name.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Item Name in Descending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Weight in Ascending order$/ do
  sorted = batch.grid.weight.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Weight in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Weight in Descending order$/ do
  sorted = batch.grid.weight.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Weight in Descending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Insured Value in Ascending order$/ do
  sorted = batch.grid.insured_value.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Insured Value in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Insured Value in Descending order$/ do
  sorted = batch.grid.insured_value.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Insured Value in Descending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Reference No. in Ascending order$/ do
  sorted = batch.grid.reference_no.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Reference No. in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Reference No. in Descending order$/ do
  sorted = batch.grid.reference_no.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Reference No. in Descending order"
  sorted.should be true
end



Then /^Sort Orders Grid by Order Status in Ascending order$/ do
  sorted = batch.grid.order_status.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Order Status in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Order Status in Descending order$/ do
  sorted = batch.grid.order_status.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Order Status in Descending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Date Printed in Ascending order$/ do
  sorted = batch.grid.date_printed.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Date Printed in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Date Printed in Descending order$/ do
  sorted = batch.grid.date_printed.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Date Printed in Descending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Ship Date in Ascending order$/ do
  sorted = batch.grid.ship_date.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Ship Date in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Ship Date in Descending order$/ do
  sorted = batch.grid.ship_date.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Ship Date in Descending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Order Total in Ascending order$/ do
  sorted = batch.grid.order_total.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Order Total in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Order Total in Descending order$/   do
  sorted = batch.grid.order_total.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Order Total in Descending order"
  sorted.should be true
end


=begin
Then /^Sort Orders Grid by Ship Cost in Ascending order$/ do
  sorted = batch.grid.ship_cost.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Ship Cost in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Ship Cost in Descending order$/ do
  sorted = batch.grid.ship_cost.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Ship Cost in Descending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Ship From in Ascending order$/ do
  sorted = batch.grid.ship_from.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Ship From in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Ship From in Descending order$/ do
  sorted = batch.grid.ship_from.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Ship From in Descending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Service in Ascending order$/ do
  sorted = batch.grid.service.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Service in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Service in Descending order$/ do
  sorted = batch.grid.service.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Service in Descending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Tracking No. in Ascending order$/ do
  sorted = batch.grid.tracking_no.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Tracking No. in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Tracking No. in Descending order$/ do
  sorted = batch.grid.tracking_no.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Tracking No. in Descending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Cost Code in Ascending order$/ do
  sorted = batch.grid.cost_code.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Cost Code in Ascending order"
  sorted.should be true
end

Then /^Sort Orders Grid by Cost Code in Descending order$/ do
  sorted = batch.grid.cost_code.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Sort Orders Grid by Cost Code in Descending order"
  sorted.should be true
end

=end