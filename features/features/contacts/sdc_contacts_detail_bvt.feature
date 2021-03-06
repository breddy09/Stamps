Feature:  Contacts BVT - Contacts Details

  Background:
    Given Start test driver

  @sdc_contacts_delete_single_from_details_menu
  Scenario: Delete Contact Details Menu Scenario 1:Delete single contacts from details panel
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
    Then click on contact details menu dropdown
    Then select contact details menu Delete
    Then expect delete contacts modal is displayed
    Then click yes button on delete contacts modal
    Then search contacts from contacts filter panel with name RuthAnand
    Then expect count of contact search results is 0
    Then sign out

  @sdc_contacts_delete_multiple_from_details_menu
  Scenario: Delete Contact Details Menu Scenario 2 :Delete multiple contacts from Details Panel
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
    Then click on multiple contact details menu dropdown
    Then select contact details menu Delete
    Then expect delete contacts modal is displayed
    Then click yes button on delete contacts modal
    Then search contacts from contacts filter panel with name Jon
    Then expect count of contact search results is 1
    Then sign out

  @sdc_contacts_add_valid_invalid_email
  Scenario: Contacts Add Email Scenario 1 :Add valid Email to a newly added contact via contact details modal
    Then sign-in to orders
    Then navigate to Contacts
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name | company | country       | street_address | city     | state                          | postal_code | phone        |  email | groups | reference_number|cost_code |
      | random    | random  | United States |random          | San Juan | Federated States Of Micronesia | 0097-5824   | 23345142-123 | random |random  |random           |random    |
    Then in contacts grid uncheck row 1
    Then search contacts from contacts filter panel with name newly added
    Then in contacts grid check row 1
    #invalid Email
    Then set contact details email to test.com
    Then expect email error is displayed
    #valid Email
    Then set contact details email to aloha@lydia.in
    Then expect email error is not displayed
    Then expect contacts grid email column at row 1 is aloha@lydia.in

  @sdc_contact_details_single_name
  Scenario: Contacts Details Add Name Scenario 1 :Add/Edit Single Name in Contact Details panel and verify Grid is updated correctly
    Then sign-in to orders
    Then navigate to Contacts
    Then delete all present contacts with the value  Aloha Mich
    Then expect count of contact search results is 0
    Then click remove button on search results of contacts filter
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name  | company | country       | street_address | city     | state    | postal_code | phone        |  email | groups | reference_number|cost_code |
      |CAPT P Aloha Mich Lydia Anand |random | United States | 1 Cortlandt St | New York | New York | 10007 |random | random |random | random |random |
    Then in contacts grid uncheck row 1
    Then search contacts from contacts filter panel with name Aloha Mich
    Then expect count of contact search results is 1
    Then expect contacts grid prefix column at row 1 is correct
    Then expect contacts grid first name column at row 1 is correct
    Then expect contacts grid middle name column at row 1 is correct
    Then expect contacts grid last name column at row 1 is correct

  @sdc_contacts_detail_name_all_details
  Scenario: Contacts Details Add Name Scenario 2 :Add/Edit All the Name fields(prefix, firstname, middlename, lastname, suffix) in Contact Details panel and verify Grid is updated correctly
    Then sign-in to orders
    Then navigate to Contacts
    Then delete all present contacts with the value First
    Then expect count of contact search results is 0
    Then click remove button on search results of contacts filter
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name  | company | country       | street_address | city     | state    | postal_code | phone        |  email | groups | reference_number|cost_code |
      | |random | United States | 1 Cortlandt St | New York | New York | 10007 |random | random |random | random |random |
    Then click on contact details panel name expand button
    Then set contact details name prefix to BG
    Then set contact details first name to First
    Then set contact details middle name to Middle
    Then set contact details last name to Last
    Then set contact details suffix to sufix
    Then click on contact details panel name collapse button
    Then in contacts grid uncheck row 1
    Then search contacts from contacts filter panel with name First
    Then expect count of contact search results is 1
    Then expect contacts grid prefix column at row 1 is correct
    Then expect contacts grid first name column at row 1 is correct
    Then expect contacts grid middle name column at row 1 is correct
    Then expect contacts grid last name column at row 1 is correct
    Then expect contacts grid suffix column at row 1 is correct

  @sdc_contacts_detail_company_single
  Scenario: Contacts Details Add Company Scenario 1 :Add/Edit Single Company in Contact Details panel
    Then sign-in to orders
    Then navigate to Contacts
    Then delete all present contacts with the value CompanySingle
    Then expect count of contact search results is 0
    Then click remove button on search results of contacts filter
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name  | company | country       | street_address | city     | state    | postal_code | phone        |  email | groups | reference_number|cost_code |
      |CompanySingle |random | United States | 1 Cortlandt St | New York | New York | 10007 |random | random |random | random |random |
    Then in contacts grid uncheck row 1
    Then search contacts from contacts filter panel with name CompanySingle
    Then expect contacts grid company column at row 1 is correct

  @sdc_contacts_detail_company_department_and_title_details
  Scenario: Contacts Details - Company Add Title and Department Scenario 1:Expand the Name field in Contact Details panel
    Then sign-in to orders
    Then navigate to Contacts
    Then delete all present contacts with the value CompanyDetail
    Then expect count of contact search results is 0
    Then click remove button on search results of contacts filter
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name  | company | country       | street_address | city     | state    | postal_code | phone        |  email | groups | reference_number|cost_code |
      |CompanyDetail |random | United States | 1 Cortlandt St | New York | New York | 10007 |random | random |random | random |random |
    Then click on contact details panel company expand button
    Then set contact details department to CompanyDepartment
    Then set contact details title to CompanyTitle
    Then click on contact details panel company collapse button
    Then in contacts grid uncheck row 1
    Then search contacts from contacts filter panel with name CompanyDetail
    Then expect count of contact search results is 1
    Then expect contacts grid company column at row 1 is correct
    Then expect contacts grid title column at row 1 is correct
    Then expect contacts grid department column at row 1 is correct

  @sdc_contacts_add_new_contact_max_lines
  Scenario: Contacts BVT Scenario 1 : Add new contact with maximum no of line in Street Address field
    Then sign-in to orders
    Then navigate to Contacts
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name | company | country| city | state | postal_code | phone  |  email | groups | reference_number|cost_code |
      |random     |random   |United States  |San Juan|Federated States Of Micronesia|0097-5824|23345142-123|random  |        |random           |          |
    Then set street address on contact page details to maximum lines 3
    Then expect street address error message is not displayed
    Then in contacts grid uncheck row 1
    Then search contacts from contacts filter panel with name newly added
    Then in contacts grid check row 1
    Then expect values of contact added in contacts grid are correct
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name | company | country| city | state | postal_code | phone  |  email | groups | reference_number|cost_code |
      |random     |random   |United States  |San Juan|Federated States Of Micronesia|0097-5824|23345142-123|random  |        |random           |          |
    Then set street address on contact page details to maximum lines 4
    Then expect street address error message is displayed

  @sdc_contact_add_new_contact_different_addresses
  Scenario: Contacts BVT Scenario 1 : Click add, add new contact  and the open and view details
    Then sign-in to orders
    Then navigate to Contacts
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name | company | country| city | state | postal_code | phone  |  email | groups | reference_number|cost_code |
      |random     |random   |  ||||23345142-123|random  |        |random           |          |
    Then set address to domestic
    Then in contacts grid uncheck row 1
    Then search contacts from contacts filter panel with name newly added
    Then in contacts grid check row 1
    Then expect values of contact added in contacts grid are correct
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name | company | country| city | state | postal_code | phone  |  email | groups | reference_number|cost_code |
      |random     |random   |  ||||23345142-123|random  |        |random           |          |
    Then set address to international
    Then in contacts grid uncheck row 1
    Then search contacts from contacts filter panel with name newly added
    Then in contacts grid check row 1
    Then expect values of contact added in contacts grid are correct
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name | company | country| city | state | postal_code | phone  |  email | groups | reference_number|cost_code |
      |random     |random   |  ||||23345142-123|random  |        |random           |          |
    Then set address to apo
    Then in contacts grid uncheck row 1
    Then search contacts from contacts filter panel with name newly added
    Then in contacts grid check row 1
    Then expect values of contact added in contacts grid are correct

  @sdc_contacts_search_country_results
  Scenario: Contacts BVT Scenario 1 : Add new contact with maximum no of line in Street Address field
    Then sign-in to orders
    Then navigate to Contacts
    Then click add button on contacts toolbar
    Then search contact details country with value Great
    Then expect search country list contains value Great