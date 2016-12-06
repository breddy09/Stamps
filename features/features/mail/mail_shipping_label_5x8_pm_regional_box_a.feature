Feature: Mail Shipping Label - 5 ½” x 8 ½” - PM Regional Rate Box A



  Background:
    Given I am signed in as Mail shipper


  @mail_print_shipping_label_5x8_pm_regional_box_a
  Scenario: Shipping Label - 5 ½” x 8 ½” - PM Regional Rate Box A

    Then Mail: Select Shipping Label - 5 ½” x 8 ½”

    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | random | random  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Shipping Labels: Select Service Priority Mail Regional Rate Box A
    Then Mail Shipping Labels: Select left side starting label
    Then Mail: Open Print Modal
    Then Mail Print Modal: Select Printer "factory"
    Then Mail Print Modal: Print
    Then Sign out