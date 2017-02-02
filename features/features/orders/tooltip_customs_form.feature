Feature:  Customs Form Data Tooltip Error

  Background:
    Given a valid user is signed in to Web Apps

  @tooltip_customs_form
  Scenario:  Customs Form Data Error
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Australia | random  | random  |

    Then on Order Details form, select service PMI Flat Rate Envelope
    Then on Order Details form, click Edit Form button
    Then Pause for 1 second
    Then Cancel Customs Form
    Then Pause for 1 second
    Then on Order Details form, click Edit Form button
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then Pause for 1 second
    Then on Customs form, uncheck I agree to the USPS Privacy Act Statement
    Then Pause for 1 second
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then Pause for 1 second
    Then on Customs form, uncheck I agree to the USPS Privacy Act Statement

    Then on Customs form, expect Associated Item Description Tooltip Error is Description is a required field
    Then on Customs form, expect Qty Tooltip Error is Quantity must be greater than 0
    Then on Customs form, expect Unit Price Tooltip Error is Value must be greater than 0
    Then on Customs form, add Associated Item 1, Description random, Qty 1, Price 50, Origin United States, Tariff 100
    Then Pause for 2 seconds
    Then on Customs form, click Close button
    Then Sign out


