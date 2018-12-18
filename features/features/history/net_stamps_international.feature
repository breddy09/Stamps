Feature: Print a Net Stamps International

  Background:
    Given Start test driver
    Then sign-in to mail
    Then select print on Stamps
    Then set print form mail-from to default
    Then show advanced options
    Then set print form serial number to random
    Then set print form mail-to country to Albania
    Then set print form weight to lbs 1 oz 1
    Then select print form service FCMI Large Envelope/Flat
    Then set print form reference number random
    Then set print form cost code to None
    Then set print form quantity to 2
    Then click print stamps
    Then click continue printing on missing email address modal
    Then click continue on usps terms modal
    Then click agree and continue on missing email address modal
    Then click continue on confirm print modal
    Then cancel print on gif printing dialog

  @net_stamps_international
  Scenario: History: View Transaction Details for Refund Postage for Print Stamps
    Then hover on navigation history then select Request a Postage Refund
    Then expect date printed on history filter panel is collapsed
    Then expect eligible for on history filter panel is expanded
    Then expect refund on history filter panel eligible for is selected
    #As there is no tracking number displayed checking row 1 on history grid
    Then check row 1 on history grid
     # Validation of header menu dropdown
    Then expect transaction details for single print is present
    Then click transaction details header menu dropdown
    Then expect print receipt link on the transaction detail menu dropdown is present
    Then expect collapse panel link on the transaction detail menu dropdown is present
    Then click transaction details header menu dropdown
    #Printed status section
    Then expect printed status on history transaction details is present
    Then except create return label on history transaction details is disabled
    Then expect email tracking info on history transaction details is disabled
    Then expect file claim link on the transaction detail panel is not present
    #Services Section
    Then expect services is present on history transaction details
    Then expect service total on history transaction details is correct
#   Then expect carrier on services history transaction details is correct
    Then expect service on services history transaction details is correct
    Then expect file claim link in services section of transaction detail panel is not present
    Then expect price on services history transaction details is correct
    Then expect weight on services history transaction details is correct
   #Reference Section
    Then expect cost code on history transaction details is correct
    Then expect reference on history transaction details is correct
    Then expect user on history transaction details is correct
    Then sign out

