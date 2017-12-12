
Feature:  Prompt User to Remove Orders in Error from Print Group

  Background:
    Given a valid user is signed in to Web Apps

  @printing_error
  Scenario:  Printing
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then check Orders Grid row 1
    Then Print Order expecting error A service must be selected before printing.

    Then add new order
    Then set Order Details form Ship-From to default
    Then check Orders Grid row 1
    Then check Orders Grid row 2
    Then Print Order expecting error All selected orders have errors and cannot be printed.

    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Pounds to 1
    Then set Order Details form Ounces to 1
    Then set Order Details form service to PM Regional Rate Box A
    Then check Orders Grid row 1
    Then check Orders Grid row 2
    Then Print expecting 1 of 2 selected orders have errors and cannot be printed. To print the remaining orders, click Continue.
    Then Sign out
