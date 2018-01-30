
Then /^[Ss]elect [Ff]ilter [Pp]anel tab (.*)$/ do |str|
  expect(['Shipped', 'Canceled', 'On Hold', 'Awaiting Shipment']).to include(str)
  case str
    when /Shipped/
      stamps.orders.filter_panel.shipped.select
    when /Canceled/
      stamps.orders.filter_panel.canceled.select
    when /On Hold/
      stamps.orders.filter_panel.on_hold.select
    when /Awaiting Shipment/
      stamps.orders.filter_panel.awaiting_shipment.select
    else
      #ignore
  end
  step "expect selected filter is #{str}"
end

Then /^[Ee]xpect selected [Ff]ilter is (.*)$/ do |expectation|
  30.times { sleep(0.25); break if stamps.orders.filter_panel.selected_filter==expectation }
  expect(stamps.orders.filter_panel.selected_filter).to eql expectation
end

Then /^[Ee]xpect cached Order ID exist in the selected filter$/ do
  15.times do
    sleep(0.10)
    break if stamps.orders.orders_grid.grid_column(:order_id).row_num(test_param[:order_id].values.last) > 0
  end
  expect(stamps.orders.orders_grid.grid_column(:order_id).row_num(test_param[:order_id].values.last)).to be > 0
end

Then /^Filter Panel: Collapse Panel$/ do
  stamps.orders.filter_panel.menu_item.collapse.click
end

Then /^Filter Panel: Expand Panel$/ do
  stamps.orders.filter_panel.menu_item.expand.click
end

# todo-Rob In left Filter Panel, expect Shipped Tab Date Printed is today
Then /^[Ii]n left Filter Panel, expect Shipped Tab Date Printed is today$/ do
  today=test_helper.now_plus_mon_dd 0
  stamps.orders.filter_panel.shipped.select.date_printed.sort_descending
  actual_print_date=stamps.orders.filter_panel.shipped.select.date_printed.row 1
end

# todo-Rob is this needed?
Then /^[Ii]n left Filter Panel, expect Shipped Tab Ship Date is today$/ do
end

Then /^[Ii]n left Filter Panel, expect Shipped Tab Ship Date is today plus (\d+)$/ do |day|
end

Then /^[Ii]n left Filter Panel, expect order moved to Shipped$/ do
  stamps.orders.filter_panel.shipped.select.order_date.sort_descending
  expect(stamps.orders.orders_grid.grid_column(:order_id).row_num(test_param[:order_id].values.last)).to be > 0
end

Then /^[Ii]n left Filter Panel, expect order moved to Canceled$/ do
  stamps.orders.filter_panel.canceled.select.order_date.sort_descending
  expect(stamps.orders.filter_panel.canceled.select.order_id.row_num(test_param[:order_id].values.last)).to be > 0
end

Then /^[Ii]n left Filter Panel, expect order moved to Awaiting Shipment$/ do
  stamps.orders.orders_grid.grid_column(:order_date).sort_descending
  expect(stamps.orders.orders_grid.grid_column(:order_id).row_num(test_param[:order_id].values.last)).to be > 0
end

Then /^[Ii]n left Filter Panel, expect Awaiting Shipment count increased by (\d+)$/ do |count|
  expect(stamps.orders.filter_panel.awaiting_shipment.count).to eql test_param[:awaiting_shipment_count].to_i + count.to_i
end

Then /^[Ii]n left Filter Panel, expect Awaiting Shipment count decreased by (\d+)$/ do |count|
  expect(stamps.orders.filter_panel.awaiting_shipment.count).to eql test_param[:awaiting_shipment_count].to_i - count.to_i
end

Then /^[Ii]n left Filter Panel, expect panel arrow is pointing to the (.*) direction$/ do |expectation|
  expect(stamps.orders.filter_panel.get_arrow_direction).to eql expectation
end

Then /^[Ii]n left Filter Panel, expect system updates the grid to show only orders that match the (.*) filter$/ do |expectation|
  expect(stamps.orders.filter_panel.is_order_grid_filtered(expectation)).to be(true)
end

Then /^[Ii]n left Filter Panel, expect system displays expanded filters panel$/ do
  expect(stamps.orders.filter_panel.present?).to be(true), "Filter Panel does not present to the displays"
end

Then /^Filter Panel: Click on panel$/ do
  stamps.orders.filter_panel.menu_item.collapse.click
end

Then /^[Ii]n left Filter Panel, expect Filters panel is close$/ do
  actual=stamps.orders.filter_panel.search_orders.present?
  expect(actual).to be(false)
end

Then /^[Ii]n left Filter Panel, expect system shows an arrow above the Order Status Filter Panel - name$/ do
  stamps.orders.filter_panel.is_header_arrow_present
end

Then /^[Ii]n left Filter Panel, expect Panel is open$/ do
  expect(stamps.orders.filter_panel.present?).to be(true)
end

Then /^[Ii]n left Filter Panel, expect panel is hidden$/ do
  expect(stamps.orders.filter_panel.are_filter_links_present).to eql false
end

Then /^Filter Panel: Click panel name$/ do
  stamps.orders.filter_panel.click_filter_panel_name
end

Then /^Filter Panel: Click on the closed Filters panel$/ do
  stamps.orders.filter_panel.click_closed_filter_panel
end


Then /^[Ii]n left Filter Panel, expect printed Order ID is not in Awaiting Shipment tab$/ do
  grid=stamps.orders.filter_panel.awaiting_shipment.select
  row1_order_id=grid.order_id.row(1)
  expect((test_param[:order_id].values.last).include? row1_order_id).is false
end

Then /^[Ii]n left Filter Panel, expect all printed Order IDs not in Awaiting Shipment tab$/ do
  test_param[:order_id].values.last.should_not include stamps.orders.filter_panel.awaiting_shipment.select.order_id.row(1)
  test_param[:order_id].values.last.should_not include stamps.orders.filter_panel.awaiting_shipment.select.order_id.row(2)
  test_param[:order_id].values.last.should_not include stamps.orders.filter_panel.awaiting_shipment.select.order_id.row(3)
end

Then /^[Ii]n left Filter Panel, expect printed Order ID is in Shipped tab$/ do
  stamps.orders.filter_panel.shipped.select.order_id.sort_descending
  stamps.orders.filter_panel.shipped.select.order_id.sort_descending
  expect(stamps.orders.filter_panel.shipped.select.order_id.row(1)).to eql test_param[:order_id].values.last
end

Then /^[Ii]n left Filter Panel, expect all printed Order IDs are in Shipped tab$/ do
  expect(test_param[:order_id].values.last).to include grid.order_id.row(3)
  expect(test_param[:order_id_2]).to include grid.order_id.row(2)
  expect(test_param[:order_id_3]).to include grid.order_id.row(1)
end



