Feature: Print a Label Without SDC Insurance

  Background:
    Given Start test driver
    Then sign-in to mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then set print form mail-from to default
    Then show advanced options
    Then set print form mail-to to address random name, random company, Attn RMA Department, 3345 Point Pleasant Road, Hebron, KY 41048-9711
    Then select print form service PM Flat Rate Envelope
    Then set print form weight to lbs 0 oz 1
    Then set print form weight to lbs 0 oz 1
    Then set print form tracking USPS Tracking
    Then set print form reference number random
    Then set print form cost code to None
    Then click print label
    Then click continue on confirm print modal
    Then cancel print on gif printing dialog
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel


  @label_domestic_without_sdc_ins
  Scenario: History: View Transaction Details for Refund Postage with out SDC Insurance
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
    Then expect file claim link on the transaction detail menu dropdown is not present
    Then expect collapse panel link on the transaction detail menu dropdown is present
    Then click transaction details header menu dropdown
    #Printed Status Section
    Then expect printed status on history transaction details is present
    Then expect tracking number on history transaction details is correct
    Then except create return label on history transaction details is enabled
    Then expect email tracking info on history transaction details is enabled
    Then expect file claim link on the transaction detail panel is not present
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
    Then expect file claim link in services section of transaction detail panel is not present
    Then expect price on services history transaction details is correct
    Then expect tracking on services history transaction details is correct
    Then expect weight on services history transaction details is correct
    #References Section
    Then expect cost code on history transaction details is correct
    Then expect reference on history transaction details is correct
    Then expect user on history transaction details is correct
    Then sign out




