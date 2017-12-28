Feature: Print 1 single ply FSA CP72 label on on 8.5x11 - right side

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_fsa_cp72_paper_single_ply
  Scenario: Print 1 single ply FSA CP72 label on on 8.5x11 - right side
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To Domestic address to
      | full_name | company | street_address        |street_address_2|  city    | state | zip        | country       | phone  |  email |
      | MM   | 8.5x11  | 118 E Marine Corps Dr |                |Hagatna | GU    | 96910-5126 | United States | random | random |
    Then set Order Details Weight to 1 lb 2 oz
    Then set Order Details service to MM Package

    Then click Order Details form Customs Form button
    Then set Customs form Package Contents to Other
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 25, Made In United States, Tariff 10
    Then set Customs form More Info to random
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
