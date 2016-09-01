Feature: Stamps A Series - Specify Postage



  Background:
    Given I am signed in as Mail shipper

  @wp_stamps_regression
  @wp_stamps_a_series_specify
  Scenario: Stamps Regression A Series - Specify Postage
    Then Mail: Select Stamps
    Then Mail Stamps: Set Serial Number to A12345
    Then Mail Stamps: Select Specify Mail Amount
    Then Mail Stamps: Set Ship-From to default
    Then Mail Stamps: Set Ship-To country to United States
    Then Mail Stamps: Select Specify Mail Service First Class
    Then Mail Stamps: Set Stamp Amount to $0.15
    Then Mail Stamps: Set Quantity to 1
    Then Mail Stamps: Set Cost Code to None
    Then Mail: Open Print Modal
    Then Mail Print Modal: Select Printer "factory"
    Then Mail Print Modal: Print
    Then Sign out