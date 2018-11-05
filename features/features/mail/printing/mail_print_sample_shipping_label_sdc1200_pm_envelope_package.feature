
@mail_print_sample_shipping_label_sdc1200_pm_envelope_package
Feature: Mail Sample Shipping Label - SDC-1200 - PM Envelope Package

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_sample_shipping_label_sdc1200_pm_envelope
  Scenario: Sample Shipping Label - SDC-1200 - PM Envelope

   #mail_print_sample_shipping_label_sdc1200_pm_fr_envelope
    Then select print on Shipping Label - SDC-1200
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PM Flat Rate Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

   #mail_print_sample_shipping_label_sdc1200_pm_large_envelope
    Then select print on Shipping Label - SDC-1200
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PM Large/Thick Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

    #mail_print_sample_shipping_label_sdc1200_pm_lfr_envelope
    Then select print on Shipping Label - SDC-1200
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PM Legal Flat Rate Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

    #mail_print_sample_shipping_label_sdc1200_pm_pfr_envelope
    Then select print on Shipping Label - SDC-1200
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Padded Flat Rate Envelope
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

  @mail_print_sample_shipping_label_sdc1200_pm_package
  Scenario: Sample Shipping Label - SDC-1200 - PM Package

    #mail_print_sample_shipping_label_sdc1200_pm_large_package
    Then select print on Shipping Label - SDC-1200
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PM Large Package
    Then set dimensions to length 2 width 2 height 2
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

   #mail_print_sample_shipping_label_sdc1200_pm_package
    Then select print on Shipping Label - SDC-1200
    Then set print form mail-from to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Package
    Then click mail statusbar print
    Then set Mail Print modal Printer
    Then click print button on mail print modal

    Then sign out