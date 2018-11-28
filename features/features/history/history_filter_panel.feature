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
  @history_filter_direct_url_1
  Scenario: Navigating to direct URLs
    Then sign-in to mail
    Then navigate to History
    Then go to delivered filter on history directly
    Then wait while loading history filters grid
    Then expect delivered is selected on history filter panel status
    Then go to pending recipient action filter on history directly
    Then wait while loading history filters grid
    Then expect pending recipient action is selected on history filter panel status
    Then go to undeliverable filter on history directly
    Then wait while loading history filters grid
    Then expect undeliverable is selected on history filter panel status
    Then sign out

  @history_filter_direct_urlx
  Scenario: Not signed in user navigates to direct URLs
    Then go to delivered filter on history directly
    Then login to webclient
    Then wait while loading history filters grid
    Then expect delivered is selected on history filter panel status
    Then sign out
    Then go to pending recipient action filter on history directly
    Then login to webclient
    Then wait while loading history filters grid
    Then expect pending recipient action is selected on history filter panel status
    Then sign out
    Then go to undeliverable filter on history directly
    Then login to webclient
    Then wait while loading history filters grid
    Then expect undeliverable is selected on history filter panel status
    Then sign out

  @search_prints_different_date_ranges
  Scenario: History: Verify Date Selections generates search range of prints
    Then sign-in to mail
    Then navigate to History
    Then expect date printed on history filter panel is expanded
    Then expect default selected value on date printed history filter panel is Past 30 Days

          #Past 7 days , Date Printed
    Then click on advanced search arrow on history filter panel
    Then expect advance search modal is displayed
    Then expect date printed radio button in advance search modal is present
    Then select date printed radio button in advance search modal
    Then expect date range drop down in advance search modal is present
    Then set date range drop down value to Past 7 Days
    Then click search button on advance search modal
    Then expect advance search modal is not displayed
    Then expect search results is available on the history filter panel
    Then expect date printed on history filter panel is collapsed


    Then hover on history grid column date printed
    Then click on header dropdown trigger of column date printed
    Then click on Sort Ascending in the date printed column header dropdown menu list
    Then save first date range value on grid for column date printed
    Then hover on history grid column date printed
    Then click on header dropdown trigger of column date printed
    Then click on Sort Descending in the date printed column header dropdown menu list
    Then save last date range value on grid for column date printed
    Then expect prints within date range Past 7 Days for column Date Printed are retrieved in the grid

    #Past 30 days , Date Printed
    Then click on advanced search arrow on history filter panel
    Then expect advance search modal is displayed
    Then expect date range drop down in advance search modal is present
    Then set date range drop down value to Past 30 Days
    Then click search button on advance search modal
    Then expect advance search modal is not displayed
    Then expect search results is available on the history filter panel
    Then expect date printed on history filter panel is collapsed

    Then hover on history grid column date printed
    Then click on header dropdown trigger of column date printed
    Then expect Sort Ascending is available in the date printed column header dropdown menu list
    Then click on Sort Ascending in the date printed column header dropdown menu list
    Then save first date range value on grid for column date printed
    Then hover on history grid column date printed
    Then click on header dropdown trigger of column date printed
    Then expect Sort Descending is available in the date printed column header dropdown menu list
    Then click on Sort Descending in the date printed column header dropdown menu list
    Then save last date range value on grid for column date printed
    Then expect prints within date range Past 30 Days for column Date Printed are retrieved in the grid

    #Past 6 Months , Date Delivered
    Then click on advanced search arrow on history filter panel
    Then expect advance search modal is displayed
    Then expect date delivered radio button in advance search modal is present
    Then select date delivered radio button in advance search modal
    Then expect date range drop down in advance search modal is present
    Then set date range drop down value to Past 6 Months
    Then click search button on advance search modal
    Then expect advance search modal is not displayed
    Then expect search results is available on the history filter panel
    Then expect date printed on history filter panel is collapsed
#    Then expect prints are displayed within given date range
    Then hover on history grid column date delivered
    Then click on header dropdown trigger of column date delivered
    Then expect Sort Ascending is available in the date delivered column header dropdown menu list
    Then click on Sort Ascending in the date delivered column header dropdown menu list
    Then save first date range value on grid for column date delivered
    Then hover on history grid column date delivered
    Then click on header dropdown trigger of column date delivered
    Then expect Sort Descending is available in the date delivered column header dropdown menu list
    Then click on Sort Descending in the date delivered column header dropdown menu list
    Then save last date range value on grid for column date delivered
    Then expect prints within date range Past 7 Days for column Date delivered are retrieved in the grid

          #Past 12 Months , Date Delivered
    Then click on advanced search arrow on history filter panel
    Then expect advance search modal is displayed
    Then expect ship date radio button in advance search modal is present
    Then select ship date radio button in advance search modal
    Then expect date range drop down in advance search modal is present
    Then set date range drop down value to Past 12 Months
    Then click search button on advance search modal
    Then expect advance search modal is not displayed
    Then expect search results is available on the history filter panel
    Then expect date printed on history filter panel is collapsed

    Then hover on history grid column ship date
    Then click on header dropdown trigger of column ship date
    Then expect Sort Ascending is available in the ship date column header dropdown menu list
    Then click on Sort Ascending in the ship date column header dropdown menu list
    Then save first date range value on grid for column ship date
    Then hover on history grid column ship date
    Then click on header dropdown trigger of column ship date
    Then expect Sort Descending is available in the ship date column header dropdown menu list
    Then click on Sort Descending in the ship date column header dropdown menu list
    Then save last date range value on grid for column ship date
    Then expect prints within date range Past 12 Months for column ship date are retrieved in the grid

        #Past 2 Years ship date
    Then click on advanced search arrow on history filter panel
    Then expect advance search modal is displayed
    Then expect ship date radio button in advance search modal is present
    Then select ship date radio button in advance search modal
    Then expect date range drop down in advance search modal is present
    Then set date range drop down value to Past 2 Years
    Then click search button on advance search modal
    Then expect advance search modal is not displayed
    Then expect search results is available on the history filter panel
    Then expect date printed on history filter panel is collapsed
    Then hover on history grid column ship date
    Then click on header dropdown trigger of column ship date
    Then expect Sort Ascending is available in the ship date column header dropdown menu list
    Then click on Sort Ascending in the ship date column header dropdown menu list
    Then save first date range value on grid for column ship date
    Then hover on history grid column ship date
    Then click on header dropdown trigger of column ship date
    Then expect Sort Descending is available in the ship date column header dropdown menu list
    Then click on Sort Descending in the ship date column header dropdown menu list
    Then save last date range value on grid for column ship date
    Then expect prints within date range Past 2 Years for column ship date are retrieved in the grid
