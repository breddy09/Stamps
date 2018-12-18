Feature: Refund Postage

  Background:
    Given Start test driver


  @net_stamps_domestic
  Scenario: History: View Transaction Details for Refund Postage for Print Stamps
    Then sign-in to mail
    Then select print on Stamps
    Then set print form mail-from to default
    Then show advanced options
    Then set print form serial number to random
    Then set print form weight to lbs 0 oz 1
    Then select print form service FCM Letter
    Then set print form reference number 12345
    Then set print form cost code to None
    Then set print form quantity to 2
    Then click print stamps
    Then click continue on confirm print modal
    Then cancel print on gif printing dialog
    Then hover on navigation history then select Request a Postage Refund
    Then expect date printed on history filter panel is collapsed
    Then expect eligible for on history filter panel is expanded
    Then expect refund on history filter panel eligible for is selected
    Then check row 1 on history grid
    Then expect transaction details for single print is available
    Then click transaction details header menu dropdown
    Then expect print receipt link on the transaction detail menu dropdown is available
    Then expect collapse panel link on the transaction detail menu dropdown is available
    Then click transaction details header menu dropdown
    Then expect printed status on history transaction details is present
    Then except create return label on history transaction details is disabled
    Then expect email tracking info on history transaction details is disabled
    Then expect file claim link on the transaction detail panel is not available
    Then expect services is present on history transaction details
    Then expect service total on history transaction details is correct
    Then expect carrier on services history transaction details is correct
    Then expect service on services history transaction details is correct
    Then expect file claim link in services section of transaction detail panel is not available
    Then expect price on services history transaction details is correct
    Then expect weight on services history transaction details is correct
    Then expect cost code on history transaction details is correct
    Then expect reference on history transaction details is correct
    Then expect user on history transaction details is correct
    Then sign out


  @label_domestic_with_sdc_ins
  Scenario: History: View Transaction Details for Refund Postage with SDC Insurance
    Then sign-in to mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then set print form mail-from to default
    Then show advanced options
    Then set print form mail-to to address random name, random company, Attn RMA Department, 3345 Point Pleasant Road, Hebron, KY 41048-9711
    Then select print form service PM Flat Rate Envelope
    Then set print form weight to lbs 0 oz 1
    Then set print form insure for to $1.00
    Then set print form tracking USPS Tracking
    Then set print form reference number 12345
    Then set print form cost code to None
    Then click print label
    Then click continue on confirm print modal
    Then cancel print on gif printing dialog
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then hover on navigation history then select Request a Postage Refund
    Then expect date printed on history filter panel is collapsed
    Then expect eligible for on history filter panel is expanded
    Then expect refund on history filter panel eligible for is selected
    Then set search prints tracking number on history filter panel to newly added
    Then click search icon on history filter panel
    Then check row for saved tracking number on history grid
    Then expect transaction details for single print is available
    Then click transaction details header menu dropdown
    Then expect create return label link on the transaction detail menu dropdown is available
    Then expect email tracking info link on the transaction detail menu dropdown is available
    Then expect track on usps.com link on the transaction detail menu dropdown is available
    Then expect print receipt link on the transaction detail menu dropdown is available
    Then expect file claim link on the transaction detail menu dropdown is available
    Then expect collapse panel link on the transaction detail menu dropdown is available
    Then click transaction details header menu dropdown
    Then expect printed status on history transaction details is present
    Then expect tracking number on history transaction details is correct
    Then except create return label on history transaction details is enabled
    Then expect email tracking info on history transaction details is enabled
    Then expect file claim link on the transaction detail panel is available
    Then expect file claim link on the transaction detail panel is enabled
    Then expect address shipped to in history transaction details displayed correct
    Then expect return to address on history transaction details is default
    Then expect services is present on history transaction details
    Then expect service total on history transaction details is correct
    Then expect carrier on services history transaction details is correct
    Then expect service on services history transaction details is correct
    Then expect packaging on services history transaction details is correct
    Then expect file claim link in services section of transaction detail panel is available
    Then expect file claim link in services section of transaction detail panel is enabled
    Then expect price on services history transaction details is correct
    Then expect insurance on services history transaction details is correct
    Then expect tracking on services history transaction details is correct
    Then expect weight on services history transaction details is correct
    Then expect cost code on history transaction details is correct
    Then expect reference on history transaction details is correct
    Then expect user on history transaction details is correct
    Then sign out


  @label_domestic_without_sdc_ins
  Scenario: History: View Transaction Details for Refund Postage with SDC Insurance
    Then sign-in to mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then set print form mail-from to default
    Then show advanced options
    Then set print form mail-to to address random name, random company, Attn RMA Department, 3345 Point Pleasant Road, Hebron, KY 41048-9711
    Then select print form service PM Flat Rate Envelope
    Then set print form weight to lbs 0 oz 1
    Then set print form weight to lbs 0 oz 1
    Then set print form tracking USPS Tracking
    Then set print form reference number 12345
    Then set print form cost code to None
    Then click print label
    Then click continue on confirm print modal
    Then cancel print on gif printing dialog
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then hover on navigation history then select Request a Postage Refund
    Then expect date printed on history filter panel is collapsed
    Then expect eligible for on history filter panel is expanded
    Then expect refund on history filter panel eligible for is selected
    Then set search prints tracking number on history filter panel to newly added
    Then click search icon on history filter panel
    Then check row for saved tracking number on history grid
    Then expect transaction details for single print is available
    Then click transaction details header menu dropdown
    Then expect create return label link on the transaction detail menu dropdown is available
    Then expect email tracking info link on the transaction detail menu dropdown is available
    Then expect track on usps.com link on the transaction detail menu dropdown is available
    Then expect print receipt link on the transaction detail menu dropdown is available
    Then expect file claim link on the transaction detail menu dropdown is not available
    Then expect collapse panel link on the transaction detail menu dropdown is available
    Then click transaction details header menu dropdown
    Then expect printed status on history transaction details is present
    Then expect tracking number on history transaction details is correct
    Then except create return label on history transaction details is enabled
    Then expect email tracking info on history transaction details is enabled
    Then expect file claim link on the transaction detail panel is not available
    Then expect file claim link on the transaction detail panel is enabled
    Then expect address shipped to in history transaction details displayed correct
    Then expect return to address on history transaction details is default
    Then expect services is present on history transaction details
    Then expect service total on history transaction details is correct
    Then expect carrier on services history transaction details is correct
    Then expect service on services history transaction details is correct
    Then expect packaging on services history transaction details is correct
    Then expect file claim link in services section of transaction detail panel is not available
    Then expect price on services history transaction details is correct
    Then expect tracking on services history transaction details is correct
    Then expect weight on services history transaction details is correct
    Then expect cost code on history transaction details is correct
    Then expect reference on history transaction details is correct
    Then expect user on history transaction details is correct
    Then sign out

  @label_domestic_armed_with_sdc_ins
  Scenario: History: View Transaction Details for Refund Postage with SDC Insurance
    Then sign-in to mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then set print form mail-from to default
    Then show advanced options
    Then set print form mail-to to a random address in zone 9
    Then select print form service PM Flat Rate Envelope
    Then set print form weight to lbs 1 oz 0
    Then set print form insure for to $1.00
    Then set print form tracking USPS Tracking
    Then set print form reference number 12345
    Then set print form cost code to None
    Then click print form edit customs form button
    Then expect customs i agree to the usps privacy act statement is unchecked
    Then set customs package contents to Commercial Sample
    Then set customs non-delivery options to Treat as abandoned
    Then set customs internal transaction number to Required
    Then set customs itn number to some random string
    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then click print label
    Then click continue on confirm print modal
    Then cancel print on gif printing dialog
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then hover on navigation history then select Request a Postage Refund
    Then expect date printed on history filter panel is collapsed
    Then expect eligible for on history filter panel is expanded
    Then expect refund on history filter panel eligible for is selected
    Then set search prints tracking number on history filter panel to newly added
    Then click search icon on history filter panel
    Then check row for saved tracking number on history grid
    Then expect transaction details for single print is available
    Then click transaction details header menu dropdown
    Then expect create return label link on the transaction detail menu dropdown is available
    Then expect email tracking info link on the transaction detail menu dropdown is available
    Then expect track on usps.com link on the transaction detail menu dropdown is available
    Then expect print receipt link on the transaction detail menu dropdown is available
    Then expect file claim link on the transaction detail menu dropdown is available
    Then expect collapse panel link on the transaction detail menu dropdown is available
    Then click transaction details header menu dropdown
    Then expect printed status on history transaction details is present
    Then expect tracking number on history transaction details is correct
    Then except create return label on history transaction details is enabled
    Then expect email tracking info on history transaction details is enabled
    Then expect file claim link on the transaction detail panel is available
    Then expect file claim link on the transaction detail panel is enabled
    Then expect address shipped to in history transaction details displayed correct
    Then expect return to address on history transaction details is default
    Then expect services is present on history transaction details
    Then expect service total on history transaction details is correct
    Then expect carrier on services history transaction details is correct
    Then expect service on services history transaction details is correct
    Then expect packaging on services history transaction details is correct
    Then expect file claim link in services section of transaction detail panel is available
    Then expect file claim link in services section of transaction detail panel is enabled
    Then expect price on services history transaction details is correct
    Then expect insurance on services history transaction details is correct
    Then expect tracking on services history transaction details is correct
    Then expect weight on services history transaction details is correct
    Then expect cost code on history transaction details is correct
    Then expect reference on history transaction details is correct
    Then expect user on history transaction details is correct
    Then expect customs information section on history transaction details is present
    Then expect package contents on customer information section of history transaction details is correct
    Then expect non delivery information on customer information section of history transaction details is correct
    Then expect ITN on customs information section of history transaction details is correct
    Then sign out

  @net_stamps_international
  Scenario: History: View Transaction Details for Refund Postage for Print Stamps
    Then sign-in to mail
    Then select print on Stamps
    Then set print form mail-from to default
    Then show advanced options
    Then set print form serial number to random
    Then set print form mail-to country to Albania
    Then set print form weight to lbs 1 oz 1
    Then select print form service FCMI Large Envelope/Flat
    Then set print form reference number 12345
    Then set print form cost code to None
    Then set print form quantity to 2
    Then click print stamps
    Then click continue printing on missing email address modal
    Then click continue on usps terms modal
    Then click agree and continue on missing email address modal
    Then click continue on confirm print modal
    Then cancel print on gif printing dialog
    Then hover on navigation history then select Request a Postage Refund
    Then expect date printed on history filter panel is collapsed
    Then expect eligible for on history filter panel is expanded
    Then expect refund on history filter panel eligible for is selected
    Then check row 1 on history grid
    Then expect transaction details for single print is available
    Then click transaction details header menu dropdown
    Then expect print receipt link on the transaction detail menu dropdown is available
    Then expect collapse panel link on the transaction detail menu dropdown is available
    Then click transaction details header menu dropdown
    Then expect printed status on history transaction details is present
    Then except create return label on history transaction details is disabled
    Then expect email tracking info on history transaction details is disabled
    Then expect file claim link on the transaction detail panel is not available
    Then expect services is present on history transaction details
    Then expect service total on history transaction details is correct
