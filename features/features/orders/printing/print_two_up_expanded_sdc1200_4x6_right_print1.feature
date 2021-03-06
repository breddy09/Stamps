Feature: Print 1 Domestic label on SDC-1200 4 ¼" x 6 ¾" right side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_sdc1200_4x6_right_print1
  Scenario: Print 1 Domestic label on SDC-1200 4 ¼" x 6 ¾" right side
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to PM Package, SDC-1200 Right Side 1, 5912 83rd St., Lubbock TX 79424-3608
    Then set order details service to PM Package
    Then set order details weight to 1 lb 1 oz
    Then set order details dimensions to length 1 width 1 height 1
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    #Then set Print modal Printer to "Designer"
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then click print modal print button
    Then sign out
