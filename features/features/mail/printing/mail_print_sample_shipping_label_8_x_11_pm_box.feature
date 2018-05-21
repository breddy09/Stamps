
@mail_print_sample_shipping_label_8_x_11_pm_box
Feature: Mail Sample Shipping Label - 8 ½” x 11” PM BOX Paper

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_sample_shipping_label_8_x_11_pm_box_size
  Scenario: Sample Shipping Label - 8 ½” x 11” PM BOX Size Paper

    #mail_print_sample_shipping_label_8x11_pm_large_box
    Then select Print On Shipping Label - Paper
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service PM Large Flat Rate Box
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_sample_shipping_label_8x11_pm_medium_box
    Then select Print On Shipping Label - Paper
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service PM Medium Flat Rate Box
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

    #mail_print_sample_shipping_label_8x11_pm_small_box
    Then select Print On Shipping Label - Paper
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service PM Small Flat Rate Box
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_print_sample_shipping_label_8_x_11_pm_regional_box
  Scenario: Sample Shipping Label - 8 ½” x 11” PM Regional BOX Paper

   #mail_print_sample_shipping_label_8x11_pm_regional_box_a
    Then select Print On Shipping Label - Paper
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service PM Regional Rate Box A
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_sample_shipping_label_8x11_pm_regional_box_b
    Then select Print On Shipping Label - Paper
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service PM Regional Rate Box B
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

    Then Sign out