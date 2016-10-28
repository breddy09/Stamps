Feature: Local Rating test for zone 7

  Background:
    Given I am signed in to Orders

  @local_rating
  @local_rating7
  Scenario:  All Services
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 7
    Then Details: Select Service First-Class Mail Large Envelope/Flat
    Then Details: Set Weight to 0 lbs 11 oz
    Then Details: Expect Total Ship Cost is $3.18

    Then Details: Set Ship-To to address in Zone 7
    Then Details: Select Service First-Class Mail Package/Thick Envelope
    Then Details: Set Weight to 0 lbs 8 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $2.60

    Then Details: Set Ship-To to address in Zone 7
    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Set Weight to 33 lbs 1 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $64.26

    Then Details: Set Ship-To to address in Zone 7
    Then Details: Select Service Priority Mail Package
    Then Details: Set Weight to 10 lbs 1 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Expect Total Ship Cost is $31.92

    Then Details: Set Ship-To to address in Zone 7
    Then Details: Select Service Priority Mail Large Package
    Then Details: Set Weight to 41 lbs 1 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Set Length to 7
    Then Details: Set Width to 25
    Then Details: Set Height to 25
    Then Details: Expect Total Ship Cost is $73.93

    Then Details: Set Ship-To to address in Zone 7
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Set Weight to 31 lbs 1 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $5.75

    Then Details: Set Ship-To to address in Zone 7
    Then Details: Select Service Priority Mail Padded Flat Rate Envelope
    Then Details: Set Weight to 22 lbs 1 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.10

    Then Details: Set Ship-To to address in Zone 7
    Then Details: Select Service Priority Mail Legal Flat Rate Envelope
    Then Details: Set Weight to 32 lbs 1 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $5.75

    Then Details: Set Ship-To to address in Zone 7
    Then Details: Select Service Priority Mail Small Flat Rate Box
    Then Details: Set Weight to 54 lbs 1 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.10

    Then Details: Set Ship-To to address in Zone 7
    Then Details: Select Service Priority Mail Medium Flat Rate Box
    Then Details: Set Weight to 45 lbs 1 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $11.95

    Then Details: Set Ship-To to address in Zone 7
    Then Details: Select Service Priority Mail Large Flat Rate Box
    Then Details: Set Weight to 30 lbs 1 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $16.35

    Then Details: Set Ship-To to address in Zone 7
    Then Details: Select Service Priority Mail Express Package
    Then Details: Set Weight to 22 lbs 1 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $122.31

    Then Details: Set Ship-To to address in Zone 7
    Then Details: Select Service Priority Mail Express Flat Rate Envelope
    Then Details: Set Weight to 18 lbs 1 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $20.66

    Then Details: Set Ship-To to address in Zone 7
    Then Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    Then Details: Set Weight to 56 lbs 1 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $20.66

    Then Details: Set Ship-To to address in Zone 7
    Then Details: Select Service Priority Mail Express Legal Flat Rate Envelope
    Then Details: Set Weight to 39 lbs 15 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $20.66

    Then Details: Set Ship-To to address in Zone 7
    Then Details: Select Service Media Mail Package/Flat/Thick Envelope
    Then Details: Set Weight to 65 lbs 15 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $35.22

    Then Details: Set Ship-To to address in Zone 7
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Weight to 37 lbs 15 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $68.02

    Then Details: Set Ship-To to address in Zone 7
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Weight to 58 lbs 15 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $91.52

    Then Details: Set Ship-To to address in Zone 7
    Then Details: Select Service Parcel Select Ground Oversized Package
    Then Details: Set Weight to 47 lbs 15 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $141.62

    Then Sign out