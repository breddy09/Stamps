Then /^set store settings store nickname to ([\w\.@]+)$/ do |str|
  stamps.orders.marketplace.store_settings.store_nickname.set(str)
end

Then /^select store settings shipping service to ([\w \/]+)$/ do |str|
  expect(stamps.orders.marketplace.store_settings.shipping_service.select(str)).to include(str)
end

Then /^expect store settings (\w+) modal is present$/ do |store_name|
  expect(stamps.orders.marketplace.store_settings.window_title.text).to eql("#{store_name} Settings")
end

Then /^Store Settings: Set Store Nickname to (.*)$/ do |nickname|
  #test_config.logger.step "Store Settings: Set Store Nickname to #{nickname}"
  raise "Store Settings is not open.  Check your test workflow." if @store_settings.nil?
  #test_config.logger.step "Old Amazon Store Name:#{test_data[:store_name]}"
  test_param[:store_name]=(nickname.downcase.include? 'random')?StampsTest.rand_alpha_numeric(20):nickname
  #test_config.logger.step "Store Nickname: #{test_data[:store_name]}"
  @store_settings.store_nickname.set test_param[:store_name]
end

Then /^[Aa]dd new store service mapping$/ do
  @store_settings.add_new_service_mapping.click
end

Then /^[Ss]et store service Mapping (\d+), Requested Services (.*), Shipping service (.*)$/ do |item_number, requested_services, shipping_service|
  #test_config.logger.step "Store Settings: Set Requested Services to random #{requested_services}"
  raise "Amazon Settings is not open.  Check your test workflow." if @store_settings.nil?

  service_mapping_item =@store_settings.service_mapping.item item_number.to_i
  service_mapping_item.requested_services.set(requested_services.downcase.include? 'random')?StampsTest.rand_alpha_numeric(20):requested_services
  service_mapping_item.shipping_Service.select shipping_service
end

Then /^Store Settings: Set Automatically Import New Orders to checked$/ do
  #test_config.logger.step "Store Settings: Set Automatically Import New Orders to checked"
  raise "Amazon Settings is not open.  Check your test workflow." if @store_settings.nil?
  sleep(0.35)
  @store_settings.automatically_import_new_web_apps.orders.check
end

Then /^Store Settings: Uncheck Automatically Import New Orders$/ do
  #test_config.logger.step "Store Settings: Uncheck Automatically Import New Orders"
  raise "Amazon Settings is not open.  Check your test workflow." if @store_settings.nil?
  sleep(0.35)
  @store_settings.automatically_import_new_web_apps.orders.uncheck
end

Then /^Store Settings: Save$/ do
  raise "Amazon Settings is not open.  Check your test workflow." if @store_settings.nil?
  @store_settings.save
end
