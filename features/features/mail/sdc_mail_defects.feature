Feature:  Mail defects from Sprint

  Background:
    Given Start test driver

  @multiple_prints_wrong_cost
  Scenario: WEBAPPS-11799 Cost Shows Wrong Cost for Multiple Prints
            Precondition:
            Account used to sign-in must have 4 contacts listed below, all contacts must have valid email addresses
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then expect print form service cost is $0.00
    Then expect print form total amount is $0.00
    Then set print form mail-to to address to Wrong Cost, Multiple Prints, 1350 Market Street #2905, San Francisco CA 94102
    Then set print form email tracking
    Then select print form service PM Package
    Then set print form pounds to 57
    # Add 2nd contact
    Then click add address button on print form
    Then set address on add address modal to Add Address, Add Address Company, 1350 Market Street 2904, San Francisco CA 94102
    Then set email on add address modal to rcruz@stamps.com
    Then click add button on add address modal
    Then expect selected contacts count is 2
    Then expect multiple contacts view include Wrong Cost, Add Address
    # Add 3rd contact
    Then click add address button on print form
    Then set address on add address modal to Third Contact, Some Company, 1350 Market Street 2906, San Francisco CA 94102
    Then set email on add address modal to rcruz@stamps.com
    Then click add button on add address modal
    Then expect selected contacts count is 3
    Then expect multiple contacts view include Wrong Cost, Add Address, Third Contact
    Then expect print form service cost is greater than $50.00
    Then expect print form total amount is greater than $50.00

  @add_address_email_validation
  Scenario: WEBAPPS-11803 Email Required Not Validating Correctly
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-to to address to Invalid Email, On Add Address Modal, 1350 Market Street #2905, San Francisco CA 94102
    Then click add address button on print form
    Then set address on add address modal to Bad Email, Invalid Email Address, 1350 Market Street #2905, San Francisco CA 94102
    Then set email on add address modal to argh!
    Then click add button on add address modal
    Then expect add address modal is present
    Then expect add address email error message is Please enter a valid email address
    Then click cancel button on add address modal
    Then sign out

  @print_form_incomplete_fields
  Scenario: WEBAPPS-11801 Email Validation is not Enforced For Add Address
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then click print label
    Then expect incomplete fields modal is present
    Then expect error message on incomplete fields modal includes Ship To address is required
    Then expect error message on incomplete fields modal includes Service is required
    Then expect error message on incomplete fields modal includes Weight cannot be 0
    Then click close button on incomplete fields
    Then set print form mail-to to address to Email Validation, Not Enforced, 1350 Market Street #2905, San Francisco CA 94102
    Then blur out on print form
    Then pause for 1 second
    Then select print form service PM Package
    Then blur out on print form
    Then show advanced options
    Then pause for 1 second
    Then select advanced options extra services
    Then pause for 1 second
    Then check hold for pickup on extra services modal
    Then pause for 1 seconds
    Then save extra services
    Then blur out on print form
    Then click print label
    Then pause for 1 second
    Then expect incomplete fields modal is present
    Then expect error message on incomplete fields modal includes Weight cannot be 0
    Then click close button on incomplete fields
    Then increment print form ounces by 1
    Then blur out on print form
    Then pause for 1 second
    Then set print form tracking Signature Required
    Then blur out on print form
    Then pause for 1 second
    Then blur out on print form
    Then click print label
    Then expect incomplete fields modal is present
    Then expect error message on incomplete fields modal includes Email is required.
    Then click close button on incomplete fields
    Then sign out


  @extra_services_cost_for_rrb_service
  Scenario: WEBAPPS-10539 Web Client Mail | Extra Services Not Updating Price Weight Zero
            Customer selects Fragile under Extra services and notices the price
            does not update on the Mail page but price is accurate if printed.
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-to to a random address in zone 1
    Then set print form email tracking stamps@mailinator.com
    Then select print form service PM Regional Rate Box A
    Then set print form weight to lbs 0 oz 0
    Then show advanced options
    Then select advanced options extra services
    # Cost should not be $0
    Then check fragile on extra services modal
    Then expect fragile cost on extra services modal is $0.00
    #Then expect fragile cost on extra services modal is greater than $0
    Then pause for 1 seconds
    Then save extra services
    Then expect print form advanced options extra services button is present
    Then expect print form extra services cost is $0.00
#    Then expect print form extra services cost is greater than $0.00
    Then sign out



