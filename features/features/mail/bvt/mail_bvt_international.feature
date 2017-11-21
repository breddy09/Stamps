Feature: International Shipping BVT

  Background:
    Given a user is signed in to Web Apps

  @mail_bvt_international
  Scenario: International Shipping
    Then select Print On Shipping Label - Paper
    Then set Print form Mail-From to default
    Then set Advanced Options Mail Date to today
    Then set Print form Ship-To to international address
      | name   | company | street_address_1 | street_address_2  | city   | province | postal_code | country| phone  |
      | random | random  | random           | random            | random | random   | random      | Italy | random  |
    Then set Print form Ounces to 3
    Then select Print form service PMI Flat Rate Envelope
    Then click Print form Edit Customs Form button

    Then expect Customs form I agree to the USPS Privacy Act Statement is unchecked
    Then set Customs form Package Contents to Document
    Then set Customs form More Info to some random string
    Then set Customs form Package Contents to Commercial Sample
    Then expect Customs form Package Contents is Commercial Sample
    Then set Customs form License Number to a random string
    Then expect Customs form License Number is correct
    Then set Customs form Certificate Number to some random string
    Then expect Customs form Certificate Number is correct
    Then set Customs form Invoice Number to a random string
    Then expect Customs form Invoice Number is correct

    Then set Customs form Non-Delivery Options to Treat as abandoned
    Then expect Customs form Non-Delivery Options is Treat as abandoned

    Then set Customs form Internal Transaction Number to Required
    Then expect Customs form Internal Transaction Number is Required

    Then set Customs form ITN Number to ITN123

    Then add Customs form Associated Item 1, Description Item 1, Qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs form Associated Item 2, Description Item 2, Qty 2, Price 2, Made In Japan, Tariff 2
    Then add Customs form Associated Item 3, Description Random String, Qty 3, Price 3, Made In Canada, Tariff 3

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form

    Then click Print form Edit Customs Form button
    Then Pause for 1 second
    Then expect Customs form Package Contents is Commercial Sample
    Then expect Customs form License Number is correct
    Then expect Customs form Certificate Number is correct
    Then expect Customs form Invoice Number is correct

    Then expect Customs form Non-Delivery Options is Treat as abandoned
    Then expect Customs form Internal Transaction Number is Required
    Then expect Customs form ITN Number is correct

    Then expect Customs form Associated Item 1 Description is correct
    Then expect Customs form Associated Item 1 Quantity is correct
    Then expect Customs form Associated Item 1 Unit Price is correct
    Then expect Customs form Associated Item 1 Made In is correct
    Then expect Customs form Associated Item 1 Tariff is correct

    Then expect Customs form Associated Item 2 Description is correct
    Then expect Customs form Associated Item 2 Quantity is correct
    Then expect Customs form Associated Item 2 Unit Price is correct
    Then expect Customs form Associated Item 2 Made In is correct

    Then expect Customs form Associated Item 3 Description is correct
    Then expect Customs form Associated Item 3 Quantity is correct
    Then expect Customs form Associated Item 3 Unit Price is correct
    Then expect Customs form Associated Item 3 Made In is correct
    Then expect Customs form Associated Item 3 Tariff is correct

    Then expect Customs form I agree to the USPS Privacy Act Statement is checked
    Then expect Customs form Total Value is correct
    Then close Customs Information form

    #Then Mail: Print International Postage
    Then Sign out


