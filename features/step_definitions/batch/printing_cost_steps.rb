Then /^Save Shipping Costs Data$/ do
  log "Step: Save Shipping Costs Data"
  @service_cost = batch.order_details.service_cost
  @insurance_cost = batch.order_details.insurance_cost
  @tracking_cost = batch.order_details.tracking_cost
  @total_amount = batch.order_details.total
  @old_balance = batch.navigation.balance
end

Then /^Expect Total amount equals Service Cost, Insurance Cost and Tracking Cost$/ do
  log "Step: Expect Total amount equals Service Cost, Insurance Cost and Tracking Cost"
  @total_amount = batch.order_details.total
  @service_cost = batch.order_details.service_cost
  @tracking_cost = batch.order_details.tracking_cost
  @insurance_cost = batch.order_details.insurance_cost
  total_amount_correct = @total_amount.to_f.round(2) == (@service_cost.to_f + @insurance_cost.to_f + @tracking_cost.to_f).round(2)
  log "Total Amount:  #{(total_amount_correct)?'Passed':'Failed'}.  #{@total_amount} == #{@service_cost} + #{@insurance_cost} + #{@tracking_cost}"
  expect(total_amount_correct).to be true
end

Then /^Expect Ship Cost equals Total amount$/ do
  log "Step: Expect Ship Cost equals Total amount"
  total_amount = batch.order_details.total
  ship_cost = batch.grid.ship_cost.data @order_id
  10.times { |counter|
    begin
      sleep(1)
      log_expectation_eql "#{counter}. Ship Cost", total_amount, ship_cost
      break if ship_cost.eql? total_amount
      total_amount = batch.order_details.total
      ship_cost = batch.grid.ship_cost.data @order_id
    rescue
      #ignore
    end
  }
  ship_cost.should eql total_amount
end

Then /^Expect \$([0-9.]*) is deducted from customer balance if printing is successful$/ do |expected|
  log "Step: Expect \$#{expected} is deducted from customer balance if printing is successful"
  log_param "Old Balance", @old_balance
  if @printing_error
    @new_balance = batch.navigation.balance
    test_result = @old_balance.to_f == @new_balance.to_f
    log "Printing error detected."
    log "Account balance should be the same.  Old balance: #{@old_balance}, New balance: #{@new_balance} ##{(test_result)?"Passed":"Failed"}"
    expect(test_result).to be true
  else
    @new_balance = batch.navigation.balance
    test_result = @old_balance.to_f == @new_balance.to_f + expected.to_f
    log "Account balance should be the same.  Old balance: #{@old_balance}, New balance: #{@new_balance} ##{(test_result)?"Passed":"Failed"}"
    expect(test_result).to be true
  end
end

Then /^Expect Printing cost is deducted from customer balance if there were no printing errors$/ do
  log "Step: Expect Printing cost is deducted from customer balance if there were no printing errors"
  log "Printing Error:  #{@printing_error}"
  log_param "Old Balance", @old_balance
  if @printing_error
    @new_balance = batch.navigation.balance
    balance_deduction = @old_balance.to_f == @new_balance.to_f
    log "Printing error detected."
    log "Account balance should be the same.  Old balance: #{@old_balance}, New balance: #{@new_balance} ##{(balance_deduction)?"Passed":"Failed"}"
    expect(balance_deduction).to be true
  else
    @new_balance = batch.navigation.wait_until_balance_updated(@old_balance).balance
    postage_total_calculation = @total_amount.to_f.round(2) == (@service_cost.to_f + @insurance_cost.to_f + @tracking_cost.to_f).round(2)
    log "Postage total Calculation:  #{(postage_total_calculation)?'Passed':'Failed'}.  #{@total_amount} == #{@service_cost} + #{@insurance_cost} + #{@tracking_cost}"
    expect(postage_total_calculation).to be true
    new = @new_balance.to_f.round(2)
    calculated = (@old_balance.to_f - (@service_cost.to_f + @tracking_cost.to_f)).round(2)
    balance_deduction = new == calculated
    log "Customer Balance:  #{(balance_deduction)?'Passed':'Failed'}.  (New Balance)#{@new_balance} == (Old balance) #{@old_balance} - ((Service) #{@service_cost} + (Tracking) #{@tracking_cost})"
    expect(balance_deduction).to be true
  end
end

Then /^Expect Print Window Total Cost to be \$([0-9.]*)$/ do |expectation|
  log "Step: Expect Print Window Total Cost to be #{expectation}"
  begin
    print_window = batch.toolbar.print_modal
    actual_value = print_window.total_cost
    10.times { |counter|
      log_expectation_eql "#{counter}. Print Window Total Cost", expectation, actual_value
      break if actual_value.eql? expectation
      actual_value = print_window.total_cost
    }
    print_window.close
    actual_value.should eql expectation
  end unless expectation.length == 0
end