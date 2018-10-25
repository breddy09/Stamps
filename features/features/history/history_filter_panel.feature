Feature:  History Filter Panel

  Background:
    Given Start test driver

  @history_filter_panel
  Scenario: History Filter Panel functions
    Then sign-in to orders
    Then navigate to History
    Then expand date printed on history filter panel

    Then select today on history filter panel
    Then expect today is selected on history filter panel
    Then expect today count on history filter panel is greater than 0

    Then select past 7 days on history filter panel
    Then expect past 7 days is selected on history filter panel
    Then expect past 7 days count on history filter panel is greater than 0

    Then select past 30 days on history filter panel
    Then expect past 30 days is selected on history filter panel
    Then expect past 30 days count on history filter panel is greater than 0

    Then select past 3 months on history filter panel
    Then expect past 3 months is selected on history filter panel
    Then expect past 3 months count on history filter panel is greater than 0

    Then select past 6 months on history filter panel
    Then expect past 6 months is selected on history filter panel
    Then expect past 6 months count on history filter panel is greater than 0

    Then select past 12 months on history filter panel
    Then expect past 12 months is selected on history filter panel
    Then expect past 12 months count on history filter panel is greater than 0

    Then select past 2 years on history filter panel
    Then expect past 2 years is selected on history filter panel
    Then expect past 2 years count on history filter panel is greater than 0

  @history_filter_direct_url
    Then sign-in to mail
    Then navigate to delivered filter on history directly
    Then expect delivered is selected on history filter panel status
    Then navigate to pending recipient action filter on history directly
    Then expect pending recipient action is selected on history filter panel status
    Then navigate to undeliverable filter on history directly
    Then expect undeliverable is selected on history filter panel status
    Then sign out

