
Feature:  Print Window Title - You have x-number of labels ready to print

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_two_up_window_title
  Scenario:  Printing
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PM Flat Rate Envelope
    Then set Order Details form Weight to 1 lb 1 oz
    Then click Orders Toolbar Print button
    Then expect Print modal Modal Title is "You have 1 label(s) ready to print"
    Then in Print modal, click Close button

    Then add new order
    Then set Order Details form Ship-To to random address between zone 5 and 8
    Then set Order Details form service to PM Flat Rate Envelope
    Then set Order Details form Weight to 1 lb 1 oz
    Then check Orders Grid row 1
    Then check Orders Grid row 2
    Then click Orders Toolbar Print button
    Then expect Print modal Modal Title is "You have 2 label(s) ready to print"
    Then in Print modal, click Close button

    Then Sign out
