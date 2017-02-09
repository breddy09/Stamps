Feature: Mail Stamps.com Shipping Label - SDC-1200 - PM Regional Rate Box B



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_sample_shipping_label_sdc1200_pm_regional_box_b
  Scenario: Sample Shipping Label - SDC-1200 - PM Regional Rate Box B

    Then on Shipping Label Print form, select Shipping Label - SDC-1200, 4 ¼” x 6 ¾”

    Then on Print form, set Mail From to default
    Then on Print form, set Ship-To country to United States
    Then on Print form, set Ship-To to Random Address Between Zone 5 through 8
    Then on Print form, set Pounds to 0
    Then on Print form, set Ounces to 1
    Then on Shipping Label Print form, select service Priority Mail Regional Rate Box B
    Then on Shipping Label Print form, select left side starting label
    Then Mail: Open Print Sample Modal
    Then in Mail Print modal, select Printer "factory"
    Then in Mail Print modal, click Print button Sample
    Then Sign out