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
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1
    Then set print form email tracking aanand@stamps.com
    Then set print form weight to lbs 0 oz 1
    Then select print form service PM Large/Thick Envelope
    Then set print form insure for to $1
    Then click mail toolbar print label
    Then confirm print on gif printing dialog
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then hover on navigation history then select File an Insurance Claim
    Then set search prints to newly added tracking number on history filter panel
    Then click search icon on history filter panel
    Then check row for saved tracking number on history grid

  #File Claim - Transaction Detail Printed Section
    Then expect file claim link on the transaction detail panel is available
    Then expect file claim link on the transaction detail panel is enabled
    Then click file claim link on transaction detail panel
    Then expect insurance claim form modal is displayed
    Then click close button on insurance claim form modal
    Then expect insurance claim form modal is not displayed

  #Email Tracking Info - Transaction Detail Printed Section
    Then expect email tracking info link on the transaction detail panel is available
    Then expect email tracking info link on the transaction detail panel is enabled
    Then click email tracking info link on transaction detail panel

   # File Claim - Transaction Detail Services Section
    Then expect file claim link in services section of transaction detail panel is available
    Then expect file claim link in services section of transaction detail panel is enabled
    Then click file claim link in services section of transaction detail panel
    Then expect insurance claim form modal is displayed
    Then click close button on insurance claim form modal
    Then expect insurance claim form modal is not displayed

    #Email Tracking Info- Transaction Detail Menu Dropdown
    Then click transaction details header menu dropdown
    Then expect email tracking info link on the transaction detail menu dropdown is available
    Then click email tracking info link on transaction detail menu dropdown
    #Then expect insurance claim form modal is displayed

    #Print Receipt - Transaction Detail Menu Dropdown
    Then expect print receipt link on the transaction detail menu dropdown is available
    Then click print receipt link on transaction detail menu dropdown
    #Then expect insurance claim form modal is displayed

    # File Claim - Transaction Detail Menu Dropdown
    Then expect file claim link on the transaction detail menu dropdown is available
    Then click file claim link on transaction detail menu dropdown
    Then expect insurance claim form modal is displayed
    Then click cancel button on insurance claim form modal






