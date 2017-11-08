Feature: Print Media - Roll - 4" x 6"

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_printing_on_4x6
  Scenario:  Roll - 4" x 6"
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PM Package
    Then set Order Details form Pounds to 1
    Then Pause for 2 seconds
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Roll - 4 x 6
    Then click print modal print button