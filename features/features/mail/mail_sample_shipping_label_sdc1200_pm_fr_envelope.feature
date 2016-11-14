Feature: Mail Sample Shipping Label - SDC-1200 - PM FR Envelope



  Background:
    Given I am signed in as Mail shipper


  @mail_print_sample_shipping_label_sdc1200_pm_fr_envelope
  Scenario: Sample Shipping Label - SDC-1200 - PM FR Envelope

    Then Mail: Select Shipping Label SDC-1200

    Then Mail: Set Ship-From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 1 through 4
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Shipping Labels: Select Service Priority Mail Flat Rate Envelope
    Then Mail Shipping Labels: Select left side starting label
    Then Mail: Open Print Sample Modal
    Then Mail Print Modal: Select Printer "factory"
    Then Mail Print Modal: Print Sample
    Then Sign out