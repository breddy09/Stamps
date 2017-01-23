Feature: Print 1 Intl CP72 label with continuation on on 4x6 Roll

  Background:
    Given I am signed in to Orders

  @print_layout_cp72_roll_continuation
  Scenario: Print 1 Intl CP72 label with continuation on on 4x6 Roll
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to International Address
      | name     | company   | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | PMI LFRB |  4x6 Roll | random           | random           | random | random  | random      | Italy   | random  | random  |
    Then Order Details: Select Service PMI Large Flat Rate Box
    Then Order Details: Set Weight to 2 lb 0 oz
    Then Order Details: Edit Customs Form
    Then Customs Form: Set Package Contents to Merchandise
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 1, Origin United States, Tariff 1
    Then Customs Form: Add Item 2, Description random, Qty 1, Price 2, Origin United States, Tariff 2
    Then Customs Form: Add Item 3, Description random, Qty 1, Price 3, Origin United States, Tariff 3
    Then Customs Form: Add Item 4, Description random, Qty 1, Price 4, Origin United States, Tariff 4
    Then Customs Form: Add Item 5, Description random, Qty 1, Price 5, Origin United States, Tariff 5
    Then Customs Form: Add Item 6, Description random, Qty 1, Price 6, Origin United States, Tariff 6
    Then Customs Form: Add Item 7, Description random, Qty 1, Price 7, Origin United States, Tariff 7
    Then Customs Form: Add Item 8, Description random, Qty 1, Price 8, Origin United States, Tariff 8
    Then Customs Form: Add Item 9, Description random, Qty 1, Price 9, Origin United States, Tariff 9
    Then Customs Form: Add Item 10, Description random, Qty 1, Price 10, Origin United States, Tariff 10
    Then Customs Form: Add Item 11, Description random, Qty 1, Price 11, Origin United States, Tariff 11
    Then Customs Form: Add Item 12, Description random, Qty 1, Price 12, Origin United States, Tariff 12
    Then Customs Form: Add Item 13, Description random, Qty 1, Price 13, Origin United States, Tariff 13
    Then Customs Form: Add Item 14, Description random, Qty 1, Price 14, Origin United States, Tariff 14
    Then Customs Form: Add Item 15, Description random, Qty 1, Price 15, Origin United States, Tariff 15
    Then Customs Form: Add Item 16, Description random, Qty 1, Price 16, Origin United States, Tariff 16
    Then Customs Form: Add Item 17, Description random, Qty 1, Price 17, Origin United States, Tariff 17
    Then Customs Form: Add Item 18, Description random, Qty 1, Price 18, Origin United States, Tariff 18
    Then Customs Form: Add Item 19, Description random, Qty 1, Price 19, Origin United States, Tariff 19
    Then Customs Form: Add Item 20, Description random, Qty 1, Price 20, Origin United States, Tariff 20
    Then Customs Form: Add Item 21, Description random, Qty 1, Price 21, Origin United States, Tariff 21
    Then Customs Form: Add Item 22, Description random, Qty 1, Price 22, Origin United States, Tariff 22
    Then Customs Form: Add Item 23, Description random, Qty 1, Price 23, Origin United States, Tariff 23
    Then Customs Form: Add Item 24, Description random, Qty 1, Price 24, Origin United States, Tariff 24
    Then Customs Form: Add Item 25, Description random, Qty 1, Price 25, Origin United States, Tariff 25
    Then Customs Form: Add Item 26, Description random, Qty 1, Price 26, Origin United States, Tariff 26
    Then Customs Form: Add Item 27, Description random, Qty 1, Price 27, Origin United States, Tariff 27
    Then Customs Form: Add Item 28, Description random, Qty 1, Price 28, Origin United States, Tariff 28
    Then Customs Form: Add Item 29, Description random, Qty 1, Price 29, Origin United States, Tariff 29
    Then Customs Form: Add Item 30, Description random, Qty 1, Price 30, Origin United States, Tariff 30
    Then Customs Form: Add Item 31, Description random, Qty 1, Price 30, Origin United States, Tariff 31
    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Roll - 4" x 6" Shipping Label"
    Then Print Modal: Print Sample
    Then Print Modal: Print
    Then Sign out
