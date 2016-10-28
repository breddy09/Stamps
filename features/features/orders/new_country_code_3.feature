Feature:  Print Bonaire, Sint Eustatius, and Saba orders

  Background:
    Given I am signed in to Orders

     #User Able to Print with  new   country Country Bonaire, Sint Eustatius, and Saba
  @new_country_code @new_country_code_3
  Scenario: Print Bonaire, Sincd t Eustatius, and Saba orders
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code| country                          | phone   |  email  |
      | random | random  | random           | random           | random | random  | 12345      | Bonaire, Sint Eustatius and Saba | random  | random  |
       Then Details: Select Service First-Class Mail International Large Envelope/Flat
    Then Details: Set Ounces to 2
    Then Details: Set Pounds to 2
    Then Details: Edit Customs Form
    Then Customs: Set Package Contents to Merchandise
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Modal
    Then Pause for 3 seconds
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Print
    Then Sign out



