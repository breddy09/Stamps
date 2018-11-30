Feature: Print On List Of Values

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_on_list_of_values
  Scenario: Print On List Of Values
    #Then select print on Manage Printing Options
    #Then expect Manage Print Options modal is present
    #Then search Manage Print Options for Shipping Label - 8 ½" x 11" Paper

    Then select print on Stamps
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then select print on Shipping Label - SDC-1200
    Then select print on Shipping Label - 5x8
    Then select print on Envelope - 10
    Then select print on Envelope - 9
    Then select print on Envelope - A9
    Then select print on Envelope - #6, 3 ⅝" x 6 ½"
    Then select print on Envelope - A2
    Then select print on Envelope - 7
    Then select print on Envelope - 11
    Then select print on Envelope - 12
    Then select print on Certified Mail Label - SDC-3610
    Then select print on Certified Mail Label - SDC-3710
    Then select print on Certified Mail Label - SDC-3910
    Then select print on Certified Mail Label - SDC-3930
    Then select print on Certified Mail Label - SDC-3810
    Then select print on Roll 4x6
    Then select print on Roll 418x614
    Then sign out