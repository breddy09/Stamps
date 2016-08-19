Feature: Postage Sample Shipping Label - 5 ½” x 8 ½” - FCM Large Envelope



  Background:
    Given I am signed in as a postage shipper


  @wp_shipping_label_regression
  @wp_sample_shipping_label_5x8_fcm_large_envelope
  Scenario: Sample Shipping Label - 5 ½” x 8 ½” - FCM Large Envelope

    Then Postage: Select Shipping Label 5 x 8

    Then Postage: Set Ship-From to default
    Then Postage: Set Ship-To country to United States
    Then Postage: Set Ship-To to Random Address Between Zone 5 through 8
    Then Postage: Set Pounds to 0
    Then Postage: Set Ounces to 1
    Then Postage Shipping Labels: Select Service First-Class Mail Large Envelope-Flat
    Then Postage Shipping Labels: Select left side starting label
    Then Postage: Open Print Sample Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print Sample
    Then Sign out