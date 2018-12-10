Feature:  Mail BVT - Extra Services

  Background:
    Given Start test driver
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-to to a random address in zone 8
    Then set print form email tracking stamps@mailinator.com
    Then select print form service PM Package
    Then set print form weight to lbs 1 oz 1
    Then increment print form dimensions by length 2 width 2 height 2
    Then decrement print form dimensions by length 2 width 2 height 2
    Then set print form dimensions to length 2 width 2 height 2
    Then set print form tracking Signature Required
    Then set print form tracking USPS Tracking
    Then set print form insure for to $100
    Then set print form insure for to $0
    Then click select extra services button on print form

  @mail_bvt_extra_services
  Scenario: BVT Mail UI Validation - Extra Services Registered mail
    Then set extra services security to Registered Mail
    Then increment extra services security value by 2
    Then decrement extra services security value by 2
    Then set extra services security value to 3
    Then set extra services security value to 0
    Then check return receipt on extra services modal
    Then uncheck return receipt on extra services modal
   Then check restricted delivery on extra services modal
    Then uncheck restricted delivery on extra services modal
    Then blur out on extra services form
    Then increment extra services cod by 2
    Then decrement extra services cod by 2
    Then blur out on extra services form
    Then check hold for pickup on extra services modal
    Then uncheck hold for pickup on extra services modal
    Then check non-rectangular on extra services modal
    Then uncheck non-rectangular on extra services modal
   Then blur out on extra services form
    Then set extra services cod to 3
    Then blur out on extra services form
    Then set extra services handling to Hazardous Materials
    Then click special contents warning modal i agree
    Then set extra services handling to Live Animal
    Then click special contents warning modal i agree
    Then set extra services handling to Live Animal (with Fee)
    Then click special contents warning modal i agree
    Then set extra services handling to Normal
    Then close extra services

  @mail_bvt_extra_services
  Scenario: BVT Mail UI Validation - Extra Services - USPS Insurance
    Then set extra services security to USPS Insurance
    Then blur out on extra services form
    Then increment extra services cod by 2
    Then click continue button on value must be shown modal
    Then decrement extra services cod by 2
    Then blur out on extra services form
    Then check fragile on extra services modal
    Then uncheck fragile on extra services modal
    Then check return receipt for merchandise on extra services modal
    Then click extra services form 3811
    Then close form 3811 modal
    Then check hold for pickup on extra services modal
    Then uncheck hold for pickup on extra services modal
    Then check non-rectangular on extra services modal
    Then uncheck non-rectangular on extra services modal
    Then blur out on extra services form
    Then set extra services handling to Hazardous Materials
    Then click special contents warning modal i agree
    Then set extra services handling to Live Animal
    Then click special contents warning modal i agree
    Then set extra services handling to Live Animal (with Fee)
    Then click special contents warning modal i agree
    Then set extra services handling to Normal
    Then close extra services


  @mail_bvt_extra_services
  Scenario: BVT Mail UI Validation - Advanced Options validation
    Then close extra services
    Then check advanced options hide label value
    Then uncheck advanced options hide label value
    Then check advanced options print receipt
    Then uncheck advanced options print receipt
    Then check advanced options print reference #
    Then uncheck advanced options print reference #
    Then sign out
