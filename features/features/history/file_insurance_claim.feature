Feature:  History :File an Insurance Claim

  Background:
    Given Start test driver


  @file_insurance_claim
  Scenario: Verify File Insurance Claim Page loads and Date Selections Drop Down menu is available
    Then sign-in to orders
    Then hover on navigation history then select File an Insurance Claim
    Then expect date printed on history filter panel is collapsed
    Then expect eligible for on history filter panel is expanded
    Then expect default selected value on eligible for history filter panel is insurance claim
    Then sign out

  @file_claim
  Scenario: Verify clicking "File Claim" icon in Transaction Details page will display Insurance Claim Form popup.
    Then sign-in to mail
#    Then select print on Shipping Label - 8 ½" x 11" Paper
#    Then set print form mail-from to default
#    Then set print form mail-to to a random address in zone 1
#    Then set print form weight to lbs 0 oz 1
#    Then select print form service PM Large/Thick Envelope
#    Then click mail toolbar print label
#    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
#    Then save tracking number on print form message panel
    #Then hover on navigation history then select File an Insurance Claim
    Then navigate to History
#    Then set search prints to newly added tracking number on history filter panel
#    Then click search icon on history filter panel
#    Then check row for saved tracking number on history grid
    Then check row 1 on history grid
    Then expect file claim link on the transaction detail panel is available
    Then expect file claim link on the transaction detail panel is enabled
    Then click file claim link on transaction detail panel
    Then expect file claim modal is displayed
    Then click close button on insurance claim form modal
    Then expect insurance claim form modal
    Then expect file claim link on the transaction detail menu dropdown is available
    Then click file claim link on transaction detail menu dropdown
    Then expect file claim modal is displayed
    Then click cancel button on insurance claim form modal




