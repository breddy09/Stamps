Feature: Multiple Reprints

  Background:
    Given a valid user is signed in to Web Apps

  @print_multiple_reprints
  Scenario: Multiple reprints in 24 hour period

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to MM Package/Flat/Thick Envelope, 5.5x8.5 Right Side 2, 4937 79th St., Sacramento CA 95820-6213
    Then set Order Details service to MM Package/Flat/Thick Envelope
    Then set Order Details Ounces to 1
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set Orders print modal printer
    Then click print modal print button

    Then select Filter Panel tab Shipped
    Then In Orders Grid, Sort Order Date in Descending Order
    Then Pause for 2 seconds
    Then check orders grid cached order id
    Then in Print modal, Open Reprint Modal
    Then ReIn Print modal, Reprint
    Then select Filter Panel tab Shipped
    Then Pause for 2 seconds
    Then check orders grid cached order id
    Then in Print modal, Open Reprint Modal
    Then ReIn Print modal, Reprint

    Then Sign out