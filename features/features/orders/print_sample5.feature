Feature: Print Sample

  Background:
    Given I am signed in to Orders

  @print_sample
  Scenario:  Priority Mail Flat Rate Envelope
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random zone 1 through 4
    Then Set Order Details Service to "Priority Mail Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    Then Open Print Modal
    Then Set Print Modal Printer to "factory"
    Then Print Sample
    And Sign out
