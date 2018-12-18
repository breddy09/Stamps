Feature: Print a Label for Global Post Economy Smart Saver  With SDC Insurance

  Background:
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
    Then set print form insure for to $1.00
    Then set print form reference number random
    Then set print form cost code to None
    Then click print label
    Then click ok on your global post label modal
    Then click continue on confirm print modal
    Then cancel print on gif printing dialog
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel


  @label_international_SAS_global_post_economy_smart_saver
  Scenario: History: View Transaction Details for Refund Postage with SDC Insurance for Global Post Economy
    Then hover on navigation history then select Request a Postage Refund
    Then expect date printed on history filter panel is collapsed
    Then expect eligible for on history filter panel is expanded
    Then expect refund on history filter panel eligible for is selected
    Then set search prints tracking number on history filter panel to newly added
    Then click search icon on history filter panel
    Then check row for saved tracking number on history grid
    Then expect transaction details for single print is present
     #Validation of Header menu
    Then click transaction details header menu dropdown
    Then expect create return label link on the transaction detail menu dropdown is present
    Then expect email tracking info link on the transaction detail menu dropdown is present
    Then expect track on usps.com link on the transaction detail menu dropdown is present
    Then expect print receipt link on the transaction detail menu dropdown is present
    Then expect file claim link on the transaction detail menu dropdown is present
    Then expect collapse panel link on the transaction detail menu dropdown is present
    Then click transaction details header menu dropdown
    #Printed Section
    Then expect printed status on history transaction details is present
    Then expect tracking number on history transaction details is correct
    Then except create return label on history transaction details is disabled
    Then expect email tracking info on history transaction details is enabled
    Then expect file claim link on the transaction detail panel is present
    Then expect file claim link on the transaction detail panel is enabled
    #Addresses Section
    Then expect address shipped to in history transaction details displayed correct
    Then expect return to address on history transaction details is default
    #Services Section
    Then expect services is present on history transaction details
    Then expect service total on history transaction details is correct
    Then expect carrier on services history transaction details is correct
    Then expect service on services history transaction details is correct
    Then expect packaging on services history transaction details is correct
    Then expect file claim link in services section of transaction detail panel is present
    Then expect file claim link in services section of transaction detail panel is enabled
    Then expect price on services history transaction details is correct
    Then expect insurance on services history transaction details is correct
    Then expect weight on services history transaction details is correct
    Then expect cost code on history transaction details is correct
    Then expect reference on history transaction details is correct
    Then expect user on history transaction details is correct
    #Customs Infomation Section
    Then expect customs information section on history transaction details is present
    Then expect package contents on customer information section of history transaction details is correct
    Then expect non delivery information on customer information section of history transaction details is correct
    Then expect ITN on customs information section of history transaction details is correct
    #Then expect item description  on customer information section of history transaction details is correct
    #Parcel Guard Information Section
    Then expect parcel guard information section on history transaction details is present
    Then expect status of parcel guard information section on history transaction details is correct
    #Then expect max claim amount of parcel guard information section on history transaction details is correct
    Then sign out










