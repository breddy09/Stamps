Feature:  History Filter Panel

  Background:
    Given Start test driver
    Then sign-in to mail
    Then navigate to History
    Then expect date printed on history filter panel is expanded
    Then expect default selected value on date printed history filter panel is Past 30 Days
    Then click on advanced search arrow on history filter panel
    Then expect advance search modal is displayed
    Then expect date printed radio button in advance search modal is present
    Then select date printed radio button in advance search modal
    Then expect date range drop down in advance search modal is present

   @advanced_search_date_printed_date_ranges
  Scenario: History: Verify Date Selections generates search range of prints with date printed of past 7 Days
    #Past 7 days , Date Printed
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

  @advanced_search_date_printed_date_ranges
  Scenario: History: Verify Date Selections generates search range of prints with date printed of past 30 Days
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

  @advanced_search_date_printed_date_ranges
  Scenario: History: Verify Date Selections generates search range of prints with date printed of past 6 Months
    Then set date range drop down value to Past 6 Months
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

  @advanced_search_date_printed_date_ranges
  Scenario: History: Verify Date Selections generates search range of prints with date printed of past 12 Months
    Then set date range drop down value to Past 12 Months
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

  @advanced_search_date_printed_date_ranges
  Scenario: History: Verify Date Selections generates search range of prints with date printed of past 2 Years
    Then set date range drop down value to Past 2 Years
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


