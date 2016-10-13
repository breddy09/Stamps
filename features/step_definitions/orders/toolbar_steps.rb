Then /^Toolbar: Add$/ do
  logger.step "Toolbar: Add"
  web_apps.orders.grid.checkbox.uncheck 1
  @order_details = web_apps.orders.toolbar.add.order_details
  @orders_test_data[:order_id] = @order_details.toolbar.order_id
  @orders_test_data[:old_balance] = web_apps.navigation_bar.balance.amount
  step "Save Shipping Costs Data"
  logger.step "Saved Order ID #{@orders_test_data[:order_id]}"
  @orders_test_data[:order_id] = @orders_test_data[:order_id]
  @orders_test_data[:awaiting_shipment_count] = web_apps.orders.filter.awaiting_shipment_count
  @item_count = 0
  @index = 0
end

Then /^Save Shipping Costs Data$/ do
  logger.step "Save Shipping Costs Data"
  @orders_test_data[:service_cost] = web_apps.orders.details.service.cost
  @orders_test_data[:insure_for_cost] = web_apps.orders.details.insure_for.cost
  @orders_test_data[:tracking_cost] = web_apps.orders.details.tracking.cost
  @orders_test_data[:total_ship_cost] = web_apps.orders.details.footer.total_ship_cost
end

Then /^Toolbar: Move to Shipped$/ do
  logger.step "Toolbar: Move to Shipped"
  grid = web_apps.orders.grid
  raise "Order ID #{@orders_test_data[:order_id]} does not exist in this tab and therefore cannot be moved." unless (grid.order_id.row_num @orders_test_data[:order_id]) > 0
  grid.order_date.sort_descending
  grid.checkbox.check_order @orders_test_data[:order_id]
  grid.toolbar.move.to_shipped.cancel
  grid.toolbar.move.to_shipped.move
end

Then /^Toolbar: Move to Canceled$/ do
  logger.step "Toolbar: Move to Canceled"
  grid = web_apps.orders.grid
  raise "Order ID #{@orders_test_data[:order_id]} does not exist in this tab and therefore cannot be moved." unless (grid.order_id.row_num @orders_test_data[:order_id]) > 0
  grid.order_date.sort_descending
  grid.checkbox.check_order @orders_test_data[:order_id]
  grid.toolbar.move.to_canceled.cancel
  grid.toolbar.move.to_canceled.move
end

Then /^Toolbar: Refresh Orders$/ do
  logger.step "Toolbar: Refresh Orders"
  web_apps.orders.toolbar.refresh_orders
end

Then /^Print: Expect Print Modal is present$/ do
  logger.step "Test #{(web_apps.orders.toolbar.print_btn.print_modal.present?)?"Passed":"Failed"}"
  web_apps.orders.toolbar.print_btn.print_modal.present?.should be_truthy
end

Then /^Print: Print$/ do
  logger.step "Print"
  print_modal = web_apps.orders.toolbar.print_btn.print_modal
  @ship_date = print_modal.ship_date.text
  @paper_tray = print_modal.paper_tray.text_box.text
  @printer = print_modal.printer.text_box.text
  @printing_on = print_modal.printing_on.text_box.text
  @printing_error = print_modal.print
end

Then /^Print: Open Reprint Modal$/ do
  logger.step "RePrint"
  @reprint_modal = web_apps.orders.toolbar.reprint
end

Then /^Label Unavailable:  Expect Visible$/ do
  logger.step "Label Unavailable:  Expect Visible"
  case @reprint_modal
    when LabelUnavailable
      logger.step @reprint_modal.message
      label_unavailable_visible = @reprint_modal.present?
      logger.step "Test #{(label_unavailable_visible)?"Passed":"Failed"}"
      @reprint_modal.ok
      @reprint_modal.close
      label_unavailable_visible.should be true
    else
      logger.step "Test #{(@reprint_modal.present?)?"Passed":"Failed"}"
      @reprint_modal.present?.should be true
  end
end

Then /^Toolbar: Add second order$/ do
  logger.step "Toolbar: Add second order"
  @order_details = web_apps.orders.toolbar.add.order_details
  @orders_test_data[:order_id_2] = @order_details.toolbar.order_id
end

Then /^Toolbar: Add third order$/ do
  logger.step "Toolbar: Add third order"
  @order_details = web_apps.orders.toolbar.add.order_details
  @orders_test_data[:order_id_3] = @order_details.toolbar.order_id
end

Then /^Add a second order$/ do
  logger.step "Add a second order"
  first_row_order_id = web_apps.orders.grid.order_id.row 1
  5.times{
    @orders_test_data[:order_id_2] = web_apps.orders.toolbar.add.order_details_shipping_address_window
    if first_row_order_id.include? @orders_test_data[:order_id]
      sleep(3)
    end
    break unless first_row_order_id.include? @orders_test_data[:order_id_2]
  }
  logger.step "Second Order Id:  #{@orders_test_data[:order_id_2]}"
  web_apps.orders.grid.checkbox.edit @orders_test_data[:order_id_2]
end

Then /^Fail the test$/ do
  logger.step "Fail the test"
  true.should eql  false
end

Then /^Test Features$/ do |count|
  logger.step "Test Features"
  web_apps.orders.grid.checkbox.check_all
  count = web_apps.orders.multi_order.order_count
  logger.step count
  web_apps.orders.grid.checkbox.uncheck_all
end

