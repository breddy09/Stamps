
@mail_print_envelope_6_7_9_11_12
Feature: Envelope #6, #7, #9, #11, #12

  Background:
    #Given a valid user is signed in to Web Apps
    Given Start test driver

  @mail_print_envelope_6_rob
  Scenario: Print On: Envelope #6
    Then sign-in to mail
    Then select print on Envelope - #6, 3 ⅝" x 6 ½"
    #Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service FCM Letter
    Then click print stamps
    Then confirm print on gif printing dialog

  @mail_print_envelope_7
  Scenario: Print On: Envelope #7

    Then select print on Envelope - 7
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service FCM Letter
    Then click mail status bar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

  @mail_print_envelope_9
  Scenario: Print On: Envelope #9

    Then select print on Envelope - 9
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service FCM Letter
    Then click mail statusbar print postage
    Then set Mail Print modal Printer
    Then click print button on mail print modal

  @mail_print_envelope_11
  Scenario: Print On: Envelope #11

    Then select print on Envelope - 11
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service FCM Letter
    Then click mail statusbar print
    Then set Mail Print modal Printer

    Then click print button on mail print modal

  @mail_print_envelope_12
  Scenario: Print On: Envelope #12

    Then select print on Envelope - 12
    Then set print form mail-from to default
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service FCM Letter
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal
    
    Then sign out
