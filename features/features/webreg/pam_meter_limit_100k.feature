Feature: Registration
  Background:
    Given I launched default browser

  @pam_meter_limit_100k
  Scenario:
    Then load PAM Page
    Then Visit PAM Customer Search page
    Then load username and password from parameter file registration_meter_limit_100k
    Then set PAM Customer Search page username from parameter file
    Then set PAM Customer Search page 5.2 or lower
    Then click PAM Customer Search page Search button

    Then On PAM Customer Profile page, click Change Meter Limit link
    Then On PAM Change Meter Limit page, set New Meter Limit to $100000
    Then On PAM Change Meter Limit page, set USPS approval to Checked
    Then On PAM Change Meter Limit page, click Submit

    Then On PAM Customer Profile page, click  AppCap Overrides link
    Then On PAM AppCap Overrides page, set Internet Mail Printing to Always On
    Then On PAM AppCap Overrides page, set Netstamps Printing to Always On
    Then On PAM AppCap Overrides page, set Shipping Label Printing to Always On
    Then On PAM AppCap Overrides page, set International Shipping to Always On
    Then On PAM AppCap Overrides page, set Allow High Risk Countries to Always On
    Then On PAM AppCap Overrides page, Submit
    Then save username to parameter file pam_meter_limit_100k
    Then save password to parameter file pam_meter_limit_100k
    Then store username to data file pam_meter_limit_100k
