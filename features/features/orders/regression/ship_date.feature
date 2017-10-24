
Feature: Ship Date

  Background:
    Given a valid user is signed in to Web Apps

  @ship_date
  Scenario:  set Print modal Ship Date to today
    Then add new order
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PM Package
    Then click Orders Toolbar Print button
    Then set Print modal Ship Date to today
    Then In left Filter Panel, expect Shipped Tab Ship Date is today
    Then click print modal print button
    Then Sign out


  @ship_date
  Scenario:  set Print modal Ship Date to 1 day from today
    Then add new order
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PM Package
    Then click Orders Toolbar Print button
    Then set Print modal Ship Date to today plus 1
    Then set Print modal Ship Date to today plus 3
    Then click print modal print button
    Then Sign out


  @ship_date
  Scenario:  set Print modal Ship Date to 1 day from today
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PM Package
    Then click Orders Toolbar Print button
    Then set Print modal Ship Date to today plus 2
    Then In left Filter Panel, expect Shipped Tab Ship Date is today plus 2
    Then click print modal print button
    Then Sign out


  @ship_date
  Scenario:  set Print modal Ship Date to 1 day from today
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PM Package
    Then click Orders Toolbar Print button
    Then set Print modal Ship Date to today plus 3
    Then In left Filter Panel, expect Shipped Tab Ship Date is today plus 3
    Then click print modal print button
    Then Sign out


