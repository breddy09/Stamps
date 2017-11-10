Then /^Yahoo Store: Set Yahoo Store ID to (.*)$/ do |store_id|
  #test_config.logger.step "Yahoo Store: Set Yahoo Store ID to #{store_id}"
  @store.store_id.set store_id
end

Then /^Yahoo Store: Set Partner Store Contract Token to (.*)$/ do |token|
  #test_config.logger.step "Yahoo Store: Set Partner Store Contract Token to #{token}"
  @store.contact_token.set token
end

Then /^Yahoo Store: Set First Order ID to Import to (.*)$/ do |order_id|
  #test_config.logger.step "Yahoo Store: Set First Order ID to Import to #{order_id}"
  @store.first_order_id_to_import.set order_id
end

Then /^Yahoo Store: Connect$/ do
  #test_config.logger.step "Yahoo Store: Connect"
  @store_settings=@store.connect
  test_config.logger.step @store_settings.present?
end

Then /^Yahoo Store: Reconnect$/ do
  #test_config.logger.step "Yahoo Store: Reconnect"
  @store_settings=@store.reconnect
  test_config.logger.step @store_settings.present?
end

Then /^Yahoo Store: Set Order Source to Non-Yahoo$/ do
  #test_config.logger.step "Yahoo Store: Set Order Source to Non-Yahoo"
  @store.order_source.non_amazon
end

Then /^Yahoo Store: Set Product Identifier to Use SKU$/ do
  #test_config.logger.step "Yahoo Store: Set Product Identifier to User SKU"
  @store.product_identifier.use_sku
end

Then /^Yahoo Store: Set Product Identifier to Use the ASIN$/ do
  #test_config.logger.step "Yahoo Store: Set Product Identifier to Use the ASIN"
  @store.product_identifier.use_asin
end

Then /^Yahoo Store: Connect for the first time expecting Yahoo Settings modal$/ do
  #test_config.logger.step "Yahoo Store: Connect for the first time expecting Yahoo Settings modal"
  @store_settings=@store.connect_expecting_store_settings
  test_result="Yahoo Store Settings modal is #{(@store_settings.present?)?"present":"not present"} - Test #{(@store_settings.present?)?"passed":"failed"}"
  test_config.logger.step test_result
  if @store_settings.nil?||!(@store_settings.present?)
    raise test_result
  end
end