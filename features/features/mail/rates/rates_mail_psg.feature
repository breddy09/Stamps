Feature: Parcel Select Ground Rates

  Background:
    Given Start test driver
    Given sign-in to mail
    Given excel rate sheet is loaded
    Given prepare environment for ratings test

  @rates_mail_parcel_select_ground_zone_1
  Scenario: Parcel Select Ground Zone 1
    Then run rate test Parcel Select Ground in Zone 1
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_mail_parcel_select_ground_zone_2
  Scenario: Parcel Select Ground Zone 2
    Then run rate test Parcel Select Ground in Zone 2
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_mail_parcel_select_ground_zone_3
  Scenario: Parcel Select Ground Zone 3
    Then run rate test Parcel Select Ground in Zone 3
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_mail_parcel_select_ground_zone_4
  Scenario: Parcel Select Ground Zone 4
    Then run rate test Parcel Select Ground in Zone 4
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_mail_parcel_select_ground_zone_5
  Scenario: Parcel Select Ground Zone 5
    Then run rate test Parcel Select Ground in Zone 5
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_mail_parcel_select_ground_zone_6
  Scenario: Parcel Select Ground Zone 6
    Then run rate test Parcel Select Ground in Zone 6
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_mail_parcel_select_ground_zone_7
  Scenario: Parcel Select Ground Zone 7
    Then run rate test Parcel Select Ground in Zone 7
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_mail_parcel_select_ground_zone_8
  Scenario: Parcel Select Ground Zone 8
    Then run rate test Parcel Select Ground in Zone 8
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_mail_parcel_select_ground_zone_9
  Scenario: Parcel Select Ground Zone 9
    Then run rate test Parcel Select Ground in Zone 9
    Then Rates: Number of failed test should be less than 1
    Then sign out