Feature: Print 1 Domestic label on SDC-1200 4 ¼" x 6 ¾ right side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_sdc1200_4x6_left_print1
  Scenario: Print 1 Domestic label on SDC-1200 4 ¼" x 6 ¾ right side
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to PM Package, SDC-1200 Right Side 1, 5912 83rd St., Lubbock TX 79424-3608
    Then set order details service to PM Package
    Then set order details weight to 1 lb 1 oz
    Then set Order Details Dimensions to Length 1 Width 1 Height 1
    Then click orders toolbar print button
    Then set Print modal Print-On to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set Orders print modal printer
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then click print modal print button
    Then sign out
