
Feature:  Order Details Form - Reference # Field
  Add Reference # Field and Print Reference # CheckBox

  Background:
    Given a valid user is signed in to Web Apps

  @details_reference_no
  Scenario: Reference Number
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PM Large/Thick Envelope
    Then set Order Details form Ounces to 2

    Then set Order Details form Reference Number to random
    Then expect Order Details form Reference Number is correct

    Then set Order Details form Reference Number to Rob
    Then expect Order Details form Reference Number is Rob

    Then in Orders Toolbar, click Print button
    Then in Print modal, uncheck Print Reference # on Shipping Label
    Then in Print modal, check Print Reference # on Shipping Label
    Then in Print modal, check Print Reference # on Shipping Label
    Then set Print modal Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then set Print modal Printer to "factory"
    Then click print modal print button
    Then Sign out

