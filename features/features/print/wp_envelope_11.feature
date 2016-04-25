Feature: Envelope #11

  Background:
    Given I am signed in as a postage shipper

  @wp_envelope_regression
  @wp_envelope_11
  Scenario: Envelope #11
    Then Postage: Select Envelope - #11
    Then Postage: Set Ship-From to default
    Then Postage: Set Ship-To country to United States
    Then Postage: Set Ship-To to Random Address Between Zone 5 through 8
    Then Postage: Set Pounds to 0
    Then Postage: Set Ounces to 1
    Then Postage Envelopes: Select Service First-Class Mail Letter
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out