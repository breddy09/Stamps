Feature: January 2017 Rates for Core User in Zone 9

  Background:
    Given Login and add order domestic

  @rates_orders_zone_8
  Scenario: FCM Package
    Then set Order Details form Ship-To to random address in zone 8
    Then set Order Details form service to FCM Large Envelope
    Then set Order Details form Weight to 0 lb 13 oz
    Then expect Order Details form Service Cost is 3.50
    Then expect Order Details form Total Ship Cost is 3.50
    Then Sign out

  @rates_orders_zone_8
  Scenario: First-Class Mail Package/Thick Envelope
    Then set Order Details form Ship-To to random address in zone 8
    Then set Order Details form service to First-Class Mail Package/Thick Envelope
    Then set Order Details form Weight to 0 lb 10 oz
    Then expect Order Details form Service Cost is 3.46
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 3.46
    Then Sign out

  @rates_orders_zone_8
  Scenario: Priority Mail Large/Thick Envelope
    Then set Order Details form Ship-To to random address in zone 8
    Then set Order Details form service to PM Large/Thick Envelope
    Then set Order Details form Weight to 26 lb 0 oz
    Then expect Order Details form Service Cost is 65.40
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 65.40
    Then Sign out

  @rates_orders_zone_8
  Scenario: Priority Mail Package
    Then set Order Details form Ship-To to random address in zone 8
    Then set Order Details form service to PM Package
    Then set Order Details form Weight to 18 lb 0 oz
    Then set Order Details form Length to 8
    Then set Order Details form Width to 16
    Then set Order Details form Height to 9
    Then expect Order Details form Service Cost is 53.88
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 53.88
    Then Sign out

  @rates_orders_zone_8
  Scenario: Priority Mail Large Package
    Then set Order Details form Ship-To to random address in zone 8
    Then set Order Details form service to PM Large Package
    Then set Order Details form Weight to 32 lb 0 oz
    Then set Order Details form Tracking to USPS Tracking
    Then set Order Details form Length to 30
    Then set Order Details form Width to 15
    Then set Order Details form Height to 15
    Then expect Order Details form Service Cost is 76.91
    Then expect Order Details form Total Ship Cost is 76.91
    Then Sign out

  @rates_orders_zone_8
  Scenario: Priority Mail Flat Rate Envelope
    Then set Order Details form Ship-To to random address in zone 8
    Then set Order Details form service to PM Flat Rate Envelope
    Then set Order Details form Weight to 53 lb 3 oz
    Then expect Order Details form Service Cost is 5.95
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 5.95
    Then Sign out

  @rates_orders_zone_8
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then set Order Details form Ship-To to random address in zone 8
    Then set Order Details form service to PM Padded Flat Rate Envelope
    Then set Order Details form Weight to 25 lb 0 oz
    Then expect Order Details form Service Cost is 6.50
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.50
    Then Sign out

  @rates_orders_zone_8
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then set Order Details form Ship-To to random address in zone 8
    Then set Order Details form service to PM Legal Flat Rate Envelope
    Then set Order Details form Weight to 37 lb 0 oz
    Then expect Order Details form Service Cost is 6.25
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.25
    Then Sign out

  @rates_orders_zone_8
  Scenario: Priority Mail Small Flat Rate Box
    Then set Order Details form Ship-To to random address in zone 8
    Then set Order Details form service to PM Small Flat Rate Box
    Then set Order Details form Weight to 61 lb 0 oz
    Then expect Order Details form Service Cost is 6.45
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.45
    Then Sign out

  @rates_orders_zone_8
  Scenario: Priority Mail Medium Flat Rate Box
    Then set Order Details form Ship-To to random address in zone 8
    Then set Order Details form service to PM Medium Flat Rate Box
    Then set Order Details form Weight to 40 lb 0 oz
    Then expect Order Details form Service Cost is 12.40
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 12.40
    Then Sign out

  @rates_orders_zone_8
  Scenario: Priority Mail Large Flat Rate Box
    Then set Order Details form Ship-To to random address in zone 8
    Then set Order Details form service to PM Large Flat Rate Box
    Then set Order Details form Weight to 35 lb 0 oz
    Then expect Order Details form Service Cost is 17.05
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 17.05
    Then Sign out

  @local_rating8
  Scenario: Priority Mail Regional Rate Box A
    Then set Order Details form Ship-To to random address in zone 8
    Then set Order Details form service to PM Regional Rate Box A
    Then set Order Details form Weight to 5 lb 0 oz
    Then expect Order Details form Service Cost is 10.28
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 10.28
    Then Sign out

  @local_rating8
  Scenario: Priority Mail Regional Rate Box B
    Then set Order Details form Ship-To to random address in zone 8
    Then set Order Details form service to PM Regional Rate Box B
    Then set Order Details form Weight to 2 lb 0 oz
    Then expect Order Details form Service Cost is 20.41
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 20.41
    Then Sign out

  @rates_orders_zone_8
  Scenario: PME Package
    Then set Order Details form Ship-To to random address in zone 8
    Then set Order Details form service to PME Package
    Then set Order Details form Weight to 56 lb 0 oz
    Then expect Order Details form Service Cost is 276.79
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 276.79
    Then Sign out

  @rates_orders_zone_8
  Scenario: PME Flat Rate Envelope
    Then set Order Details form Ship-To to random address in zone 8
    Then set Order Details form service to PME Flat Rate Envelope
    Then set Order Details form Weight to 4 lb 0 oz
    Then expect Order Details form Service Cost is 21.18
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 21.18
    Then Sign out

  @rates_orders_zone_8
  Scenario: PME Padded Flat Rate Envelope
    Then set Order Details form Ship-To to random address in zone 8
    Then set Order Details form service to PME Padded Flat Rate Envelope
    Then set Order Details form Weight to 21 lb 0 oz
    Then expect Order Details form Service Cost is 21.64
    Then set Order Details form Tracking to Signature Required
    Then expect Order Details form Total Ship Cost is 21.64
    Then Sign out

  @rates_orders_zone_8
  Scenario: PME Legal Flat Rate Envelope
    Then set Order Details form Ship-To to random address in zone 8
    Then set Order Details form service to PME Legal Flat Rate Envelope
    Then set Order Details form Weight to 70 lb 0 oz
    Then expect Order Details form Service Cost is 21.28
    Then set Order Details form Tracking to Signature Required
    Then expect Order Details form Total Ship Cost is 21.28
    Then Sign out

  @rates_orders_zone_8
  Scenario: MM Package
    Then set Order Details form Ship-To to random address in zone 8
    Then set Order Details form service to MM Package
    Then set Order Details form Weight to 39 lb 0 oz
    Then expect Order Details form Service Cost is 20.93
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 20.93
    Then Sign out

  @rates_orders_zone_8
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then set Order Details form Ship-To to random address in zone 8
    Then set Order Details form service to PSG Package
    Then set Order Details form Weight to 12 lb 0 oz
    Then expect Order Details form Service Cost is 41.35
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 41.35
    Then Sign out

  @rates_orders_zone_8
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then set Order Details form Ship-To to random address in zone 8
    Then set Order Details form service to PSG Large Package
    Then set Order Details form Weight to 24 lb 0 oz
    Then expect Order Details form Service Cost is 62.29
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 62.29
    Then Sign out

  @rates_orders_zone_8
  Scenario: Parcel Select Ground Oversized Package
    Then set Order Details form Ship-To to random address in zone 8
    Then set Order Details form service to PSG Oversized Package
    Then set Order Details form Weight to 7 lb 0 oz
    Then expect Order Details form Service Cost is 173.87
    Then set Order Details form Tracking to Signature Required
    Then expect Order Details form Total Ship Cost is 176.32
    Then Sign out