#    Then expect carrier on services history transaction details is correct
    Then expect service on services history transaction details is correct
    Then expect file claim link in services section of transaction detail panel is not available
    Then expect price on services history transaction details is correct
    Then expect weight on services history transaction details is correct
    Then expect cost code on history transaction details is correct
    Then expect reference on history transaction details is correct
    Then expect user on history transaction details is correct
    Then sign out

  @label_international_without_sdc_ins_FCMI_CN22
  Scenario: History: View Transaction Details for Refund Postage with SDC Insurance
    Then sign-in to mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then set print form mail-from to default
    Then show advanced options
    Then set print form ship-to to international address
      | name   | company | street_address1 | street_address2  | city   | province | postal_code | country| phone  |
      | random | random  | random           | random            | random | random   | random      | Mexico | random  |
    Then set print form weight to lbs 0 oz 1
    Then select print form service FCMI Package/Thick Envelope
    Then set print form email tracking test@test.com
    Then click print form edit customs form button
    Then expect customs i agree to the usps privacy act statement is unchecked
    Then set customs package contents to Commercial Sample
    Then set customs non-delivery options to Treat as abandoned
    Then set customs internal transaction number to Required
    Then set customs itn number to some random string
    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set print form weight to lbs 0 oz 1
    Then set print form weight to lbs 0 oz 1
    Then set print form insure for to $1.00
    #Then set print form tracking USPS Tracking
    Then set print form reference number 12345
    Then set print form cost code to None
    Then click print label
    Then click ok on your international label modal
    Then click continue on confirm print modal
    Then cancel print on gif printing dialog
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then hover on navigation history then select Request a Postage Refund
    Then expect date printed on history filter panel is collapsed
    Then expect eligible for on history filter panel is expanded
    Then expect refund on history filter panel eligible for is selected
    Then set search prints tracking number on history filter panel to newly added
    Then click search icon on history filter panel
    Then check row for saved tracking number on history grid
    Then expect transaction details for single print is available
    Then click transaction details header menu dropdown
    Then expect create return label link on the transaction detail menu dropdown is available
    Then expect email tracking info link on the transaction detail menu dropdown is available
    Then expect track on usps.com link on the transaction detail menu dropdown is available
    Then expect print receipt link on the transaction detail menu dropdown is available
    Then expect file claim link on the transaction detail menu dropdown is available
    Then expect collapse panel link on the transaction detail menu dropdown is available
    Then click transaction details header menu dropdown
    Then expect printed status on history transaction details is present
    Then expect tracking number on history transaction details is correct
    Then except create return label on history transaction details is disabled
    Then expect email tracking info on history transaction details is enabled
    Then expect file claim link on the transaction detail panel is available
    Then expect file claim link on the transaction detail panel is enabled
    Then expect address shipped to in history transaction details displayed correct
    Then expect return to address on history transaction details is default
    Then expect services is present on history transaction details
    Then expect service total on history transaction details is correct
    Then expect carrier on services history transaction details is correct
    Then expect service on services history transaction details is correct
    Then expect packaging on services history transaction details is correct
    Then expect file claim link in services section of transaction detail panel is available
    Then expect file claim link in services section of transaction detail panel is enabled
    Then expect price on services history transaction details is correct
    Then expect insurance on services history transaction details is correct
    #Then expect tracking on services history transaction details is correct
    Then expect weight on services history transaction details is correct
    Then expect cost code on history transaction details is correct
    Then expect reference on history transaction details is correct
    Then expect user on history transaction details is correct
    Then expect customs information section on history transaction details is present
    Then expect package contents on customer information section of history transaction details is correct
    Then expect non delivery information on customer information section of history transaction details is correct
    Then expect ITN on customs information section of history transaction details is correct
    #Then expect item description  on customer information section of history transaction details is correct
    Then sign out

  @label_international_without_sdc_ins_PMEI_CP72
  Scenario: History: View Transaction Details for Refund Postage with SDC Insurance
    Then sign-in to mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then set print form mail-from to default
    Then show advanced options
    Then set print form ship-to to international address
      | name   | company | street_address1 | street_address2  | city   | province | postal_code | country| phone  |
      | random | random  | random           | random            | random | random   | random      | Italy | random  |
    Then set print form weight to lbs 0 oz 1
    Then select print form service PMEI Package/Flat/Thick Envelope
    Then click print form edit customs form button
    Then expect customs i agree to the usps privacy act statement is unchecked
    Then set customs package contents to Commercial Sample
    Then set customs non-delivery options to Treat as abandoned
    Then set customs internal transaction number to Required
    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set print form weight to lbs 2 oz 1
    Then set print form insure for to $1.00
    Then set print form reference number 12345
    Then set print form cost code to None
    Then click print label
    Then click ok on your international label modal
    Then click continue on confirm print modal
    Then cancel print on gif printing dialog
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then hover on navigation history then select Request a Postage Refund
    Then expect date printed on history filter panel is collapsed
    Then expect eligible for on history filter panel is expanded
    Then expect refund on history filter panel eligible for is selected
    Then set search prints tracking number on history filter panel to newly added
    Then click search icon on history filter panel
    Then check row for saved tracking number on history grid
    Then expect transaction details for single print is available
    Then click transaction details header menu dropdown
    Then expect create return label link on the transaction detail menu dropdown is available
    Then expect email tracking info link on the transaction detail menu dropdown is available
    Then expect track on usps.com link on the transaction detail menu dropdown is available
    Then expect print receipt link on the transaction detail menu dropdown is available
    Then expect file claim link on the transaction detail menu dropdown is available
    Then expect collapse panel link on the transaction detail menu dropdown is available
    Then click transaction details header menu dropdown
    Then expect printed status on history transaction details is present
    Then expect tracking number on history transaction details is correct
    Then except create return label on history transaction details is disabled
    Then expect email tracking info on history transaction details is enabled
    Then expect file claim link on the transaction detail panel is available
    Then expect file claim link on the transaction detail panel is enabled
    Then expect address shipped to in history transaction details displayed correct
    Then expect return to address on history transaction details is default
    Then expect services is present on history transaction details
    Then expect service total on history transaction details is correct
    Then expect carrier on services history transaction details is correct
    Then expect service on services history transaction details is correct
    Then expect packaging on services history transaction details is correct
    Then expect file claim link in services section of transaction detail panel is available
    Then expect file claim link in services section of transaction detail panel is enabled
    Then expect price on services history transaction details is correct
    Then expect insurance on services history transaction details is correct
    Then expect weight on services history transaction details is correct
    Then expect cost code on history transaction details is correct
    Then expect reference on history transaction details is correct
    Then expect user on history transaction details is correct
    Then expect customs information section on history transaction details is present
    #Then expect package contents on customs information section of history transaction details is correct
    Then expect non delivery information on customer information section of history transaction details is correct
    Then expect ITN on customs information section of history transaction details is correct
    #Then expect item description  on customer information section of history transaction details is correct
    Then sign out


  @label_international_SAS_global_post_economy
  Scenario: History: View Transaction Details for Refund Postage with SDC Insurance
    Then sign-in to mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then set print form mail-from to default
    Then show advanced options
    Then set print form ship-to to international address
      | name   | company | street_address1 | street_address2  | city   | province | postal_code | country| phone  |
      | random | random  | random           | random            | random | random   | random      | Kuwait | random  |
    Then set print form weight to lbs 0 oz 1
    Then select print form service GPE Package/Thick Envelope (Varies)
    Then set print form email tracking rtest@test.com
    Then click print form edit customs form button
    Then expect customs i agree to the usps privacy act statement is unchecked
    Then set customs package contents to Commercial Sample
    Then set customs non-delivery options to Treat as abandoned
    Then set customs internal transaction number to Required
    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set print form insure for to $1.00
    Then set print form reference number 12345
    Then set print form cost code to None
    Then click print label
    Then click ok on your global post label modal
    Then click continue on confirm print modal
    Then cancel print on gif printing dialog
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then hover on navigation history then select Request a Postage Refund
    Then expect date printed on history filter panel is collapsed
    Then expect eligible for on history filter panel is expanded
    Then expect refund on history filter panel eligible for is selected
    Then set search prints tracking number on history filter panel to newly added
    Then click search icon on history filter panel
    Then check row for saved tracking number on history grid
    Then expect transaction details for single print is available
    Then click transaction details header menu dropdown
    Then expect create return label link on the transaction detail menu dropdown is available
    Then expect email tracking info link on the transaction detail menu dropdown is available
    Then expect track on usps.com link on the transaction detail menu dropdown is available
    Then expect print receipt link on the transaction detail menu dropdown is available
    Then expect file claim link on the transaction detail menu dropdown is available
    Then expect collapse panel link on the transaction detail menu dropdown is available
    Then click transaction details header menu dropdown
    Then expect printed status on history transaction details is present
    Then expect tracking number on history transaction details is correct
    Then except create return label on history transaction details is disabled
    Then expect email tracking info on history transaction details is enabled
    Then expect file claim link on the transaction detail panel is available
    Then expect file claim link on the transaction detail panel is enabled
    Then expect address shipped to in history transaction details displayed correct
    Then expect return to address on history transaction details is default
    Then expect services is present on history transaction details
    Then expect service total on history transaction details is correct
    Then expect carrier on services history transaction details is correct
    Then expect service on services history transaction details is correct
    Then expect packaging on services history transaction details is correct
    Then expect file claim link in services section of transaction detail panel is available
    Then expect file claim link in services section of transaction detail panel is enabled
    Then expect price on services history transaction details is correct
    Then expect insurance on services history transaction details is correct
    Then expect weight on services history transaction details is correct
    Then expect cost code on history transaction details is correct
    Then expect reference on history transaction details is correct
    Then expect user on history transaction details is correct
    Then expect customs information section on history transaction details is present
    Then expect package contents on customer information section of history transaction details is correct
    Then expect non delivery information on customer information section of history transaction details is correct
    Then expect ITN on customs information section of history transaction details is correct
    #Then expect item description  on customer information section of history transaction details is correct
    Then expect parcel guard information section on history transaction details is present
    Then expect status of parcel guard information section on history transaction details is correct
    Then expect max claim amount of parcel guard information section on history transaction details is correct
    Then sign out


  @label_international_SAS_global_post_economy_smart_saver
  Scenario: History: View Transaction Details for Refund Postage with SDC Insurance
    Then sign-in to mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then set print form mail-from to default
    Then show advanced options
    Then set print form ship-to to international address
      | name   | company | street_address1 | street_address2  | city   | province | postal_code | country| phone  |
      | random | random  | random           | random            | random | random   | random      | Argentina | random  |
    Then set print form weight to lbs 0 oz 1
    Then select print form service GPSSE Package/Thick Envelope (Varies)
    Then set print form email tracking rtest@test.com
    Then click print form edit customs form button
    Then expect customs i agree to the usps privacy act statement is unchecked
    Then set customs package contents to Commercial Sample
    Then set customs non-delivery options to Treat as abandoned
    Then set customs internal transaction number to Required
    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set print form weight to lbs 0 oz 1
    Then set print form weight to lbs 0 oz 1
    Then set print form insure for to $1.00
    Then set print form reference number 12345
    Then set print form cost code to None
    Then click print label
    Then click ok on your global post label modal
    Then click continue on confirm print modal
    Then cancel print on gif printing dialog
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then hover on navigation history then select Request a Postage Refund
    Then expect date printed on history filter panel is collapsed
    Then expect eligible for on history filter panel is expanded
    Then expect refund on history filter panel eligible for is selected
    Then set search prints tracking number on history filter panel to newly added
    Then click search icon on history filter panel
    Then check row for saved tracking number on history grid
    Then expect transaction details for single print is available
    Then click transaction details header menu dropdown
    Then expect create return label link on the transaction detail menu dropdown is available
    Then expect email tracking info link on the transaction detail menu dropdown is available
    Then expect track on usps.com link on the transaction detail menu dropdown is available
    Then expect print receipt link on the transaction detail menu dropdown is available
    Then expect file claim link on the transaction detail menu dropdown is available
    Then expect collapse panel link on the transaction detail menu dropdown is available
    Then click transaction details header menu dropdown
    Then expect printed status on history transaction details is present
    Then expect tracking number on history transaction details is correct
    Then except create return label on history transaction details is disabled
    Then expect email tracking info on history transaction details is enabled
    Then expect file claim link on the transaction detail panel is available
    Then expect file claim link on the transaction detail panel is enabled
    Then expect address shipped to in history transaction details displayed correct
    Then expect return to address on history transaction details is default
    Then expect services is present on history transaction details
    Then expect service total on history transaction details is correct
    Then expect carrier on services history transaction details is correct
    Then expect service on services history transaction details is correct
    Then expect packaging on services history transaction details is correct
    Then expect file claim link in services section of transaction detail panel is available
    Then expect file claim link in services section of transaction detail panel is enabled
    Then expect price on services history transaction details is correct
    Then expect insurance on services history transaction details is correct
    Then expect weight on services history transaction details is correct
    Then expect cost code on history transaction details is correct
    Then expect reference on history transaction details is correct
    Then expect user on history transaction details is correct
    Then expect customs information section on history transaction details is present
    Then expect package contents on customs information section of history transaction details is correct
    Then expect non delivery information on customs information section of history transaction details is correct
    Then expect ITN on customs information section of history transaction details is correct
    Then expect item description on customs information section of history transaction details is correct
    Then expect parcel guard information section on history transaction details is present
    Then expect status of parcel guard information section on history transaction details is correct
    Then expect max claim amount of parcel guard information section on history transaction details is correct
    Then sign out