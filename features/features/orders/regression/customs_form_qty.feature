Feature: Customs Form Qty > 99 is not saved correctly


  Background:
    Given a valid user is signed in to Web Apps

  @customs_form_qty
  Scenario: Customs Form Qty
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province | postal_code | country  | phone  |  email  |
      | random | random  | random           | random | random   | random      | random   | France | random  | random  |
    Then set Order Details service to PMI Package
    Then set Order Details Ounces to 1

    Then on Order Details form, Add Item 1
    Then set Order Details Qty to 1
    Then set Order Details ID to random
    Then set Order Details Description to random

    Then on Order Details form, Add Item 2
    Then set Order Details Qty to 2
    Then set Order Details ID to random
    Then set Order Details Description to random

    Then click Order Details form Customs Form button

    Then add Customs form Associated Item 1
    Then set Customs Associated Item 1 Description to item 1
    Then set Customs Associated Item 1 Qty to 5
    Then set Customs Associated Item 1 Unit Price to 11.11
    Then set Customs Associated Item 1 Made In is Country to United States
    Then set Customs Associated Item 1 Tarriff to 5

    Then add Customs form Associated Item 2
    Then set Customs Associated Item 2 Description to item 2
    Then set Customs Associated Item 2 Qty to 7
    Then set Customs Associated Item 2 Unit Price to 22.22
    Then set Customs Associated Item 2 Made In is Country to United States
    Then set Customs Associated Item 1 Tarriff to 10

    Then check Customs form I agree to the USPS Privacy Act Statement

    Then close Customs Information form

    Then uncheck Orders Grid row 1
    Then check Orders Grid row 1

    Then click Order Details form Customs Form button
    Then Pause for 2 seconds
    Then expect Customs Associated Item 1 Description is item 1
    Then expect Customs Associated Item 1 Quantity is 5

    Then expect Customs Associated Item 2 Description is item 2
    Then expect Customs Associated Item 2 Quantity is 7

    Then close Customs Information form

    Then Sign out
