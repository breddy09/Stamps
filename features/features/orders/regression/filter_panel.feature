
Feature: Orders Filter Panel

  Background:
    Given a valid user is signed in to Web Apps

  @filter_panel
  Scenario: Filter Panel
    # default filter
    Then expect selected Filter is Awaiting Shipment

    Then select Filter Panel tab Shipped
    Then expect selected Filter is Shipped

    Then select Filter Panel tab Canceled
    Then expect selected Filter is Canceled

    Then select Filter Panel tab Awaiting Shipment
    Then expect selected Filter is Awaiting Shipment

    Then select Filter Panel tab On Hold
    Then expect selected Filter is On Hold

    Then add new order
    Then expect selected Filter is Awaiting Shipment
    Then check Orders Grid for cached Order ID
    Then expect cached Order ID is in Orders Grid row 1

    Then select Grid Toolbar Move menu item Move to Shipped
    Then expect Move to Shipped modal order number is correct
    Then click Move to Shipped modal move button

    Then select Filter Panel tab Shipped
    Then expect selected Filter is Shipped
    Then expect saved Order ID exist in the selected filter

    Then check Orders Grid for cached Order ID
    Then expect cached Order ID is in Orders Grid row 1
    Then select Grid Toolbar Move menu item Move to Canceled
    Then click Move to Canceled modal move button
    Then select Filter Panel tab Canceled
    Then expect selected Filter is Canceled
    Then expect saved Order ID exist in the selected filter

#    Then check Orders Grid for cached Order ID
#    Then select Grid Toolbar Move menu item Move to On Hold until today plus 3
#    Then select Filter Panel tab On Hold
#    Then expect selected Filter is On Hold
#    Then expect saved Order ID exist in the selected filter

    Then check Orders Grid for cached Order ID
    Then expect cached Order ID is in Orders Grid row 1
    Then select Grid Toolbar Move menu item Move to Awaiting Shipment
    Then click Move to Awaiting Shipment modal move button
    Then select Filter Panel tab Awaiting Shipment
    Then expect selected Filter is Awaiting Shipment
    Then expect saved Order ID exist in the selected filter
    Then Sign out