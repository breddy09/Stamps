Feature: Envelopes BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_services
  Scenario: Envelope
    Then select print on Stamps
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then select print on Shipping Label - SDC-1200
    Then select print on Shipping Label - 5x8
    Then select print on Envelope - 10
    Then select print on Envelope - 9
    Then select print on Envelope - A9
    Then select print on Envelope - #6, 3 ⅝" x 6 ½"
    Then select print on Envelope - A2
    Then select print on Envelope - 7
    Then select print on Envelope - 11
    Then select print on Envelope - 12
    Then select print on Certified Mail Label - SDC-3610
    Then select print on Certified Mail Label - SDC-3710
    Then select print on Certified Mail Label - SDC-3910
    Then select print on Certified Mail Label - SDC-3810
    Then select print on Roll 4x6
    Then select print on Roll 418x614

#set order details ship-to to a random address in Zone 1 through 4