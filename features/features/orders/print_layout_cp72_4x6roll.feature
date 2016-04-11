Feature: Print 1 Intl CP72 label on 4x6 Roll

  Background:
    Given I am signed in to Orders

  @print_layout_cp72_4x6roll
  Scenario: Print 1 Intl CP72 label on 4x6 Roll
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFR Envelope | 4x6 Roll  | random           | random           | random | random  | random      | France | random  | random  |
    Then Details: Set Service to "Priority Mail International Package"
    Then Details: Set Ounces to 1
    Then Details: Edit Customs Form
    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Print: Open Modal
    Then Print: Set Media "Roll - 4" x 6" Shipping Label"
    Then Print: Print Sample
    Then Print: Print
    Then Sign out
