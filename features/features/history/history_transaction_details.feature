Feature:  History Transaction Details

  Background:
    Given Start test driver

  @transaction_details_email_tracking_info
  Scenario: History: Email Transaction Details
    Then sign-in to mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then set print form mail-to to a random address in zone 2
    Then select print form service PM Large/Thick Envelope
    Then set print form weight to lbs 0 oz 1
    Then set print form email tracking sdoma@stamps.com
    Then click print label
    Then click continue on confirm print modal
    Then cancel print on gif printing dialog
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then navigate to History
    Then set search prints tracking number on history filter panel to newly added
    Then click search icon on history filter panel
    Then check row for saved tracking number on history grid
    Then expect email tracking info link on the transaction detail panel is available
    Then expect email tracking info link on the transaction detail panel is enabled
    Then click email tracking info link on transaction detail panel
    Then sign out

  @view_single_transaction_details
  Scenario: History: View Transaction Details page
    Then sign-in to mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then set print form mail-from to default
    Then set print form mail-to to address random name, random company, Attn RMA Department, 3345 Point Pleasant Road, Hebron, KY 41048-9711
    Then set print form email tracking sdoma@stamps.com
    Then select print form service PM Large/Thick Envelope
    Then set print form weight to lbs 0 oz 1
    Then set print form weight to lbs 0 oz 1
    Then set print form insure for to $1.00
    Then set print form tracking USPS Tracking
    Then click print label
    Then click continue on confirm print modal
    Then cancel print on gif printing dialog
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then navigate to History
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
    Then expect email tracking info present on history transaction details
    Then expect file claim link on the transaction detail panel is available
    Then expect shipped to field on history transaction details is present
    Then expect shipped from field on history transaction details is present
    Then expect return to field on history transaction details is present
    Then expect carrier field on history transaction details is present
    Then expect service field on history transaction details is present
    Then expect packing field on history transaction details is present
    Then expect insurance field on history transaction details is present
    Then expect tracking field on history transaction details is present
    Then expect weight field on history transaction details is present
    Then expect cost code field on history transaction details is present
    Then expect user field on history transaction details is present
    Then expect printed on field on history transaction details is present
    Then sign out

  @view_multiple_transaction_details
  Scenario: History: View Transaction Details page
    Then sign-in to mail
    Then navigate to History
    Then check row 1 on history grid
    Then save history grid recipient name in recipient column at row 1
    Then check row 2 on history grid
    Then save history grid recipient name in recipient column at row 2
    Then expect transaction details for multiple print is available
    Then expect recipient names in history details is correct
    Then click transaction multiple details header menu dropdown
    Then expect collapse panel link on the transaction multiple detail menu dropdown is available
    Then sign out