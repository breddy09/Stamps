Feature:  Order Details Form Placeholder default values
  ORDERS-33 Item Row Quantity Field should have "Qty" Placeholder Text

  Background:
    Given a valid user is signed in to Web Apps

  @details_placeholders
  Scenario:  Order Details Form Placeholder default values
    Then add new order
    Then expect Order Details form Ship-To Address Placeholder is Address
    Then expect Order Details form Ship-To Phone Placeholder is Phone
    Then expect Order Details form Ship-To Email Placeholder is Email
    Then expect Order Details form service Placeholder is Select a service ...

    Then on Order Details form, Add Item 1

    Then expect Order Details form Associated Item 1 Qty Placeholder is Qty
    Then expect Order Details form Associated Item 1 ID Placeholder is ID #
    Then expect Order Details form Associated Item 1 Description Placeholder is Description

    Then set Order Details Ship-To Country to Curacao

    Then expect Order Details form Ship-To Name Placeholder is Name
    Then expect Order Details form Ship-To Company Placeholder is Company
    Then expect Order Details form Ship-To Address 1 Placeholder is Address 1
    Then expect Order Details form Ship-To Address 2 Placeholder is Address 2
    Then expect Order Details form Ship-To City Placeholder is City
    Then expect Order Details form Ship-To Province Placeholder is Province
    Then expect Order Details form Ship-To Postal Code Placeholder is Postal Code
    Then expect Order Details form Ship-To Phone Placeholder is Phone
    Then expect Order Details form Ship-To Email Placeholder is Email

    Then Sign out



