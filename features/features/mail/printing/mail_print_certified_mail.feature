@mail_print_certified_mail_hidden_postage
Feature: Print Certified Mail (with hidden postage)

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_SDC_3610_hidden_postage
  Scenario: Print SDC 3610 (with hidden postage)

    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form pounds to 0
    Then set print form ounces to 1
    Then select print form service PM Package
    Then show advanced options
    Then check Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is checked
    Then select print on Certified Mail Label - SDC-3610
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_print_SDC_3710_hidden_postage
  Scenario: Print SDC 3710 (with hidden postage)

    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form pounds to 0
    Then set print form ounces to 1
    Then select print form service PM Package
    Then show advanced options
    Then check Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is checked
    Then select print on Certified Mail Label - SDC-3710
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_print_SDC_3910_hidden_postage
  Scenario: Print SDC 3910 (with hidden postage)

    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form pounds to 0
    Then set print form ounces to 1
    Then select print form service PM Package
    Then show advanced options
    Then check Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is checked
    Then select print on Certified Mail Label - SDC-3910
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_print_SDC_3930_hidden_postage
  Scenario: Print SDC 3930 (with hidden postage)

    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form pounds to 0
    Then set print form ounces to 1
    Then select print form service PM Package
    Then show advanced options
    Then check Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is checked
    Then select print on Certified Mail Label - SDC-3930
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_print_SDC_3810_hidden_postage
  Scenario: Print SDC 3810 (with hidden postage)

    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form pounds to 0
    Then set print form ounces to 1
    Then select print form service PM Package
    Then show advanced options
    Then check Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is checked
    Then select print on Certified Mail Label - SDC-3810
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_print_SDC_3830_hidden_postage
  Scenario: Print SDC 3830 (with hidden postage)

    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form pounds to 0
    Then set print form ounces to 1
    Then select print form service PM Package
    Then show advanced options
    Then check Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is checked
    Then select print on Certified Mail Label - SDC-3830
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button