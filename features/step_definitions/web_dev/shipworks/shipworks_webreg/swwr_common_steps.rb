Then /^WL: navigates to default registration page for shipworks with the following offer id (?:random value|(.*))$/ do |str|

  step 'WL: establish stamps website db connection'
  common_page = SWWR.common_page
  if str.nil?
    source_id,  promo_code, offer_id, target_url = common_page.sww_website_source_id_query(nil)
  else
    source_id,  promo_code, offer_id, target_url  = common_page.sww_website_source_id_query(str)
  end
  step 'WL: close stamps website db connection'

  SWWR::SwwWebsite.visit(source_id)
  common_page.shipworks_logo.wait_until_present(timeout: 10)
  expect(SdcPage.browser.url).to include(target_url.to_s)

  if TestSession.env.local_browser
      common_page.try_it_free[1].click
  else
    common_page.try_it_free[0].click
  end

  SdcLogger.debug "Source_id = #{source_id}"
  SdcLogger.debug "Offer_id = #{offer_id}"

  TestData.hash[:source_id] = source_id
  TestData.hash[:promo_code] = promo_code
  TestData.hash[:offer_id] = offer_id
  TestData.hash[:target_url] = target_url
end