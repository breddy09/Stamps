@print_dialog_ship_date
@print_dialog_ship_date_1
Feature: Set Print Ship Date to Today

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_ship_date
  Scenario: Set Ship Date to today

  # Ship Date today
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set Order Details form Ounces to 4
    Then set Order Details form service to PM Flat Rate Envelope
    Then click Orders Toolbar Print button
    Then set Print modal Ship Date to today
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Orders print modal printer
    Then click print modal print button
    Then Pause for 2 seconds
    Then select Filter Panel tab Shipped
    Then expect Orders Grid Ship Date for this order is today
    Then expect Orders Grid Ship Date for this order is today plus 0
    Then expect Orders Grid Date Printed for this order is today

  # Ship Date today + 1
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set Order Details form Ounces to 4
    Then set Order Details form service to PM Flat Rate Envelope
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Orders print modal printer
    Then set Print modal Ship Date to today
    Then set Print modal Ship Date to today plus 1
    Then click print modal print button
    Then Pause for 2 seconds
    Then select Filter Panel tab Shipped
    Then expect Orders Grid Date Printed for this order is today
    Then expect Orders Grid Ship Date for this order is today plus 1

  # Ship Date Today + 2
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set Order Details form Ounces to 4
    Then set Order Details form service to PM Flat Rate Envelope
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Orders print modal printer
    Then set Print modal Ship Date to today plus 2
    Then click print modal print button
    Then Pause for 2 seconds
    Then select Filter Panel tab Shipped
    Then expect Orders Grid Date Printed for this order is today
    Then expect Orders Grid Ship Date for this order is today plus 2

  # Ship Date Today + 3
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set Order Details form Ounces to 4
    Then set Order Details form service to PM Flat Rate Envelope
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Orders print modal printer
    Then set Print modal Ship Date to today plus 3
    Then click print modal print button
    Then Pause for 2 seconds
    Then select Filter Panel tab Shipped
    Then expect Orders Grid Date Printed for this order is today
    Then expect Orders Grid Ship Date for this order is today plus 3
    Then Sign out

    