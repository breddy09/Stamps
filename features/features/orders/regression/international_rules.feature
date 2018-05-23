
@international_rules
Feature: All International Rules

  Background:
    Given a valid user is signed in to Web Apps

  @rules_international_dev
  Scenario: Add Missing Validation Logic for Phone and International Email
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Domestic Ship-To Country to Australia
    Then check Orders Grid row 1

    Then expect Order Details International Name data error tooltip is "A first and last name of at least two characters each is required"
    Then expect Order Details International Company data error tooltip is "Company name must be at least two characters long"
    Then expect Order Details International Address 1 data error tooltip is "The ship to address is a required field"
    Then expect Order Details International City data error tooltip is "The ship to city is a required field"
    Then expect Order Details International Phone data error tooltip is "A valid phone number is required"

    Then expect Order Details service data error tooltip is "Service is required"
    Then expect order details weight Lbs data error tooltip is "Weight cannot be 0"
    Then expect order details weight Oz data error tooltip is "Weight cannot be 0"
    Then sign out


  @rules_international_cuba
  Scenario: Cuba Internal Transaction Number Required
    Then add new order
    Then set Order Details Ship-From to default
    Then set order details ship-to international address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Cuba    | random  | random  |

    Then set order details ounces to 5
    Then set order details service to PMI Flat Rate Envelope
    Then click Order Details form Customs Form button
    Then set Customs Package Contents to Commercial Sample
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Document
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Merchandise
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Gift
    Then Expect Customs Internal Transaction Number is Not required
    Then set Customs Package Contents to Humanitarian Donation
    Then Expect Customs Internal Transaction Number is Not required
    Then set Customs Package Contents to Returned Goods
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Other
    Then Expect Customs Internal Transaction Number is Required

    Then add Customs Associated Item 1, description random, qty 1, Price 3000, Made In United States, Tariff 10
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs ITN Number to random
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then sign out


  @rules_international_iran
  Scenario: Iran Internal Transaction Number Required
    Then add new order
    Then set Order Details Ship-From to default
    Then set order details ship-to international address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Iran    | random  | random  |
    Then set order details ounces to 5
    Then set order details service to PMI Flat Rate Envelope

    Then click Order Details form Customs Form button
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Commercial Sample
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Document
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Merchandise
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Gift
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Humanitarian Donation
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Returned Goods
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Other
    Then Expect Customs Internal Transaction Number is Required

    Then add Customs Associated Item 1, description random, qty 1, Price 3000, Made In United States, Tariff 10
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs ITN Number to random
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then sign out



  @rules_international_customs_fields_validation
  Scenario: International Shipping fields and Customs Information fields validation
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Domestic Ship-To Country to Japan

    Then expect Order Details International Address fields are visible
    Then expect Order Details Domestic Ship-To fields are hidden
    Then expect Order Details Customs Restrictions button is visible
    Then expect Order Details Customs Customs Form button is visible

    Then set order details ship-to international address to
      | full_name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |

    Then set order details ounces to 5
    Then set order details service to PMI Flat Rate Envelope
    Then on order details form, add item 1, qty 1, id random, description random

    Then click Order Details form Customs Form button

    Then set Customs Package Contents to Commercial Sample
    Then expect Customs More Info is hidden
    Then expect Customs License Number is visible
    Then expect Customs Certificate Number is visible
    Then expect Customs Invoice Number is visible

    Then set Customs Package Contents to Document
    Then expect Customs More Info is visible
    Then expect Customs License Number is hidden
    Then expect Customs Certificate Number is hidden
    Then expect Customs Invoice Number is hidden

    Then set Customs Package Contents to Gift
    Then expect Customs More Info is visible
    Then expect Customs License Number is hidden
    Then expect Customs Certificate Number is hidden
    Then expect Customs Invoice Number is hidden

    Then set Customs Package Contents to Humanitarian Donation
    Then expect Customs More Info is visible
    Then expect Customs License Number is hidden
    Then expect Customs Certificate Number is hidden
    Then expect Customs Invoice Number is hidden

    Then set Customs Package Contents to Merchandise
    Then expect Customs More Info is visible
    Then expect Customs License Number is hidden
    Then expect Customs Certificate Number is hidden
    Then expect Customs Invoice Number is hidden

    Then set Customs Package Contents to Returned Goods
    Then expect Customs More Info is visible
    Then expect Customs License Number is hidden
    Then expect Customs Certificate Number is hidden
    Then expect Customs Invoice Number is hidden

    Then set Customs Package Contents to Commercial Sample
    Then expect Customs More Info is hidden
    Then set Customs License Number to random
    Then set Customs Certificate Number to random
    Then set Customs Invoice Number to random

    Then set Customs Non-Delivery Options to Treat as abandoned
    Then set Customs Non-Delivery Options to Return to sender

    Then set Customs Internal Transaction Number to Required
    Then expect Customs ITN Number is visible

    Then set Customs Internal Transaction Number to Not required
    Then expect Customs ITN Number is hidden

    Then set Customs Internal Transaction Number to Required
    Then set Customs ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then set order details service to FCMI Large Envelope/Flat
    Then sign out



  @rules_international_nkorea
  Scenario: North Korea Internal Transaction Number Required
    Then add new order
    Then set Order Details Ship-From to default
    Then set order details ship-to international address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Democratic People's Republic of (North) Korea| random  | random  |
    Then set order details ounces to 5
    Then set order details service to PMI Flat Rate Envelope
    Then click Order Details form Customs Form button
    Then set Customs Package Contents to Commercial Sample
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Document
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Merchandise
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Gift
    Then Expect Customs Internal Transaction Number is Not required
    Then set Customs Package Contents to Humanitarian Donation
    Then Expect Customs Internal Transaction Number is Not required
    Then set Customs Package Contents to Returned Goods
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Other
    Then Expect Customs Internal Transaction Number is Required
    Then add Customs Associated Item 1, description random, qty 1, Price 3000, Made In United States, Tariff 10
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs ITN Number to random
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then sign out



  @international_rogue_countries_sudan
  Scenario: Sudan Internal Transaction Number Required
    Then add new order
    Then set Order Details Ship-From to default
    Then set order details ship-to international address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Sudan    | random  | random  |

    Then set order details ounces to 5
    Then set order details service to PMI Flat Rate Envelope

  #Then set order details service to FCMI Large Envelope/Flat
    Then click Order Details form Customs Form button
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Commercial Sample
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Document
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Merchandise
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Gift
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Humanitarian Donation
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Returned Goods
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Other
    Then Expect Customs Internal Transaction Number is Required

    Then add Customs Associated Item 1, description random, qty 1, Price 3000, Made In United States, Tariff 10
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs ITN Number to random
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then sign out


  @rules_international_syria
  Scenario: Syria Internal Transaction Number Required
    Then add new order
    Then set Order Details Ship-From to default
    Then set order details ship-to international address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Syria    | random  | random  |

    Then set order details ounces to 5
    Then set order details service to PMI Flat Rate Envelope

  #Then set order details service to FCMI Large Envelope/Flat
    Then click Order Details form Customs Form button
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Commercial Sample
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Document
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Merchandise
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Gift
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Humanitarian Donation
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Returned Goods
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs Package Contents to Other
    Then Expect Customs Internal Transaction Number is Required

    Then add Customs Associated Item 1, description random, qty 1, Price 3000, Made In United States, Tariff 10
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs ITN Number to random
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then sign out



  @rules_international_over_2500
  Scenario: Customs Form Internal Transaction Number Required for total over $2500
    Then add new order
    Then set Order Details Ship-From to default
    Then set order details ship-to international address to
      | full_name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then set order details ounces to 5
    Then set order details service to PMI Flat Rate Envelope
    Then on order details form, add item 1, qty 1, id random, description random
    Then set order details service to FCMI Large Envelope/Flat
    Then click Order Details form Customs Form button
    Then add Customs Associated Item 1, description random, qty 1, Price 3000, Made In United States, Tariff 10
    Then Expect Customs Internal Transaction Number is Required
    Then add Customs Associated Item 1, description random, qty 1, Price 1, Made In United States, Tariff 10
    Then Expect Customs Internal Transaction Number is Not required
    Then add Customs Associated Item 1, description random, qty 1, Price 2501, Made In United States, Tariff 10
    Then Expect Customs Internal Transaction Number is Required
    Then set Customs ITN Number to random
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then sign out



  @rules_international_trx_no_not_required
  Scenario: Internal Transaction # Not Required
    Then add new order
    Then set Order Details Ship-From to default
    Then set order details ship-to international address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Philippines    | random  | random  |
    Then set order details ounces to 5
    Then set order details service to PMI Flat Rate Envelope
    Then set order details ounces to 5
    Then click Order Details form Customs Form button
    Then Expect Customs Internal Transaction Number is Not required
    Then set Customs Package Contents to Commercial Sample
    Then Expect Customs Internal Transaction Number is Not required
    Then set Customs Package Contents to Document
    Then Expect Customs Internal Transaction Number is Not required
    Then set Customs Package Contents to Merchandise
    Then Expect Customs Internal Transaction Number is Not required
    Then set Customs Package Contents to Gift
    Then Expect Customs Internal Transaction Number is Not required
    Then set Customs Package Contents to Humanitarian Donation
    Then Expect Customs Internal Transaction Number is Not required
    Then set Customs Package Contents to Returned Goods
    Then Expect Customs Internal Transaction Number is Not required
    Then set Customs Package Contents to Other
    Then Expect Customs Internal Transaction Number is Not required
    Then Expect Customs Internal Transaction Number is Not required
    Then set Customs ITN Number to random
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then sign out


  @rules_international_name_stuff
  Scenario: Two character minimum for Name & Company
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Domestic Ship-To Country to Antigua & Barbuda
    Then set Order Details International Ship-To Name to "a"
    Then expect Order Details International Name data error tooltip is "A first and last name of at least two characters each is required"


    Then set Order Details Ship-From to default
    Then set Order Details International Ship-To Name to "abc def"
    Then expect Order Details International Name data error tooltip is ""
    #Then expect Order Details International Company data error tooltip is ""
    #Then set Order Details International Ship-To Name to ""
    #Then set Order Details International Ship-To Company to "a"
    #Then expect Order Details International Company data error tooltip is "Company name must be at least two characters long"
    #Then set Order Details International Ship-To Name to "a"
    #Then set Order Details International Ship-To Company to ""
    #Then expect Order Details International Name data error tooltip is "A First Name and Last Name or Company are required"
    #Then expect Order Details International Company data error tooltip is "A First Name and Last Name or Company are required"
