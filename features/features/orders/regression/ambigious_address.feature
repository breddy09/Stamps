Feature: Ambigious Address

  Background:
    Given a valid user is signed in to Web Apps

  @ambigious_address
  Scenario: Exact Address Not Found
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To ambiguous address to
      | full_name            | company                 | street_address      | city          | state | zip   | country       | phone  |  email |
      | Hillary Clinton | The White House         | 1390 Market Street  | San Francisco | CA    | 94102 | United States |        |        |
    Then Expect Exact Address Not Found module to appear
    Then In Exact Address Not Found module, select row 1
    Then set Order Details Ounces to 1
    Then set Order Details Pounds to 1
    Then expect Orders Grid Recipient is Hillary Clinton
    Then expect Orders Grid Company is The White House
    Then expect Orders Grid City is San Francisco
    Then expect Orders Grid State is CA
    Then expect Orders Grid Zip is 94102
    Then set Order Details service to PM Package
    Then Sign out

