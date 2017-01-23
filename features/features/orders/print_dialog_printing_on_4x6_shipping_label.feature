Feature: Print Media - Roll - 4" x 6" Shipping Label

  Background:
    Given I am signed in to Orders

  @print_dialog_printing_on_4x6_shipping_label
  Scenario:  Roll - 4" x 6" Shipping Label
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Select Service PM Package
    Then Order Details: Set Pounds to 1
    Then Pause for 2 seconds
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Roll - 4" x 6" Shipping Label"
    Then Print Modal: Print