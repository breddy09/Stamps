
Feature: As a batch shipper, I want is able to Filter Panel - orders by status [B-01621]

  Background:
    Given I am signed in to Orders

  @filters
  Scenario: User Views Filter Panel - Panel Default
    When Filter: Expect system displays expanded filters panel
    Then Filter: Expect system displays "Awaiting Shipment" and "Shipped" filters in panel
    Then Filter: Expect system selects the Awaiting Shipment Filter Panel - by default

    Then Filter: Click on panel
    Then Filter: Expect Filters panel is close
    Then Filter: Expect system shows name of Awaiting Shipment Filter Panel - in closed panel
    Then Filter: Expect system shows an arrow above the Order Status Filter Panel - name
    Then Filter: Expect panel arrow is pointing to the right direction

    Then Filter: Click on panel
    Then Filter: Expect Panel is open
    Then Filter: Expect panel is hidden
    Then Filter: Expect panel arrow is pointing to the left direction


    Then Filter: Click on panel
    Then Filter: Expect Filters panel is close
    Then Filter: Expect system shows name of Awaiting Shipment Filter Panel - in closed panel
    Then Filter: Expect system shows an arrow above the Order Status Filter Panel - name
    Then Filter: Expect panel arrow is pointing to the right direction

    Then Filter: Click on the closed Filters panel
    Then Filter: Expect Panel is open
    Then Filter: Expect panel is hidden
    Then Filter: Expect panel arrow is pointing to the left direction

    Then Filter: Click on panel
    Then Filter: Expect Filters panel is close
    Then Filter: Expect system shows name of Awaiting Shipment Filter Panel - in closed panel
    Then Filter: Expect system shows an arrow above the Order Status Filter Panel - name
    Then Filter: Expect panel arrow is pointing to the right direction

    Then Filter: Click panel name
    Then Filter: Expect Panel is open
    Then Filter: Expect panel is hidden
    Then Filter: Expect panel arrow is pointing to the left direction
    Then Sign out

  @filters
  Scenario: User Changes filters

    When Filter: Expect system displays expanded filters panel

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to domestic address
      | name   | company      | street_address      | city | state | zip        | country       | phone  |  email |
      | James Test | Domestic Company | 600 Front St Apt 220 | San Diego | CA | 92101-6733 | United States | 8885551212 | test@stamps.com |
    Then Details: Select Service Priority Mail Package
    Then Details: Set Ounces to 1

    Then Filter: Select Awaiting Shipment
    Then Filter: Expect system selects Awaiting Shipment Filter Panel - and deselects the previous filter

    Then Details: Expect Order ID equals Grid order ID
    Then Grid: Expect Recipient is James Test
    Then Grid: Expect Company is Domestic Company
    Then Grid: Expect Address is 600 Front St Apt 220
    Then Grid: Expect City is San Diego
    Then Grid: Expect State is CA
    Then Grid: Expect Zip is 92101
    Then Grid: Expect Phone is 8885551212
    Then Grid: Expect Email is test@stamps.com

    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Print

    Then Filter: Select Shipped
    Then Filter: Expect system selects Shipped Filter Panel - and deselects the previous filter

    Then Grid: Expect Recipient is James Test
    Then Grid: Expect Company is Domestic Company
    Then Grid: Expect Address is 600 Front St Apt 220
    Then Grid: Expect City is San Diego
    Then Grid: Expect State is CA
    Then Grid: Expect Zip is 92101
    Then Grid: Expect Phone is 8885551212
    Then Grid: Expect Email is test@stamps.com


    Then Toolbar: Add
    Then Filter: Expect system selects Awaiting Shipment Filter Panel - and deselects the previous filter


    Then Sign out

    #todo - rob