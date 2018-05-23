Feature: Print 1 Domestic label on 5.5x8.5

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_5x8
  Scenario: Print 1 Domestic label on 5.5x8.5

   #print_two_up_expanded_5x8_left
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to PME MFR Box, 5.5x8.5, 2775 Stark Dr., Willoughby Hills OH 44094-9113
    Then set order details service to PME Padded Flat Rate Envelope
    Then set order details ounces to 1
    Then click orders toolbar print button
    Then set Print modal Print-On to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set Orders print modal printer
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button

   #print_two_up_expanded_5x8_left_print2
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to PS Large Package, 5.5x8.5, 530 K Street Unit 504, San Diego CA 92101-7060
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details ounces to 1
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to PS Large Package, 5.5x8.5, 7065 N Ingram Ave, Fresno CA 93650-1083
    Then set order details service to PSG Oversized Package
    Then set order details ounces to 1
    Then check Orders Grid row 1
    Then check Orders Grid row 2
    Then click orders toolbar print button
    Then set Print modal Print-On to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set Orders print modal printer
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button

   #print_two_up_expanded_5x8_left_print3
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to FCM Lg Env-Flat, 5.5x8.5, 2105 Kietzke Ln, Reno NV 89502-3602
    Then set order details service to FCM Large Envelope/Flat
    Then set order details ounces to 1
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to PM Lg-Thick Env, 5.5x8.5, 557 County Rd. H, Fredonia WI 53021-9634
    Then set order details service to PM Large/Thick Envelope
    Then set order details ounces to 1
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to FCM Pkg-Thick Env, 5.5x8.5, 2775 Stark Dr., Willoughby Hills OH 44094-9113
    Then set order details service to FCM Large Envelope/Flat
    Then set order details ounces to 1
    Then check Orders Grid row 1
    Then check Orders Grid row 2
    Then check Orders Grid row 3
    Then click orders toolbar print button
    Then set Print modal Print-On to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set Orders print modal printer
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button

   #print_two_up_expanded_5x8_right_print1
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to PS Package, 5.5x8.5 Right Side 1, 610 W Tefft St, Nipomo, CA 93444-9187
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details ounces to 1
    Then click orders toolbar print button
    Then set Print modal Print-On to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set Orders print modal printer
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then click print modal print button

  #print_two_up_expanded_5x8_right_print2
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to MM Package/Flat/Thick Envelope, 5.5x8.5 Right Side 2, 4937 79th St., Sacramento CA 95820-6213
    Then set order details service to MM Package/Flat/Thick Envelope
    Then set order details ounces to 1
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to PM Large Package, 5.5x8.5 Right Side 1, 26930 NE 152nd St., Duvall WA 98019-8316
    Then set order details service to PM Large Package
    Then set order details ounces to 1
    Then set Order Details Dimensions to Length 1 Width 1 Height 1
    Then check Orders Grid row 1
    Then check Orders Grid row 2
    Then click orders toolbar print button
    Then set Print modal Print-On to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set Orders print modal printer
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then click print modal print button

    Then sign out
