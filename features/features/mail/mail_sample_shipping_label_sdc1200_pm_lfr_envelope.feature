Feature: Mail Sample Shipping Label - SDC-1200 - PM Legal Flat Rate Envelope



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_sample_shipping_label_sdc1200_pm_lfr_envelope
  Scenario: Sample Shipping Label - SDC-1200 - PM Legal Flat Rate Envelope

    Then select Print On Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"

    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4

    Then set Print form Ounces to 1
    Then select Print form service Priority Mail Legal Flat Rate Envelope
    Then click Print Sample button on Print form
    Then set Mail Print modal Printer to factory
    Then click Print button on Mail Print modal Sample
    Then Sign out