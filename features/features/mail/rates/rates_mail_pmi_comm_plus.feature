Feature: PMI Comm Plus Rates

  Background:
    Given Start test driver
    Given sign-in to mail
    Given excel rate sheet is loaded
    Given prepare environment for ratings test

  @rates_mail_pmi_comm_plus_group_1
  Scenario: PMI Comm Plus Group 1
    Then run rate test PMI Comm Plus in country price group 1
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_mail_pmi_comm_plus_group_2
  Scenario: PMI Comm Plus Group 2
    #Then set
    Then run rate test PMI Comm Plus in country price group 2
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_mail_pmi_comm_plus_group_3
  Scenario: PMI Comm Plus Group 3
    Then run rate test PMI Comm Plus in country price group 3
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_mail_pmi_comm_plus_group_4
  Scenario: PMI Comm Plus Group 4
    #Then Open Orders Settings
    Then run rate test PMI Comm Plus in country price group 4
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_mail_pmi_comm_plus_group_5
  Scenario: PMI Comm Plus Group 5
    Then run rate test PMI Comm Plus in country price group 5
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_mail_pmi_comm_plus_group_6
  Scenario: PMI Comm Plus Group 6
    Then run rate test PMI Comm Plus in country price group 6
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_mail_pmi_comm_plus_group_7
  Scenario: PMI Comm Plus Group 7
    Then run rate test PMI Comm Plus in country price group 7
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_mail_pmi_comm_plus_group_8
  Scenario: PMI Comm Plus Group 8
    Then run rate test PMI Comm Plus in country price group 8
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_mail_pmi_comm_plus_group_9
  Scenario: PMI Comm Plus Group 9
    Then run rate test PMI Comm Plus in country price group 9
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_mail_pmi_comm_plus_group_10
  Scenario: PMI Comm Plus Group 10
    Then run rate test PMI Comm Plus in country price group 10
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_mail_pmi_comm_plus_group_11
  Scenario: PMI Comm Plus Group 11
    Then run rate test PMI Comm Plus in country price group 11
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_mail_pmi_comm_plus_group_12
  Scenario: PMI Comm Plus Group 12
    Then run rate test PMI Comm Plus in country price group 12
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_mail_pmi_comm_plus_group_13
  Scenario: PMI Comm Plus Group 13
    Then run rate test PMI Comm Plus in country price group 13
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_mail_pmi_comm_plus_group_14
  Scenario: PMI Comm Plus Group 14
    Then run rate test PMI Comm Plus in country price group 14
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_mail_pmi_comm_plus_group_15
  Scenario: PMI Comm Plus Group 15
    Then run rate test PMI Comm Plus in country price group 15
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_mail_pmi_comm_plus_group_16
  Scenario: PMI Comm Plus Group 16
    Then run rate test PMI Comm Plus in country price group 16
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_mail_pmi_comm_plus_group_17
  Scenario: PMI Comm Plus Group 17
    Then run rate test PMI Comm Plus in country price group 17
    Then Rates: Number of failed test should be less than 1
    Then sign out