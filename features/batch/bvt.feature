@bvt
Feature:  Build Verification Test

  Background:
    Given I am signed in as a batch shipper auto05/password1

  @bvt_shipping_address_management
  Scenario: Shipping Address Management
    * Add new order
    * Expect new Order ID created
    * Add new Ship-From address;
      |ship_from_zip  | name          | company     | street_address1    | street_address2 | city          | state         | zip    | country       | phone           |
      |94105          | Euan Davidson | Betfair UK  | 201 Mission Street | Suite 700       | San Francisco | California    | 94105  | United States | (415) 123-5555  |
    * Sign out

  @bvt_address_cleansing
  Scenario: Address Cleansing
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name    | company           | street_address      | city          | state | zip   | country       | phone           |  email            |
      | B-01603 | Address Cleansing | 1350 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    * Expect order-grid Zip Code to be 94102
    * Set Receipient partial address to;
      | name    | company           | street_address      | city          | state | zip   | country       | phone           |  email            |
      | B-01603 | Address Cleansing | 1390 Market Street  | San Francisco | CA    | 94102 | United States | (415) 123-5555  | rtest@stamps.com  |
    * Expect "Exact Address Not Found" module to appear
    * Select row 2 from Exact Address Not Found module
    * Set Service to Priority Mail Package
    * Set Ounces to 1
    * Expect order-grid Recipient Name to be B-01603
    * Expect order-grid Company Name to be Address Cleansing
    * Expect order-grid Street Address to be 1390 Market Street Ste 702
    * Expect order-grid City to be San Francisco
    * Expect order-grid State to be CA
    * Expect order-grid Zip Code to be 94102
    * Expect order-grid Phone to be (415) 123-5555
    * Expect order-grid Email to be rtest@stamps.com
    * Expect order-grid Ounces to be 1
    * Sign out

  @bvt_add_new_order
  Scenario:  Add New Order
    * Add new order
    * Expect new Order ID created
    * Expect Single Order Form - Service Rate to be $0.00
    * Set Ship From to default
    * Set Recipient Complete Address to B-01671, Inline Rates, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Set Pounds to 1
    * Set Ounces to 1
    * Set Length to 1
    * Set Width to 1
    * Set Height to 1
    * Set Insured Value to 1.00
    * Set Service to Priority Mail Package
    * Expect order-grid Recipient Name to be B-01671
    * Expect order-grid Company Name to be Inline Rates
    * Expect order-grid Street Address to be 1900 E Grand Ave
    * Expect order-grid City to be El Segundo
    * Expect order-grid State to be CA
    * Expect order-grid Zip Code to be 90245
    * Expect order-grid Phone to be (415) 123-5555
    * Expect order-grid Email to be rtest@stamps.com
    * Expect order-grid Pounds to be 1
    * Expect order-grid Ounces to be 1
    * Expect order-grid Weight to be 1 lbs. 1 oz.
    * Expect order-grid Insured Value to be 1.00
    * Sign out
