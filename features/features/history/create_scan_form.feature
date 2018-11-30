Feature:  History :Create Scan Form

  Background:
    Given Start test driver


  @create_scan_form
  Scenario: Verify File Insurance Claim Page loads and Date Selections Drop Down menu is available
    Then sign-in to orders
    Then hover on navigation history then select Create a SCAN Form
    Then expect date printed on history filter panel is collapsed
    Then expect eligible for on history filter panel is expanded
    Then expect default selected value on eligible for history filter panel is scan form
    Then sign out





