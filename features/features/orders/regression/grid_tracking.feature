
Feature: in Orders Grid, Tracking & Order Status

  Background:
    Given a valid user is signed in to Web Apps

  @grid_tracking
  Scenario: Tracking & Order Status

    Then click Orders Toolbar Add button
    Then expect Orders Grid Order Status is Awaiting Shipment
    Then set Order Details form Ship-From to El Segundo, CA
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Ounces to 5
    Then set Order Details form service to PM Large Package
    Then set Order Details form Tracking to USPS Tracking
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Print modal Printer to "factory"
    Then in Print modal, click Print button
    Then In left Filter Panel, select Shipped
    #Then in Orders Grid, Sort Order ID in Descending Order
    Then expect Orders Grid Tracking Number is populated
    Then expect Orders Grid Order Status is Shipped

    Then click Orders Toolbar Add button
    Then expect Orders Grid Order Status is Awaiting Shipment
    Then set Order Details form Ship-From to El Segundo, CA
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Ounces to 5
    Then set Order Details form service to PM Large Package
    Then set Order Details form Tracking to Signature Required
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Print modal Printer to "factory"
    Then in Print modal, click Print button
    Then In left Filter Panel, select Shipped
    #Then in Orders Grid, Sort Order ID in Descending Order
    Then expect Orders Grid Tracking Number is populated
    Then expect Orders Grid Order Status is Shipped

    Then Sign out


