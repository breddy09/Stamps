
Feature: Print two labels on one sheet

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_multiple_domestic_labels
  Scenario: User Prints multiple Domestic labels

    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 5 and 8
    Then set Order Details form service to PM Flat Rate Envelope
    Then set Order Details form Weight to 1 lb 1 oz
    Then set Order Details form Dimensions to Length 1 Width 1 Height 1
    Then set Order Details form Tracking to Signature Required

    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PM Flat Rate Envelope
    Then set Order Details form Weight to 1 lb 1 oz
    Then set Order Details form Tracking to Signature Required

    Then check Orders Grid row 2

    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set Orders print modal printer
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then click print modal print button

    Then Pause for 6 seconds
    Then Sign out








