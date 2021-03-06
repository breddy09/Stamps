Feature: PM Comm Base Rates

  Background:
    Given Start test driver
    Given sign-in to orders
    Given excel rate sheet is loaded
    Given prepare environment for ratings test

  @rates_orders_pm_comm_base_zone_1
  Scenario: PM Comm Base Zone 1
    #Then set order details ship-from to Automation - El Segundo, CA
    Then run rate test PM Comm Base in Zone 1
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_orders_pm_comm_base_zone_2
  Scenario: PM Comm Base Zone 2
    #Then set order details ship-from to Automation - El Segundo, CA
    Then run rate test PM Comm Base in Zone 2
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_orders_pm_comm_base_zone_3
  Scenario: PM Comm Base Zone 3
    #Then set order details ship-from to Automation - El Segundo, CA
    Then run rate test PM Comm Base in Zone 3
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_orders_pm_comm_base_zone_4
  Scenario: PM Comm Base Zone 4
    #Then set order details ship-from to Automation - El Segundo, CA
    Then run rate test PM Comm Base in Zone 4
    Then Rates: Number of failed test should be less than 1
    Then sign out


  @rates_orders_pm_comm_base_zone_5
  Scenario: PM Comm Base Zone 5
    #Then set order details ship-from to Automation - El Segundo, CA
    Then run rate test PM Comm Base in Zone 5
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_orders_pm_comm_base_zone_6
  Scenario: PM Comm Base Zone 6
    #Then set order details ship-from to Automation - El Segundo, CA
    Then run rate test PM Comm Base in Zone 6
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_orders_pm_comm_base_zone_7
  Scenario: PM Comm Base Zone 7
    #Then set order details ship-from to Automation - El Segundo, CA
    Then run rate test PM Comm Base in Zone 7
    Then Rates: Number of failed test should be less than 1
    Then sign out
    
  @rates_orders_pm_comm_base_zone_8
  Scenario: PM Comm Base Zone 8
    #Then set order details ship-from to Automation - El Segundo, CA
    Then run rate test PM Comm Base in Zone 8
    Then Rates: Number of failed test should be less than 1
    Then sign out
    
  @rates_orders_pm_comm_base_zone_9
  Scenario: PM Comm Base Zone 9
    #Then set order details ship-from to Automation - El Segundo, CA
    Then run rate test PM Comm Base in Zone 9
    Then Rates: Number of failed test should be less than 1
    Then sign out