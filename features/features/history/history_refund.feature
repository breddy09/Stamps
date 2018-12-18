Feature:  History :Create Scan Form

  Background:
    Given Start test driver
    Then sign-in to mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then set print form mail-from to default
    Then set print form mail-to to address Diana Dolly, random company, Attn RMA Department, 3345 Point Pleasant Road, Hebron, KY 41048-9711
    Then select print form service PM Large/Thick Envelope
    Then set print form weight to lbs 0 oz 1
    Then click print label
    Then click continue on confirm print modal
    Then cancel print on gif printing dialog
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then navigate to History

  @history_refund
  Scenario: Verify Request a Postage Refund Page loads
    Then hover on navigation history then select Request a Postage Refund
    Then set search prints tracking number on history filter panel to newly added
    Then click search icon on history filter panel
    Then check row 1 on history grid
    Then expect shipment status is Printed
    Then expect refund button on history toolbar is enabled
    Then click refund button on history toolbar
    Then expect refund modal on history is present
    Then click submit button on refund modal
    Then close refund modal on history
    Then set search prints tracking number on history filter panel to newly added
    Then click search icon on history filter panel
    Then check row 1 on history grid
    Then expect shipment status is Refund Pending

    Then sign out





