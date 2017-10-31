
Then /^[Oo]pen Orders Stores Settings$/ do
  #test_config.logger.step "Manage Stores: Open Modal"
  stamps.orders.orders_settings.stores_tab
end

Then /^[Cc]lick Order Settings Stores Add button$/ do
  #test_config.logger.step "Manage Stores: Add"
  stamps.orders.orders_settings.stores_tab.add
end

Then /^[Cc]lick Order Settings Stores Edit button$/ do
  #stamps.orders.orders_settings.stores.edit
end

Then /^[Cc]lick Order Settings Stores Reconnect button$/ do
  #stamps.orders.orders_settings.stores.reconnect
end

Then /^[Cc]lick Order Settings Stores Delete button$/ do
  #stamps.orders.orders_settings.stores.delete
end

Then /^[Ss]elect Order Settings Store name (.*)$/ do |store|
  #stamps.orders.orders_settings.stores.select store
end

Then /^[Ee]xpect Order Settings Store name (.*) to be present$/ do |store|
  expect(stamps.orders.orders_settings.stores.store_list(store)).to be_present
end



Then /^Manage Stores: Close Modal$/ do
  #test_config.logger.step "Manage Stores: Close Modal"
  @manage_stores.close
end

Then /^Manage Stores: Delete Row (\d+)$/ do |row|
  #test_config.logger.step "Manage Stores: Delete Row #{row}"
  step "Manage Stores: Open Modal"
  grid = @manage_stores.stores_grid
  size = grid.size
  #test_config.logger.step "Grid Count before delete is #{size}"
  delete_modal = @manage_stores.stores_grid.delete_row row
  delete_modal.delete
  expect(delete_modal.present?).not_to be(true)
end

Then /^Manage Stores: Select Store (.*)$/ do |store_name|
  test_param[:store_name] = (store_name.downcase.include? 'random')?test_param[:store_name]:store_name
  #test_config.logger.step "Manage Stores: Select Store #{test_data[:store_name]}"
  raise "Unble to select store name: #{test_param[:store_name]}.  Either it's nil or does not exist in the modal.  Check your test." if test_param[:store_name].nil?
  raise "Store name can't be nil or an empty String" if test_param[:store_name].nil? || test_param[:store_name].size == 0
  @manage_stores.stores_grid.select(test_param[:store_name])
end

Then /^Manage Stores: Delete All Stores$/ do
  #test_config.logger.step "Manage Stores: Delete All Stores"
  @manage_stores.stores_grid.delete_all
end

Then /^Manage Stores: Delete$/ do
  #test_config.logger.step "Manage Stores: Delete"
  @manage_stores.delete_item.delete
end

Then /^Manage Stores: Reconnect$/ do
  #test_config.logger.step "Manage Stores: Reconnect"
  @store = @manage_stores.reconnect
end

Then /^Manage Stores: Edit$/ do
  #test_config.logger.step "Manage Stores: Edit"
  @store_settings = @manage_stores.edit
  test_result = "Store Settings modal is #{(@store_settings.present?)?"present":"not present"} - Test #{(@store_settings.present?)?"passed":"failed"}"
  test_config.logger.step test_result
  if @store_settings.nil? || !(@store_settings.present?)
    raise test_result
  end
end

Then /^Manage Stores: Expect Manage Stores grid contains (.*)$/ do |grid_item|

end


