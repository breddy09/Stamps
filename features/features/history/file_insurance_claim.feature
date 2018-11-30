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

  @file_claim_link_for_print_with_sdc_insurance
  Scenario: Verify File an Insurance Claim will allow users to File Claim for print with SDC Insurance
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1
    Then set print form email tracking aanand@stamps.com
    Then set print form weight to lbs 0 oz 1
    Then select print form service PM Large/Thick Envelope
    Then set print form insure for to $1
    Then click mail toolbar print label
    Then click continue on confirm print modal
    Then cancel print on gif printing dialog
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then hover on navigation history then select File an Insurance Claim
    Then set search prints to newly added tracking number on history filter panel
    Then click search icon on history filter panel
    Then check row for saved tracking number on history grid
   #F ile Claim - Transaction Detail Printed Section
    Then expect file claim link on the transaction detail panel is available
    Then expect file claim link on the transaction detail panel is enabled
   # File Claim - Transaction Detail Services Section
    Then expect file claim link in services section of transaction detail panel is available
    Then expect file claim link in services section of transaction detail panel is enabled
   # File Claim - Transaction Detail Menu Dropdown
    Then click transaction details header menu dropdown
    Then expect file claim link on the transaction detail menu dropdown is available
    Then sign out

  @file_claim_link_for_print_with_extra_services_usps_insurance
  Scenario: Verify File an Insurance Claim will not allow users to File Claim for print with USPS Insurance via Extra Services
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1
    Then set print form email tracking aanand@stamps.com
    Then set print form weight to lbs 0 oz 1
    Then select print form service PM Large/Thick Envelope
    Then click select extra services button on print form
    Then set extra services security to USPS Insurance
    Then set extra services security value to 1
    Then save extra services
    Then click mail toolbar print label
    Then click continue on confirm print modal
    Then cancel print on gif printing dialog
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then hover on navigation history then select File an Insurance Claim
    Then set search prints to newly added tracking number on history filter panel
    Then click search icon on history filter panel
    Then check row for saved tracking number on history grid
   # File Claim - Transaction Detail Printed Section
    Then expect file claim link on the transaction detail panel is not available
   # File Claim - Transaction Detail Services Section
    Then expect file claim link in services section of transaction detail panel is not available
   # File Claim - Transaction Detail Menu Dropdown
    Then click transaction details header menu dropdown
    Then expect file claim link on the transaction detail menu dropdown is not available
    Then sign out


  @history_file_claim
  Scenario: Verify File an Insurance Claim will allow users to File Claim for print with SDC Insurance
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1
    Then set print form email tracking aanand@stamps.com
    Then set print form weight to lbs 0 oz 1
    Then select print form service PM Large/Thick Envelope
    Then set print form insure for to $1
    Then click mail toolbar print label
    Then click continue on confirm print modal
    Then cancel print on gif printing dialog
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

     # File Claim - Transaction Detail Menu Dropdown
    Then expect file claim link on the transaction detail menu dropdown is available
    Then click file claim link on transaction detail menu dropdown
    Then expect insurance claim form modal is displayed
    Then click close button on insurance claim form modal
    Then expect insurance claim form modal is not displayed

       # File Claim - Transaction Detail Services Section
    Then expect file claim link in services section of transaction detail panel is available
    Then expect file claim link in services section of transaction detail panel is enabled
    Then click file claim link in services section of transaction detail panel
    Then expect insurance claim form modal is displayed
    Then expect package recipient's name field on insurance claim form modal is present
    Then expect package recipient's name value on insurance claim form modal is blank
    Then expect date mailed field on insurance claim form modal is present
    Then expect date mailed value on insurance claim form modal is correct
    Then expect customer id field on insurance claim form modal is present
    Then expect customer id value on insurance claim form modal is correct
    Then expect insurance id field on insurance claim form modal is present
    Then expect insurance id value on insurance claim form modal is correct
    Then expect claim type field on insurance claim form modal is present
    Then expect claim type value on insurance claim form modal is loss

    # Validation of fields on Insurance Claim Form Modal

    Then sign out






