
@mail_print_roll_4_1_8_x_6_1_4_fcm_psg
Feature: Mail Roll - 4 ⅛” x 6 ¼” - FCM_PSG

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_roll_4_1_8_x_6_1_4_fcm
  Scenario: Print on: Roll - 4 ⅛” x 6 ¼” - FCM

   #mail_print_roll_4_1_8_x_6_1_4_fcm_large_envelope
    Then select print on Roll 418x614
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_fcm_package
    Then select print on Roll 418x614
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service FCM Package/Thick Envelope
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

  @mail_print_roll_4_1_8_x_6_1_4_psg
  Scenario: Print On: Roll - 4 ⅛” x 6 ¼” - PSG

    Then select print on Roll 418x614
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PSG Large Package
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_psg_oversized_package
    Then select print on Roll 418x614
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PSG Oversized Package
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_psg_package
    Then select print on Roll 418x614
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PSG Package/Flat/Thick Envelope
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

    Then sign out
