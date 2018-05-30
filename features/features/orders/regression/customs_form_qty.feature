Feature: Customs Form Qty > 99 is not saved correctly


  Background:
    Given a valid user is signed in to Web Apps

  @customs_form_qty
  Scenario: Customs Form Qty
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to international address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province | postal_code | country  | phone  |  email  |
      | random | random  | random           | random | random   | random      | random   | France | random  | random  |
    Then set order details service to PMI Package/Flat/Thick Envelope
    Then set order details ounces to 1

    Then on order details form, add item 1
    Then set Order Details Qty to 1
    Then set Order Details ID to random
    Then set Order Details Description to random

    Then on order details form, add item 2
    Then set Order Details Qty to 2
    Then set Order Details ID to random
    Then set Order Details Description to random

    Then click order details form customs form button

    Then add customs associated item 1
    Then set Customs Associated Item 1 Description to item 1
    Then set Customs Associated Item 1 Qty to 5
    Then set Customs Associated Item 1 Unit Price to 11.11
    Then set Customs Associated Item 1 Made In is Country to United States
    Then set Customs Associated Item 1 Tarriff to 5

    Then add customs associated item 2
    Then set Customs Associated Item 2 Description to item 2
    Then set Customs Associated Item 2 Qty to 7
    Then set Customs Associated Item 2 Unit Price to 22.22
    Then set Customs Associated Item 2 Made In is Country to United States
    Then set Customs Associated Item 1 Tarriff to 10

    Then check customs form i agree to the usps privacy act statement

    Then close customs information form

    Then uncheck Orders Grid row 1
    Then check Orders Grid row 1

    Then click order details form customs form button
    Then pause for 2 seconds
    Then expect customs associated item 1 Description is item 1
    Then expect customs associated item 1 Quantity is 5

    Then expect customs associated item 2 Description is item 2
    Then expect customs associated item 2 Quantity is 7

    Then close customs information form

    Then sign out
