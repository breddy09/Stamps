Feature:  Print Bonaire, Sint Eustatius, and Saba orders

  Background:
    Given I am signed in to Orders

     #User Able to Print with  new   country Country Bonaire, Sint Eustatius, and Saba
  @new_country_code @new_country_code_3
  Scenario: Print Bonaire, Sint Eustatius, and Saba orders
    Then Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To International Adress;
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code| country                          | phone   |  email  |
      | random | random  | random           | random           | random | random  | 12345      | Bonaire, Sint Eustatius and Saba | random  | random  |
       Then Order Details - Set Service to "First-Class Mail International Large Envelope/Flat"
    Then Order Details - Set Ounces to 2
    Then Order Details - Set Pounds to 2
    And Open Customs Form
    Then Customs Form - Set Package Contents to "Merchandise"
    And Customs Form - Add Item 1, Description random, Qty 1, Price 30, Lbs 1, Oz 1 Origin United States, Tariff 10
    Then Customs Form - Set I agree to Checked
    Then Close Customs Form
    Then Pause for 3 seconds
    Then Open Print Modal
    Then Print Modal - Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal - Set Printer to "factory"
    Then Toolbar - Print
    Then Sign out
