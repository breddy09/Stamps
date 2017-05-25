Feature: Mail Shipping Label - Left Side

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_label_left_side
  Scenario: Left Side Shipping Label -  SDC-1200

    Then select Print On Shipping Label - SDC-1200 Paper
    Then set Print form Mail-From to default
    Then set Print form international mail to country to United States
    Then set Print form Mail-To random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service Priority Mail Package
    Then select Print form service PM Package
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out