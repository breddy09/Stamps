Feature: PM Comm Base Rates

  Background:
    Given Login and configure rate tests

  @rates_pm_comm_base_zone_1
  Scenario: PM Comm Base Zone 1
    Then set Order Details form Ship-From to default
    Then run rate test PM Comm Base in Zone 1
    Then Rates: Number of failed test should be less than 1
    Then Sign out

  @rates_pm_comm_base_zone_2
  Scenario: PM Comm Base Zone 2
    Then set Order Details form Ship-From to default
    Then run rate test PM Comm Base in Zone 2
    Then Rates: Number of failed test should be less than 1
    Then Sign out

  @rates_pm_comm_base_zone_3
  Scenario: PM Comm Base Zone 3
    Then set Order Details form Ship-From to default
    Then run rate test PM Comm Base in Zone 3
    Then Rates: Number of failed test should be less than 1
    Then Sign out

  @rates_pm_comm_base_zone_4
  Scenario: PM Comm Base Zone 4
    Then set Order Details form Ship-From to default
    Then run rate test PM Comm Base in Zone 4
    Then Rates: Number of failed test should be less than 1
    Then Sign out


  @rates_pm_comm_base_zone_5
  Scenario: PM Comm Base Zone 5
    Then set Order Details form Ship-From to default
    Then run rate test PM Comm Base in Zone 5
    Then Rates: Number of failed test should be less than 1
    Then Sign out

  @rates_pm_comm_base_zone_6
  Scenario: PM Comm Base Zone 6
    Then set Order Details form Ship-From to default
    Then run rate test PM Comm Base in Zone 6
    Then Rates: Number of failed test should be less than 1
    Then Sign out

  @rates_pm_comm_base_zone_7
  Scenario: PM Comm Base Zone 7
    Then set Order Details form Ship-From to default
    Then run rate test PM Comm Base in Zone 7
    Then Rates: Number of failed test should be less than 1
    Then Sign out
    
  @rates_pm_comm_base_zone_8
  Scenario: PM Comm Base Zone 8
    Then set Order Details form Ship-From to default
    Then run rate test PM Comm Base in Zone 8
    Then Rates: Number of failed test should be less than 1
    Then Sign out
    
  @rates_pm_comm_base_zone_9
  Scenario: PM Comm Base Zone 9
    Then set Order Details form Ship-From to default
    Then run rate test PM Comm Base in Zone 9
    Then Rates: Number of failed test should be less than 1
    Then Sign out