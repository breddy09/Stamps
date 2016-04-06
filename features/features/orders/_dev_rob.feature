
Feature: Test Development
  Background:
    Given I am signed in to Orders

  @rob_dev
  Scenario:
    Then Grid:  Order ID: Column: Check Reference Number
    Then Grid: Order ID: Sort Ascending

  Scenario:
    Then Add New Order
    Then Details: Set Ship-To to Random Address in Zone 1
    Then Details: Set Ship-To to Random Address in Zone 2
    Then Details: Set Ship-To to Random Address in Zone 3
    Then Details: Set Ship-To to Random Address in Zone 4
    Then Details: Set Ship-To to Random Address in Zone 5
    Then Details: Set Ship-To to Random Address in Zone 6
    Then Details: Set Ship-To to Random Address in Zone 7
    Then Details: Set Ship-To to Random Address in Zone 8
    Then Sign out

  Scenario:
    Then Filter: Select Awaiting Shipment
    Then Toolbar: Move to Shipped
    Then Filter: Select Shipped
    Then Expect order moved to Shipped

    Then Toolbar: Move to Canceled
    Then Expect order moved to Canceled

    Then Move order to Awaiting Shipment
    Then Expect order moved to Awaiting Shipment

    Then Add New Order
    Then Filter: Select Shipped
    Then Filter: Select Cancelled
    Then Filter: Select Awaiting Shipment
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to random zrtone 5 through 8
    Then Details: Set Email to random
    Then Details: Set Phone to random
    Then Details: Set Service to "Priority Mail Large Package"
    Then Details: Set Pounds to 1
    Then Details: Set Ounces to 1
    Then Details: Set Height to 1
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Tracking to "Signature Required"
    Then Details: Set Insure For to $50.25
    Then Details: Add Item 1, Qty 1, ID random, Description random

  Scenario:
    Then Add New Order
    Then Filter: Select Awaiting Shipment
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to Eight Zone,377 Santa Rosa Blvd,Fort Walton Beach, FL 32548
    Then Details: Set Email to random
    Then Details: Set Phone to random
    Then Details: Set Service to "Priority Mail Large Package"
    Then Details: Set Pounds to 1
    Then Details: Set Ounces to 1
    Then Details: Set Height to 1
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Tracking to "Signature Required"
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Set Insure For to $50.25
    Then Details: Add Item 1, Qty 1, ID random, Description random

  Scenario:
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 5
    Then Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Details: Set Tracking to "USPS Tracking"
    Then Toolbar: Print
    Then Filter: Select Shipped
    Then Grid: Expect Tracking Number is populated
    Then Grid: Expect Order Status to be Shipped

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 5
    Then Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Details: Set Tracking to "Signature Required"
    Then Toolbar: Print
    Then Filter: Select Shipped
    Then Grid: Expect Tracking Number is populated
    Then Grid: Expect Order Status to be Shipped

    Then Sign out


  Scenario:

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Hide Ship-To fields
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Ounces to 5
    Then Details: Set Length to 1
    Then Details: Set Height to 1
    Then Details: Set Width to 1
    Then Open Print Modal
    Then Print: Set Ship Date to today plus 1
    Then Toolbar: Print
    Then Expect Shipped Tab Date Printed to be today
    Then Print: Set Ship Date to today plus 3

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Hide Ship-To fields
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Ounces to 5
    Then Details: Set Length to 1
    Then Details: Set Height to 1
    Then Details: Set Width to 1
    Then Open Print Modal
    Then Print: Set Ship Date to today plus 2
    Then Toolbar: Print
    Then Expect Shipped Tab Date Printed to be today
    Then Expect Shipped Tab Ship Date to be today plus 2

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Hide Ship-To fields
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Ounces to 5
    Then Details: Set Length to 1
    Then Details: Set Height to 1
    Then Details: Set Width to 1
    Then Open Print Modal
    Then Print: Set Ship Date to today plus 3
    Then Toolbar: Print
    Then Expect Shipped Tab Date Printed to be today
    Then Expect Shipped Tab Ship Date to be today plus 3

  Scenario:
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Hide Ship-To fields
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Ounces to 5
    Then Details: Set Length to 1
    Then Details: Set Height to 1
    Then Details: Set Width to 1
    Then Open Print Modal
    Then Print: Select left-side label
    Then Expect Print Modal left-side label selected

    Then Print: Select right-side label
    Then Expect Print Modal right-side label selected

    Then Print: Set Ship Date to today
    Then Toolbar: Print
    Then Expect Shipped Tab Date Printed to be today
    Then Expect Shipped Tab Ship Date to be today

  @rob_dev2
  Scenario:
    Then List all Grid column values for row 1
    Then List all Grid column values for row 2

    Then Filter: Select Cancelled
    Then Filter: Select Awaiting Shipment
    Then Filter: Select Cancelled
    Then Filter: Select Shipped
    Then Filter: Select Cancelled
    Then Filter: Select Cancelled
    Then Filter: Select Awaiting Shipment
    Then Filter: Select Shipped
    Then Filter: Select Awaiting Shipment
    Then Filter: Select Shipped
    Then Filter: Select Cancelled
    Then Filter: Select Awaiting Shipment
    Then Filter: Select Shipped
    Then Filter: Select Cancelled

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Service to "First-Class Mail Large Envelope/Flat"

    Then Toolbar: Print

    Then Expect Awaiting Shipment count to be less by 1
    Then Expect printed Order ID is in Shipped tab

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Service to "First-Class Mail Large Envelope/Flat"
    Then Grid: Check row 1
    Then Toolbar: Print
    Then Expect printed Order ID is not in Awaiting Shipment tab
    Then Expect printed Order ID is in Shipped tab

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Service to "First-Class Mail Large Envelope/Flat"

    Then I Add a second order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Service to "First-Class Mail Large Envelope/Flat"

    Then I Add a third order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Service to "Media Mail Package"

    Then Grid: Check row 1
    Then Grid: Check row 2
    Then Grid: Check row 3

    Then Toolbar: Print

    Then Expect all printed Order IDs not in Awaiting Shipment tab
    Then Expect all printed Order IDs are in Shipped tab

  @rob_grid
  Scenario:
    Then List all Grid column values for row 1
    Then List all Grid column values for row 2
    Then List all Grid column values for row 3

  @rob_dev_customs_form_dropdowns
  Scenario: Syria Internal Transaction Number Required
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Syria    | random  | random  |

    Then Details: Set Ounces to 5
    Then Details: Set Length to 1
    Then Details: Set Height to 1
    Then Details: Set Width to 1
    Then Details: Set Service to "Priority Mail International Flat Rate Envelope"

  #Then Details: Set Service to "First-Class Mail International Large Envelope/Flat"
    Then Open Customs Form
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs: Set Package Contents to "Commercial Sample"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs: Set Package Contents to "Document"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs: Set Package Contents to "Merchandise"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs: Set Package Contents to "Gift"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs: Set Package Contents to "Humanitarian Donation"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs: Set Package Contents to "Returned Goods"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs: Set Package Contents to "Other"
    Then Expect Customs Form Internal Transaction # to be "Required"

    Then Customs: Add Item 1, Description random, Qty 1, Price 3000, Lbs 1, Oz 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs: Set ITN# to "random"
    Then Customs: Check  I agree to the USPS Privacy Act Statement
    Then Close Customs Form
    Then Sign out

  @_dev_rob
  Scenario: Domestic FPO Address
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Details: Set Ounces to 5
    Then Details: Set Length to 1
    Then Details: Set Height to 1
    Then Details: Set Width to 1
    Then Details: Set Service to "Priority Mail Package"
    Then Open Customs Form
    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Close Customs Form
    Then Toolbar: Print

  @rob_dev_int
  Scenario:
    # International
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | 0123456789  | junk@stamps.com  |
    Then Details: Set Ounces to 2
    Then Details: Set Pounds to 2
    Then Open Customs Form
    Then Customs: Add Item 1, Description random, Qty 1, Price 100.50, Lbs 1, Oz 1 Origin United States, Tariff 100
    Then Customs: Check  I agree to the USPS Privacy Act Statement
    Then Close Customs Form
    Then Details: Set Service to "First-Class Mail International Large Envelope/Flat"

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Australia | 9876543210  | junk@stamps.com  |
    Then Details: Set Ounces to 2
    Then Details: Set Pounds to 2
    Then Open Customs Form
    Then Customs: Add Item 1, Description random, Qty 1, Price 100.50, Lbs 1, Oz 1 Origin United States, Tariff 100
    Then Customs: Check  I agree to the USPS Privacy Act Statement
    Then Close Customs Form
    Then Details: Set Service to "Priority Mail International Flat Rate Envelope"
