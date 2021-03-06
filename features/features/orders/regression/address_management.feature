
Feature:  Address Management

  Background:
    Given a valid user is signed in to Web Apps

  @address_management
  Scenario: Address Management
    Then add new order
    Then add new address to manage shipping address
      |ship_from_zip  | full_name  | company    | street_address     | street_address2 | city          | state       | zip    | country       | phone           |
      |90245          | Euan  | Betfair UK | 101 Mission Street | Suite 700       | San Francisco | California  | 94105  | United States | (415) 123-5555  |
    Then on Manage Shipping Address modal, edit address for name="Euan", company="Betfair UK" and city="San Francisco" to:
      |ship_from_zip  | full_name  | company    | street_address     | street_address2 | city       | state      | zip    | country       | phone  |
      |90245          | Rob   | Stamps.com | 1990 E. Grand Ave. |                 | El Segundo | California | 90245  | United States | random |
    Then delete manage shipping address row 1
    Then delete all addresses on manage shipping address modal
    Then sign out


