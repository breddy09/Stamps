Feature: in Print modal, click Print button Sample - Priority Mail Regional Rate Box A

  Background:
    Given a valid user is signed in to Web Apps

  @print_sample_pm_regional_rate_box_a
  Scenario:  Priority Mail Regional Rate Box A
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PM Regional Rate Box A
    Then set Order Details form Ounces to 1
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Print modal Printer to "factory"
    Then in Print modal, click Print button Sample
    Then Sign out
