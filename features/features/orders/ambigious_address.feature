Feature: Ambigious Address

  Background:
    Given I am signed in to Orders

  @ambigious_address
  Scenario: Exact Address Not Found
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to ambiguous address
      | name            | company                 | street_address      | city          | state | zip   | country       | phone  |  email |
      | Hillary Clinton | The White House         | 1390 Market Street  | San Francisco | CA    | 94102 | United States |        |        |
    Then Expect "Exact Address Not Found" module to appear
    Then Select row 1 from Exact Address Not Found module
    Then Order Details: Set Ounces to 1
    Then Order Details: Set Pounds to 1
    Then Order Details: Set Insure-For to $200
    Then Orders Grid: Expect Recipient is Hillary Clinton
    Then Orders Grid: Expect Company is The White House
    Then Orders Grid: Expect City is San Francisco
    Then Orders Grid: Expect State is CA
    Then Orders Grid: Expect Zip is 94102
    Then Order Details: Select Service PM Package
    Then Sign out

