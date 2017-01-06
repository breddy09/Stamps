Feature: January 2017 Rates for SAS User in Zone 4

  Background:
    Given I am signed in to Orders

  @rates_orders_sas_zone_4
  Scenario: First-Class Mail Large Envelope/Flat
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service First-Class Mail Large Envelope/Flat
    Then Details: Set Weight to 0 lb 1 oz
    Then Details: Expect Service Cost is $0.98
    Then Details: Expect Total Ship Cost is $0.98


  @rates_orders_sas_zone_4
  Scenario: First-Class Mail Package/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service First-Class Mail Package/Thick Envelope
    Then Details: Set Weight to 0 lb 5 oz
    Then Details: Expect Service Cost is $2.77
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $2.77


  @rates_orders_sas_zone_4
  Scenario: Priority Mail Large/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service PM Large/Thick Envelope
    Then Details: Set Weight to 2 lb 8 oz
    Then Details: Expect Service Cost is $7.86
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $7.86


  @rates_orders_sas_zone_4
  Scenario: Priority Mail Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service PM Package
    Then Details: Set Weight to 13 lb 0 oz
    Then Details: Expect Service Cost is $15.11
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $15.11


  @rates_orders_sas_zone_4
  Scenario: Priority Mail Large Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service PM Large Package
    Then Details: Set Weight to 32 lb 0 oz
    Then Details: Expect Service Cost is $34.64
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $34.64


  @rates_orders_sas_zone_4
  Scenario: Priority Mail Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service PM Flat Rate Envelope
    Then Details: Set Weight to 2 lb 3 oz
    Then Details: Expect Service Cost is $5.95
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $5.95


  @rates_orders_sas_zone_4
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service PM Padded Flat Rate Envelope
    Then Details: Set Weight to 12 lb 0 oz
    Then Details: Expect Service Cost is $6.50
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.50


  @rates_orders_sas_zone_4
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service PM Legal Flat Rate Envelope
    Then Details: Set Weight to 5 lb 0 oz
    Then Details: Expect Service Cost is $6.25
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.25


  @rates_orders_sas_zone_4
  Scenario: Priority Mail Small Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service PM Small Flat Rate Box
    Then Details: Set Weight to 23 lb 0 oz
    Then Details: Expect Service Cost is $6.45
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.45


  @rates_orders_sas_zone_4
  Scenario: Priority Mail Medium Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service PM Medium Flat Rate Box
    Then Details: Set Weight to 14 lb 0 oz
    Then Details: Expect Service Cost is $12.40
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $12.40


  @rates_orders_sas_zone_4
  Scenario: Priority Mail Large Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service PM Large Flat Rate Box
    Then Details: Set Weight to 3 lb 0 oz
    Then Details: Expect Service Cost is $17.05
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $17.05


  @rates_orders_sas_zone_4
  Scenario: Priority Mail Regional Rate Box A
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service PM Regional Rate Box A
    Then Details: Set Weight to 7 lb 0 oz
    Then Details: Expect Service Cost is $6.83
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.83


  @rates_orders_sas_zone_4
  Scenario: Priority Mail Regional Rate Box B
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service PM Regional Rate Box B
    Then Details: Set Weight to 18 lb 0 oz
    Then Details: Expect Service Cost is $9.19
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $9.19


  @rates_orders_sas_zone_4
  Scenario: Priority Mail Express Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service PME Package
    Then Details: Set Weight to 26 lb 0 oz
    Then Details: Expect Service Cost is $111.35
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $111.35


  @rates_orders_sas_zone_4
  Scenario: Priority Mail Express Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service PME Flat Rate Envelope
    Then Details: Set Weight to 1 lb 0 oz
    Then Details: Expect Service Cost is $21.18
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $21.18


  @rates_orders_sas_zone_4
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service PME Padded Flat Rate Envelope
    Then Details: Set Weight to 15 lb 0 oz
    Then Details: Expect Service Cost is $21.64
    Then Details: Set Tracking to Signature Required
    Then Details: Expect Total Ship Cost is $21.64


  @rates_orders_sas_zone_4
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service PME Legal Flat Rate Envelope
    Then Details: Set Weight to 6 lb 0 oz
    Then Details: Expect Service Cost is $21.28
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $21.28


  @rates_orders_sas_zone_4
  Scenario: Media Mail Package/Flat/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service Media Mail Package/Flat/Thick Envelope
    Then Details: Set Weight to 30 lb 0 oz
    Then Details: Expect Service Cost is $16.61
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $16.61


  @rates_orders_sas_zone_4
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Weight to 45 lb 0 oz
    Then Details: Expect Service Cost is $41.49
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $41.49


  @rates_orders_sas_zone_4
  Scenario: Parcel Select Ground Large Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service Parcel Select Ground Large Package
    Then Details: Set Weight to 21 lb 0 oz
    Then Details: Expect Service Cost is $20.35
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $20.35


  @rates_orders_sas_zone_4
  Scenario: Parcel Select Ground Oversized Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service Parcel Select Ground Oversized Package
    Then Details: Set Weight to 13 lb 0 oz
    Then Details: Expect Service Cost is $86.89
    Then Details: Set Tracking to Signature Required
    Then Details: Expect Total Ship Cost is $89.34

    Then Sign out

