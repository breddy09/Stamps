Feature: Mail Shipping Label - SDC-1200 - PM Medium Flat Rate Box



  Background:
    Given I am signed in as Mail shipper


  @mail_shipping_label_sdc1200_pm_medium_box
  Scenario: Shipping Label - SDC-1200 - PM Medium Flat Rate Box

    Then Mail: Select Shipping Label SDC-1200

    Then Mail: Set Ship-From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | random | random  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Shipping Labels: Select Service Priority Mail Medium Flat Rate Box
    Then Mail Shipping Labels: Select left side starting label
    Then Mail: Open Print Modal
    Then Mail Print Modal: Select Printer "factory"
    Then Mail Print Modal: Print
    Then Sign out