Feature:  Customs Form Data Tooltip Error

  Background:
    Given I am signed in to Orders

  @tooltip_customs_form
  Scenario:  Customs Form Data Error
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Australia | random  | random  |
    Then Details: Set Ounces to 5
    Then Details: Set Service to "Priority Mail International Flat Rate Envelope"
    Then Details: Edit Customs Form
    Then Pause for 1 second
    Then Cancel Customs Form
    Then Pause for 1 second
    Then Details: Edit Customs Form
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Pause for 1 second
    Then Customs: Uncheck  I agree to the USPS Privacy Act Statement
    Then Pause for 1 second
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Pause for 1 second
    Then Customs: Uncheck  I agree to the USPS Privacy Act Statement

    Then Expect Customs Form Tooltip Error for Item Description to be Description is a required field
    Then Expect Customs Form Tooltip Error for Qty to be Quantity must be greater than 0
    Then Expect Customs Form Tooltip Error for Unit Price to be Value must be greater than 0
    Then Expect Customs Form Tooltip Error for Pounds to be Weight cannot be 0
    Then Expect Customs Form Tooltip Error for Ounces to be Weight cannot be 0
    Then Customs: Add Item 1, Description random, Qty 1, Price 50, Lbs 9, Oz 9 Origin United States, Tariff 100
    Then Pause for 2 seconds
    Then Expect Customs Form Tooltip Error for Total Weight to be The itemized weight exceeds the package weight
    Then Customs: Close Form
    Then Sign out

