Feature: User Prints 1 FPO CN22 label on 8.5x11 - right side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_fpo_cn22_paper_right
  Scenario: User Prints 1 FPO CN22 label on 8.5x11 - right side
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To Domestic address to
      | full_name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | PM RR Box C | 8.5x11 Right Side 1 | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then set Order Details Weight to 2 lb 1 oz
    Then set Order Details service to PSG Package
    Then click Order Details form Customs Form button
    Then set Customs form Package Contents to Merchandise
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then click print modal print button Sample
    Then click print modal print button
    Then Sign out

