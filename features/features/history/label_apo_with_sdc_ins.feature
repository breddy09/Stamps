Feature: Print a Label With SDC Insurance for APO address

  Background:
    Given Start test driver
    Then sign-in to mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then set print form mail-from to default
    Then show advanced options
    Then set print form mail-to to a random address in zone 9
    Then select print form service PM Flat Rate Envelope
    Then set print form weight to lbs 1 oz 0
    Then set print form insure for to $1.00
    Then set print form tracking USPS Tracking
    Then set print form reference number random
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


  @label_domestic_armed_with_sdc_ins
  Scenario: History: View Transaction Details for Refund Postage with SDC Insurance for APO address
    Then hover on navigation history then select Request a Postage Refund
    Then expect date printed on history filter panel is collapsed
    Then expect eligible for on history filter panel is expanded
    Then expect refund on history filter panel eligible for is selected
    Then set search prints tracking number on history filter panel to newly added
    Then click search icon on history filter panel
    Then check row for saved tracking number on history grid
    Then expect transaction details for single print is present
    # Validation of header menu dropdown
    Then click transaction details header menu dropdown
    Then expect create return label link on the transaction detail menu dropdown is present
    Then expect email tracking info link on the transaction detail menu dropdown is present
    Then expect track on usps.com link on the transaction detail menu dropdown is present
    Then expect print receipt link on the transaction detail menu dropdown is present
    Then expect file claim link on the transaction detail menu dropdown is present
    Then expect collapse panel link on the transaction detail menu dropdown is present
    Then click transaction details header menu dropdown
      #Printed Status Section
    Then expect printed status on history transaction details is present
    Then expect tracking number on history transaction details is correct
    Then except create return label on history transaction details is enabled
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
    Then expect tracking on services history transaction details is correct
    Then expect weight on services history transaction details is correct
    #References Section
    Then expect cost code on history transaction details is correct
    Then expect reference on history transaction details is correct
    Then expect user on history transaction details is correct
    #Customs Information Section
    Then expect customs information section on history transaction details is present
    Then expect package contents on customer information section of history transaction details is correct
    Then expect non delivery information on customer information section of history transaction details is correct
    Then expect ITN on customs information section of history transaction details is correct
    Then sign out



