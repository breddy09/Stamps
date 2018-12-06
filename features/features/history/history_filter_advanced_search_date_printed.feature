Feature:  History Filter Panel

  Background:
    Given Start test driver
    Then sign-in to mail
    Then navigate to History
    Then expect date printed on history filter panel is expanded
    Then expect default selected value on date printed history filter panel is Past 30 Days
    Then click on advanced search arrow on history filter panel
    Then expect advance search modal is displayed


   @advanced_search_date_printed_date_ranges
  Scenario: History: Verify Date Selections generates search range of prints with date printed of past 7 Days
    #Past 7 days , Date Printed
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

  @advanced_search_date_printed_date_ranges
  Scenario: History: Verify Date Selections generates search range of prints with date printed of past 30 Days
    Then expect date printed radio button in advance search modal is present
    Then select date printed radio button in advance search modal
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

  @advanced_search_date_printed_date_ranges
  Scenario: History: Verify Date Selections generates search range of prints with date printed of past 6 Months
    Then expect date printed radio button in advance search modal is present
    Then select date printed radio button in advance search modal
    Then expect date range drop down in advance search modal is present
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
    Then expect date printed radio button in advance search modal is present
    Then select date printed radio button in advance search modal
    Then expect date range drop down in advance search modal is present
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
    Then expect date printed radio button in advance search modal is present
    Then select date printed radio button in advance search modal
    Then expect date range drop down in advance search modal is present
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

  @advanced_search_date_custom_dates
  Scenario: History: Verify Date Selections via FROM and TO  fields on advanced search - To date set to today and FROM date is generated by default
    Then expect date printed radio button in advance search modal is present
    Then select date printed radio button in advance search modal
    Then expect date range drop down in advance search modal is present
    Then expect from date field in advance search modal is present
    Then expect to date field in advance search modal is present
    Then set advanced search modal from date field to different date - Random
    Then save advanced search modal to date field value
    Then expect date range field value changed to custom
    Then click search button on advance search modal
    Then hover on history grid column date delivered
    Then click on header dropdown trigger of column date delivered
    Then expect Sort Ascending is available in the date delivered column header dropdown menu list
    Then click on Sort Ascending in the date delivered column header dropdown menu list
    Then save first date value on grid for column date delivered
    Then hover on history grid column date printed
    Then click on header dropdown trigger of column date printed
    Then expect Sort Descending is available in the date delivered column header dropdown menu list
    Then click on Sort Descending in the date delivered column header dropdown menu list
    Then save last date value on grid for column date printed
    Then expect prints displayed are within given from and default to date range


  @advanced_search_date_custom_dates
  Scenario: History: Verify Date Selections via FROM and TO  fields on advanced search - Both From date and To date are different than system generated date
    Then click on advanced search arrow on history filter panel
    Then expect advance search modal is displayed
    Then expect ship date radio button in advance search modal is present
    Then select ship date radio button in advance search modal
    Then expect from date field in advance search modal is present
    Then expect to date field in advance search modal is present
    Then set advanced search modal to date field to different date
    Then set advanced search modal from date field to different date
    Then expect custom date range field value changed to custom
    Then click search button on advance search modal
    Then hover on history grid column ship date
    Then click on header dropdown trigger of column date printed
    Then expect Sort Ascending is available in the ship date column header dropdown menu list
    Then click on Sort Ascending in the ship date column header dropdown menu list
    Then save first date value on grid for column ship date
    Then hover on history grid column date printed
    Then click on header dropdown trigger of column date printed
    Then expect Sort Descending is available in the ship date column header dropdown menu list
    Then click on Sort Descending in the ship date column header dropdown menu list
    Then save last date value on grid for column ship date
    Then expect prints displayed are within given from and default to date range



