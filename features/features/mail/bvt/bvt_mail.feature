Feature: BVT for Mail page
  Background:
    Given a valid user is signed in to Web Apps

  #@mail_authentication
  #Scenario: Mail Authentication Test
  #  Then sign out

  @mobile_mail_smoke_test
  @mail_bvt_envelopes
  Scenario: Envelope
    Then select print on Envelope - 10
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 1
    Then set print form ounces to 1
    Then select print form service FCM Letter
  #Then expect Print Form service cost for FCM Letter is N/A
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then sign out

  @bvt_mail_piece_validation
  Scenario: Envelope - #10
    Then select print on Envelope - 10
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 1
    Then set print form ounces to 1
    Then select print form service FCM Letter
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then sign out

  @bvt_mail_piece_validation
  Scenario: Shipping Label - 8 ½" x 11" Paper
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form pounds to 0
    Then set print form ounces to 1
    Then select print form service PM Flat Rate Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then sign out

  @bvt_mail_piece_validation
  Scenario: Roll - 4" x 6" Shipping Label
    Then select print on Roll 4x6
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Large Flat Rate Box
    Then click mail statusbar print
#    Then set Mail Print modal Printer Zebra LP 2844 on qa-printlab2016
    Then set Mail Print modal Printer ZDesigner LP 2844
    Then click Mail Print modal Print button
    Then sign out

  @bvt_mail_piece_validation
  Scenario: Certified Mail Label - SDC-3610
#    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then select print on Certified Mail Label - SDC-3610
    Then set Print form Mail-From to default
#    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form pounds to 0
    Then set print form ounces to 1
    Then select print form service PM Package
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then sign out

  @bvt_mail_piece_validation
  Scenario: Shipping Label - 8 ½" x 11" Paper
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form pounds to 0
    Then set print form ounces to 1
    Then select print form service PM Flat Rate Envelope
    Then show advanced options
    Then check advanced options print receipt
    Then click mail statusbar print label
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then sign out

  @mobile_mail_smoke_test
  @mail_bvt_stamps
  Scenario: Print form Specify Postage
    Then select print on Stamps

    Then set print form serial number to C12345
    Then select advanced options specify postage amount
    Then set Print form Mail-From to default
    Then select print form service Media Mail
    Then set print form stamp amount 2.85
    Then set print form stamp quantity 1
    Then set advanced options reference number to Stamp3221
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

    Then set print form serial number to B12345
    Then select advanced options calculate postage amount
    Then set Print form Mail-From to default
    Then set print form ounces to 1
    Then select print form service FCM Letter
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

    Then sign out

  @mail_service_validation
  Scenario: Mail Service Validation
    Then select print on Stamps
    Then select print form service Media Mail
    Then select print form service FCM Letter
    Then select print form service FCM Large Envelope/Flat
    Then sign out

  @mail_service_validation
  Scenario: Mail Service Validation for Stamps
    Then select print on Stamps
    Then show advanced options
    Then set print form serial number to B12345
    Then select advanced options specify postage amount
    Then set Print form Mail-From to default
    Then select print form service Media Mail
    Then set print form stamp amount 2
    Then set print form stamp quantity 1
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then sign out

  @mail_service_validation
  Scenario: Envelope - #10
    Then select print on Envelope - 10
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 1
    Then set print form ounces to 1
    Then select print form service FCM Letter
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then sign out

  @mail_service_validation
  Scenario: Shipping Label - 8 ½" x 11" Paper
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form pounds to 0
    Then set print form ounces to 1
    Then select print form service PM Flat Rate Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then sign out

  @mail_service_validation
  Scenario: Roll - 4" x 6" Shipping Label
    Then select print on Roll 4x6
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Large Flat Rate Box
    Then click mail statusbar print
    Then set Mail Print modal Printer Zebra LP 2844 on qa-printlab2016
    Then click Mail Print modal Print button
    Then sign out

  @mail_service_validation
  Scenario: Certified Mail Label - SDC-3610
#    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then select print on Certified Mail Label - SDC-3610
    Then set Print form Mail-From to default
#    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form pounds to 0
    Then set print form ounces to 1
    Then select print form service PM Package
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then sign out

  @mail_service_validation
  Scenario: Shipping Label - 8 ½" x 11" Paper
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form pounds to 0
    Then set print form ounces to 1
    Then select print form service PM Flat Rate Envelope
    Then show advanced options
    Then check advanced options print receipt
    Then click mail statusbar print label
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then sign out

