Feature: Multiple Reprints

  Background:
    Given a valid user is signed in to Web Apps

  @print_multiple_reprints
  Scenario: Multiple reprints in 24 hour period

    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to MM Package, 5.5x8.5 Right Side 2, 4937 79th St., Sacramento CA 95820-6213
    Then set Order Details form service to MM Package
    Then set Order Details form Ounces to 1
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then set Print modal Printer to "factory"
    Then in Print modal, click Print button

    Then In left Filter Panel, select Shipped
    Then In Orders Grid, Sort Order Date in Descending Order
    Then Pause for 2 seconds
    Then check Orders Grid saved Order ID
    Then in Print modal, Open Reprint Modal
    Then ReIn Print modal, Reprint
    Then In left Filter Panel, select Shipped
    Then Pause for 2 seconds
    Then check Orders Grid saved Order ID
    Then in Print modal, Open Reprint Modal
    Then ReIn Print modal, Reprint

    Then Sign out