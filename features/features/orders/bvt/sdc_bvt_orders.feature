Feature:  BVT tests for Orders

  Background:
    Given Start test driver

  @authentication
  Scenario: Orders Authentication Test
    Then visit Orders landing page
    Then sign-in to Orders
    Then sign-out of SDC Website

  @bvt_new_order
  Scenario:  BVT Add a new order
    Then visit Orders landing page
    Then sign-in to Orders
    Then add new order
    Then set Order Details Ship-To to random address between zone 9
    Then set Order Details service to PM Package
    Then set Order Details Pounds to 1
    Then set Order Details Ounces to 1
    Then set Order Details Insure-For to $1.00
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
#  # Orders Grid Operations
    Then uncheck Orders Grid row 1
    Then expect Orders Grid Pounds is 1
    Then expect Orders Grid Ounces is 1
    Then expect Orders Grid Weight is 1 lb. 1 oz.
    Then expect Orders Grid Insured Value is $1.00
    Then sign-out of SDC Website


  @print_dialog_ship_date @bvt_orders_ship_date
  Scenario: Set Ship Date to today
    Then visit Orders landing page
    Then sign-in to Orders
  # Ship Date today
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set Order Details Ounces to 4
    Then set Order Details service to PM Flat Rate Envelope
    Then click Orders Toolbar Print button
    Then set Print modal Ship Date to today
    Then set Print modal Print-On to Shipping Label - 8 ½" x 11" Paper
    Then close Print Modal

#    Then set Orders print modal printer
#    Then click print modal print button
#    Then Pause for 2 seconds
#    Then select Filter Panel tab Shipped
#    Then expect Orders Grid Ship Date for this order is correct
#    Then expect Orders Grid Date Printed for this order is correct

  # Ship Date today + 1
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set Order Details Ounces to 4
    Then set Order Details service to PM Flat Rate Envelope
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then set Print modal Ship Date to today plus 1
    Then click print modal print button
    Then Pause for 2 seconds
    Then select Filter Panel tab Shipped
    Then expect Orders Grid Ship Date for this order is correct
    Then expect Orders Grid Date Printed for this order is correct

  # Ship Date Today + 2
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set Order Details Ounces to 4
    Then set Order Details service to PM Flat Rate Envelope
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then set Print modal Ship Date to today plus 2
    Then click print modal print button
    Then Pause for 2 seconds
    Then select Filter Panel tab Shipped
    Then expect Orders Grid Date Printed for this order is correct
    Then expect Orders Grid Ship Date for this order is correct

  # Ship Date Today + 3
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set Order Details Ounces to 4
    Then set Order Details service to PM Flat Rate Envelope
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then set Print modal Ship Date to today plus 3
    Then click print modal print button
    Then Pause for 2 seconds
    Then select Filter Panel tab Shipped
    Then expect Orders Grid Date Printed for this order is correct
    Then expect Orders Grid Ship Date for this order is correct
    Then Sign out