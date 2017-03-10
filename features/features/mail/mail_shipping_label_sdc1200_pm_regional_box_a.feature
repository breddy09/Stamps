Feature: Mail Shipping Label - SDC-1200 - PM Regional Rate Box A



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_shipping_label_sdc1200_pm_regional_box_a
  Scenario: Shipping Label - SDC-1200 - PM Regional Rate Box A

    Then select Print On Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"

    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Mail Service Priority Mail Regional Rate Box A
    Then on Print form, select left side starting label
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out