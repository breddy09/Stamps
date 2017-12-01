Feature: Print 1 single ply Intl CP72 label on 8.5x11 - left side

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cp72_paper_single_ply
  Scenario: Print 1 single ply Intl CP72 label on 8.5x11 - left side
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFRE |  8.5x11 Left Side | random       | random           | random | random  | M12345      | Canada | random  | random  |
    Then set Order Details form service to PMI Package
    Then set Order Details form Ounces to 1
    Then click Order Details form Customs Form button
    Then set Customs form Package Contents to Document
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button Sample
    Then click print modal print button
    Then Sign out
