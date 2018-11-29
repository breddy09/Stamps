
Feature:  History Details Addresses displayed in Ship to Field

  Background:
    Given Start test driver

  @transaction_address_4lines
  Scenario: History: Transaction Details displays Outgoing Address of Four Lines
    Then sign-in to mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then set print form mail-from to default
    Then set print form mail-to to address random name, random company, 3217 Shasta Circle S., Los Angeles, CA 90065
    Then set print form email tracking sdoma@stamps.com
    Then select print form service PM Large/Thick Envelope
    Then set print form weight to lbs 0 oz 1
    Then click print label
    Then click continue on confirm print modal
    Then cancel print on gif printing dialog
    #Then confirm print on gif printing dialog
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then navigate to History
    Then set search prints tracking number on history filter panel to newly added
    Then click search icon on history filter panel
    Then check row for saved tracking number on history grid
    Then expect address shipped to in history transaction details displayed correct
    Then expect address shipped to contains 5 lines
    Then sign out