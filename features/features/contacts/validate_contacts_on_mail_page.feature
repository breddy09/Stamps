Feature:  Validate contacts on the mail page

  Background:
    Given Start test driver
  @validate_contacts_wihtout_name
  Scenario: Create new contact wihout name and validate it on the mail page
    Then sign-in to mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then navigate to Contacts
    Then click add button on contacts toolbar
    Then set contact details to
      | company | country     | street_address  | city    | state   | postal_code | phone   |  email |
      | random  |United States|189 Second St    |Newburgh |New York |12550        |random   |random  |
    Then save new contact details
    Then click print postage button on contacts toolbar
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then expect error icon is not present on the print form
    Then set mail to to empty on the print form
    Then click mail to link on the print form
    Then search for the contact in contacts modal
    Then check row 1 in contacts modal grid
    Then click select button
    Then expect adress cleansing modal is not present
    Then expect error icon is not present on the print form
    Then sign out

