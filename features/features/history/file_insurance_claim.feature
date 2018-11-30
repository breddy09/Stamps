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

  @history_details_file_ins_claim_print_receipt
  Scenario: Verify Transaction Details page in File an Insurance Claim view will allow user to "Print Receipt"
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1
    Then set print form email tracking aanand@stamps.com
    Then set print form weight to lbs 0 oz 1
    Then select print form service PM Large/Thick Envelope
    Then set print form insure for to $2
    Then click mail toolbar print label
    Then click continue on confirm print modal
    Then cancel print on gif printing dialog
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then hover on navigation history then select File an Insurance Claim
    Then set search prints to newly added tracking number on history filter panel
    Then click search icon on history filter panel
    Then check row for saved tracking number on history grid
    Then navigate to History
    Then set search prints tracking number on history filter panel to newly added
    Then click search icon on history filter panel
    Then check row for saved tracking number on history grid
    Then click transaction details header menu dropdown
    Then expect print receipt link on the transaction detail menu dropdown is available
    Then click print receipt link on transaction detail menu dropdown
    Then sign out

  @history_details_file_ins_claim_email_tracking_info
  Scenario: Verify Transaction Details page in File an Insurance Claim view will allow user to "Email Tracking Info" from Print Details
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1
    Then set print form email tracking aanand@stamps.com
    Then set print form weight to lbs 0 oz 1
    Then select print form service PM Large/Thick Envelope
    Then set print form insure for to $2
    Then click mail toolbar print label
    Then click continue on confirm print modal
    Then cancel print on gif printing dialog
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then hover on navigation history then select File an Insurance Claim
    Then set search prints to newly added tracking number on history filter panel
    Then click search icon on history filter panel
    Then check row for saved tracking number on history grid
    Then navigate to History
    Then set search prints tracking number on history filter panel to newly added
    Then click search icon on history filter panel
    Then check row for saved tracking number on history grid
    Then click transaction details header menu dropdown
    Then expect email tracking info link on the transaction detail panel is available
    Then expect email tracking info link on the transaction detail panel is enabled
    Then click email tracking info link on transaction detail panel
    Then sign out



