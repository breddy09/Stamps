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