
Feature: Order Details Insure-For box value - Manual Orders
  If Insure-For Box is Unchecked, Show NO Value in the Amount Field.
  If Insure-For checkbox is checked, then the Insure-For field should show its real value (which may or may not be $0.00).

  Background:
    Given I am signed in to Orders

  @details_insure_for_box_unchecked_manual
  Scenario: Insure-For - Manual Orders
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address in Zone 1
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Ounces to 2
    Then Details: Check Insure-For checkbox
    Then Details: Expect Insure-For Textbox to be enabled
    Then Details: Set Insure-For to $100.00
    Then Pause for 2 seconds
    Then Details: Expect Insure-For to be $100.00
    Then Details: Expect Insure-For Cost to be greater than $1.00
    Then Grid: Expect Insured Value to be $100.00
    Then Details: Uncheck Insure-For checkbox
    Then Pause for 2 seconds
    Then Details: Expect Insure-For Textbox to be disabled
    Then Details: Expect Insure-For to be $0.00
    Then Details: Expect Insure-For Cost to be $0.00
    Then Grid: Expect Insured Value to be $0.00

    Then Sign out
