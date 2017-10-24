Feature: Print 1 Intl CP72 label on 4x6 Roll

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cp72_4x6roll
  Scenario: Print 1 Intl CP72 label on 4x6 Roll
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFR Envelope | 4x6 Roll  | random           | random           | random | random  | random      | France | random  | random  |
    Then set Order Details form service to PMI Package
    Then set Order Details form Ounces to 1
    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Merchandise
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to "Roll - 4 x 6"
    Then click print modal print button Sample
    Then click print modal print button
    Then Sign out
