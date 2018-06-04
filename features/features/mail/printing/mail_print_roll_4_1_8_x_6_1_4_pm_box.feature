
Feature: Mail Roll - 4 ⅛” x 6 ¼” - PM Box

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_roll_4_1_8_x_6_1_4_pm_box
  Scenario: Print On: Roll - 4 ⅛” x 6 ¼” - PM Box

   #mail_print_roll_4_1_8_x_6_1_4_pm_small_box
    Then select print on Roll 418x614
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PM Small Flat Rate Box
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_pm_medium_box
    Then select print on Roll 418x614
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Medium Flat Rate Box
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_pm_large_box
    Then select print on Roll 418x614
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Large Flat Rate Box
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

  @mail_print_roll_4_1_8_x_6_1_4_pm_regional_box
  Scenario: Print On: Roll - 4 ⅛” x 6 ¼” - PM Regional Box

   #mail_print_roll_4_1_8_x_6_1_4_pm_regional_box_a
    Then select print on Roll 418x614
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PM Regional Rate Box A
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_pm_regional_box_b
    Then select print on Roll 418x614
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PM Regional Rate Box B
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

    Then sign out