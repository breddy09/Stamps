
Feature: Postage Balance

  @update_postage_balance
  Scenario: Update Postage Balance After Each Print
    Given I am signed in to Orders
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random
    And Hide Order Details Form Ship-To fields
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Insured Value to $10.00
    Then Set Order Details Tracking to "USPS Tracking"
    And Save Shipping Costs Data
    Then Print
    Then Expect Printing cost is deducted from customer balance if there were no printing errors
    And Sign out

