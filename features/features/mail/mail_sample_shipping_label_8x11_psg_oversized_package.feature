Feature: Mail Sample Shipping Label - 8 ½” x 11” Paper - PSG Oversized Package



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_sample_shipping_label_8x11_psg_oversized_package
  Scenario: Sample Shipping Label - 8 ½” x 11” Paper - PSG Oversized Package

    Then select Print On Shipping Label - 8 x 11 Paper on Print form

    Then set Print form Mail From to default
    Then set Print form Mail to country to United States
    Then on Print form, set Mail To address to zone 5 through 8
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then on Print form, select service Parcel Select Ground Oversized Package
    Then on Print form, select left side starting label
    Then click Print Sample button on Print form
    Then set Mail Print modal Printer to factory
    Then click Print button on Mail Print modal Sample
    Then Sign out