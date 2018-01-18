
@mail_print_roll_4_x_6_mm_xm
Feature: Mail Roll - 4" x 6" - MM XM

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_roll_4_x_6_mm
  Scenario: Roll - 4" x 6" - MM

    #mail_print_roll_4x6_mm_package
    Then select Print On Roll 4x6
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service MM Package
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

  @mail_print_roll_4_x_6_xm_envelope
  Scenario: Roll - 4" x 6" - XM Envelope

   #mail_print_roll_4x6_xm_fr_envelope
    Then select Print On Roll 4x6
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service PME Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

   #mail_print_roll_4x6_xm_lfr_envelope
    Then select Print On Roll 4x6
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service PME Legal Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

    #mail_print_roll_4x6_xm_pfr_envelope
    Then select Print On Roll 4x6
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service PME Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

  @mail_print_roll_4_x_6_xm_package
  Scenario: Roll - 4" x 6" - XM Package

   #mail_print_roll_4x6_xm_package
    Then select Print On Roll 4x6
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service PME Package/Flat/Thick Envelope
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

    Then Sign out