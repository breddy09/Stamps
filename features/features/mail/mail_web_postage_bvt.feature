Feature: Test Development

  Background:
    Given I am signed in as Mail shipper

  @print_postage_page_objects
  Scenario: Page Object Creation
    Then Create page objects for Print On Shipping Label