
@mail_print_by_split_button
Feature: New Sprint 12/6/17 WEBAPPS-6803 Add Print Split button to Mail Page. Print Stamps, Labels, Envelopes, Certified Mails using split button

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_shipping_label
  Scenario: Shipping Label using split button

    #mail_print_shipping_label_5x8_fcm_large_envelope
    Then select Print On Shipping Label - 5x8
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service FCM Large Envelope
    Then Print label using split button
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_print_shipping_label_5x8_psg
  Scenario: Shipping Label - 5 ½” x 8 ½” - PSG

   #mail_print_shipping_label_5x8_psg_large_package
    Then select Print On Shipping Label - 5x8
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service PSG Large Package
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_shipping_label_5x8_psg_oversized_package
    Then select Print On Shipping Label - 5x8
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service PSG Oversized Package
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_shipping_label_5x8_psg_package
    Then select Print On Shipping Label - 5x8
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service PSG Package
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

    Then Sign out