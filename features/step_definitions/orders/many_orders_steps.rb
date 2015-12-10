When /^Print (\d+) new orders with Address set to (.*) and Service set to (.*)$/ do |count, address, service|
  log.info "Step: Print #{count} new orders with Address set to #{address} and Service set to #{service}"
  count.to_i.times {
    step "I Add a new order"
    step "Set Order Details Form Ship-From to default"
    #SETTING RECIPIENT ADDRESS
    step "Set Order Details Form Ship-To address to #{address}"
    #SETTING SERVICE
    step "Set Order Details Form Service to #{service}"
    #PRINTING
    step "Print"
  }
end

Then /^Create (\d+) new orders with Address set to (.*) and Service set to (.*)$/ do |count, address, service|
  log.info "Step: Create #{count} new orders with Address set to #{address} and Service set to #{service}"
  count.to_i.times { |iteration|
    step "I Add a new order"
    step "Set Order Details Form Ship-From to default"
    #SETTING RECIPIENT ADDRESS
    step "Set Order Details Form Ship-To address to #{address}"
    #SETTING SERVICE
    #step "Set Order Details Form Service to #{service}"
    log.info "Step: Set Order Details Form Service to #{service}"
    batch.order_details.service.select service
    log.info "Order #{iteration} created."
    sleep(1)
  }
end