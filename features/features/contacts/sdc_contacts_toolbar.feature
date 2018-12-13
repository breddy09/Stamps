Feature:  Contacts BVT - Contacts ToolBar

  Background:
    Given Start test driver

  @sdc_contact_add_new_contact
  Scenario: Contacts BVT Scenario 1 : Click add, add new contact  and the open and view details
    Then sign-in to orders
    Then navigate to Contacts
    Then delete all present contacts with the value AddNewContact
    Then expect count of contact search results is 0
    Then click remove button on search results of contacts filter
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name | company | country| street_address | city | state | postal_code | phone  |  email | groups | reference_number|cost_code |
      |AddNewContact |random   |United States|random     |San Juan|Federated States Of Micronesia|0097-5824|random|random  |random   |random |random     |
    Then in contacts grid uncheck row 1
    Then search contacts from contacts filter panel with name AddNewContact
    Then in contacts grid check row 1
    Then expect contacts grid name column at row 1 is correct
    Then expect contacts grid company column at row 1 is correct
    Then expect contacts grid country column at row 1 is correct
    Then expect contacts grid street address column at row 1 is correct
    Then expect contacts grid city column at row 1 is correct
    Then expect contacts grid state column at row 1 is correct
    Then expect contacts grid postal code column at row 1 is correct
    Then expect contacts grid phone column at row 1 is correct
    Then expect contacts grid email column at row 1 is correct
    Then expect contacts grid reference no column at row 1 is correct
    Then expect contacts grid cost code column at row 1 is correct
    Then expect value of name in contact details panel is correct
    Then expect value of company in contact details panel is correct
    Then expect value of country in contact details panel is correct
    Then expect value of street address in contact details panel is correct
    Then expect value of city in contact details panel is correct
    Then expect value of state in contact details panel is correct
    Then expect value of postal code in contact details panel is correct
    Then expect value of phone in contact details panel is correct
    Then expect value of email in contact details panel is correct
    Then expect value of groups in contact details panel is correct
    Then expect value of reference number in contact details panel is correct
    Then expect value of cost code in contact details panel is correct

  @sdc_contacts_delete_single_from_top_navigation
  Scenario: Delete Contact Top Nav Scenario 1 :Delete a newly added contact from top navigation
    Then sign-in to orders
    Then navigate to Contacts
    Then delete all present contacts with the value RuthAnand
    Then expect count of contact search results is 0
    Then click remove button on search results of contacts filter
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name | company | country| street_address | city | state | postal_code | phone  |  email | groups | reference_number|cost_code |
      |RuthAnand  |FL Homes|United States|223 E. Concord Street|Orlando|Florida|32801|random|random  |random   |random |random     |
    Then in contacts grid uncheck row 1
    Then search contacts from contacts filter panel with name RuthAnand
    Then expect count of contact search results is 1
    Then in contacts grid check row 1
    Then click delete button on contacts toolbar
    Then expect delete contacts modal is displayed
    Then click yes button on delete contacts modal
    Then search contacts from contacts filter panel with name RuthAnand
    Then expect count of contact search results is 0

  @sdc_contacts_delete_multiple_from_top_navigation
  Scenario: Delete Contact Top Nav Scenario 2 :Delete multiple contacts from top navigation
    Then sign-in to orders
    Then navigate to Contacts
    Then delete all present contacts with the value Jon
    Then expect count of contact search results is 0
    Then click remove button on search results of contacts filter
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name | company | country| street_address | city | state | postal_code | phone  |  email | groups | reference_number|cost_code |
      |Jon1 |FL Homes|United States|223 E. Concord Street|Orlando|Florida|32801|random|random  |random   |random |random     |
    Then in contacts grid uncheck row 1
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name | company | country| street_address | city | state | postal_code | phone  |  email | groups | reference_number|cost_code |
      |Jon2 |random|United States|223 E. Concord Street|Orlando|Florida|32801|random|random  |random   |random |random     |
    Then in contacts grid uncheck row 1
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name | company | country| street_address | city | state | postal_code | phone  |  email | groups | reference_number|cost_code |
      |Jon3 |random|United States|223 E. Concord Street|Orlando|Florida|32801|random|random  |random   |random |random     |
    Then in contacts grid uncheck row 1
    Then search contacts from contacts filter panel with name Jon
    Then expect count of contact search results is 3
    Then in contacts grid check row 1
    Then in contacts grid check row 3
    Then click delete button on contacts toolbar
    Then click yes button on delete contacts modal
    Then search contacts from contacts filter panel with name Jon
    Then expect count of contact search results is 1

  @sdc_contacts_existing_add_valid_invalid_reference_number
  Scenario: Add Reference Number from Top Nav Scenario 1 :Add Invalid, valid Reference to a contact
    Then sign-in to orders
    Then navigate to Contacts
    Then delete all present contacts with the value AddReference
    Then expect count of contact search results is 0
    Then click remove button on search results of contacts filter
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name | company | country| street_address | city | state | postal_code | phone  |  email | groups | reference_number|cost_code |
      |AddReference |random|United States|223 E. Concord Street|Orlando|Florida|32801|random|random  |random   | |random     |
    Then in contacts grid uncheck row 1
    Then search contacts from contacts filter panel with name AddReference
    Then expect count of contact search results is 1
    Then in contacts grid check row 1
    Then click change reference button on contacts toolbar
    #Empty Reference Number
    Then set reference number to blank
    Then click on change reference save button
    Then expect reference number error is displayed
    Then expect error message on add reference modal is Reference required.
    #Invalid Reference
    Then set reference number to Invalid Reference1 Reference2 Reference3
    Then expect reference number error is displayed
    Then expect error message on add reference modal is Maximum 35 characters allowed.
    Then click on change reference close button
    Then expect contacts grid reference no column at row 1 is blank
    #Valid Reference
    Then click change reference button on contacts toolbar
    Then set reference number to Reference 123456789
    Then expect reference number error is not displayed
    Then click on change reference save button
    Then expect contacts grid reference no column at row 1 is Reference 123456789

 @sdc_contacts_toolbar_settings_show_hide_all_columns
  Scenario: Contacts BVT Scenario 1 : Select columns to show/hide in the Grid
    Then sign-in to orders
    Then navigate to Contacts
    Then click on settings button of contacts toolbar
    Then select columns from contacts toolbar settings dropdown menu
    Then check all the columns from the list to show all columns in the contacts grid
    Then expect all columns are present on the contacts grid
    Then click on settings button of contacts toolbar
    Then select columns from contacts toolbar settings dropdown menu
    Then uncheck all the columns from the list to hide all columns in the contacts grid
    Then expect all columns are not present on the contacts grid
