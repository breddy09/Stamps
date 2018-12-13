Feature:  History Filter Panel

  Background:
    Given Start test driver
    Then sign-in to mail
    Then navigate to History
    Then expect date printed on history filter panel is expanded
    Then expect default selected value on date printed history filter panel is Past 30 Days
    Then click on advanced search arrow on history filter panel
    Then expect advance search modal is displayed
    Then expect date delivered radio button in advance search modal is present
    Then select date delivered radio button in advance search modal
    Then expect date range drop down in advance search modal is present

  @advanced_search_date_delivered_date_ranges
  Scenario: History: Verify Date Selections generates search range of prints with date delivered of 'Today'
    Then set date range drop down value to Today
    Then click search button on advance search modal
    Then expect advance search modal is not displayed
    Then expect search results is available on the history filter panel
    Then expect date printed on history filter panel is collapsed
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
    Then expect prints within date range Today for column Date delivered are retrieved in the grid

   @advanced_search_date_delivered_date_ranges
  Scenario: History: Verify Date Selections generates search range of prints with date delivered of 'past 7 Days'
     Then set date range drop down value to Past 7 Days
     Then click search button on advance search modal
     Then expect advance search modal is not displayed
     Then expect search results is available on the history filter panel
     Then expect date printed on history filter panel is collapsed
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

  @advanced_search_date_delivered_date_ranges
  Scenario: History: Verify Date Selections generates search range of prints with date delivered of 'past 30 Days'
    Then set date range drop down value to Past 30 Days
    Then click search button on advance search modal
    Then expect advance search modal is not displayed
    Then expect search results is available on the history filter panel
    Then expect date printed on history filter panel is collapsed
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
    Then expect prints within date range Past 30 Days for column Date delivered are retrieved in the grid

  @advanced_search_date_delivered_date_ranges
  Scenario: History: Verify Date Selections generates search range of prints with date delivered of 'past 3 Months'
    Then set date range drop down value to Past 3 Months
    Then click search button on advance search modal
    Then expect advance search modal is not displayed
    Then expect search results is available on the history filter panel
    Then expect date printed on history filter panel is collapsed
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
    Then expect prints within date range Past 3 Months for column Date delivered are retrieved in the grid

  @advanced_search_date_delivered_date_ranges
  Scenario: History: Verify Date Selections generates search range of prints with date delivered of 'past 6 Months'
    Then set date range drop down value to Past 6 Months
    Then click search button on advance search modal
    Then expect advance search modal is not displayed
    Then expect search results is available on the history filter panel
    Then expect date printed on history filter panel is collapsed
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
    Then expect prints within date range Past 6 Months for column Date delivered are retrieved in the grid

  @advanced_search_date_delivered_date_ranges
  Scenario: History: Verify Date Selections generates search range of prints with date delivered of 'past 12 Months'
    Then set date range drop down value to Past 12 Months
    Then click search button on advance search modal
    Then expect advance search modal is not displayed
    Then expect search results is available on the history filter panel
    Then expect date printed on history filter panel is collapsed
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
    Then expect prints within date range Past 12 Months for column Date delivered are retrieved in the grid

  @advanced_search_date_delivered_date_ranges
  Scenario: History: Verify Date Selections generates search range of prints with date delivered of 'past 2 Years'
    Then set date range drop down value to Past 2 Years
    Then click search button on advance search modal
    Then expect advance search modal is not displayed
    Then expect search results is available on the history filter panel
    Then expect date printed on history filter panel is collapsed
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
    Then expect prints within date range Past 2 Years for column Date delivered are retrieved in the grid

  @advanced_search_date_delivered_date_ranges
  Scenario: History: Verify Date Selections generates search range of prints with date delivered of 'All'
    Then set date range drop down value to All
    Then click search button on advance search modal
    Then expect advance search modal is not displayed
    Then expect search results is available on the history filter panel
    Then expect date printed on history filter panel is collapsed
    Then check row 1 on history grid

    Then sign out

