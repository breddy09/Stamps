Feature: Don't Require weight for Flat/Regional Rate Services
  We should not require a weight value when the selected Service includes "Flat Rate" or "Regional Rate" in the name.
  Domestic Flat/Regional Rate Service List
  Priority Mail Flat Rate Envelope
  Priority Mail Padded Flat Rate Envelope
  Priority Mail Legal Flat Rate Envelope
  Priority Mail Small Flat Rate Box
  Priority Mail Medium Flat Rate Box
  Priority Mail Large Flat Rate Box
  Priority Mail Regional Rate Box A
  Priority Mail Regional Rate Box B
  Priority Mail Express Flat Rate Envelope
  Priority Mail Express Padded Flat Rate Envelope
  Priority Mail Express Legal Flat Rate Envelope

  Background:
    Given I am signed in to Orders

  @details_flat_rate_no_weight_domestic
  Scenario:  Domestic Flat
    Then Toolbar: Add

    # Priority Mail Flat Rate Envelope
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Expect Service is Priority Mail Flat Rate Envelope
    Then Details: Expect Pounds is 0
    Then Details: Expect Ounces is 0
    Then Grid: Expect Service is Priority Mail
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail Padded Flat Rate Envelope
    Then Details: Select Service Priority Mail Padded Flat Rate Envelope
    Then Details: Expect Service is Priority Mail Padded Flat Rate Envelope
    Then Details: Expect Pounds is 0
    Then Details: Expect Ounces is 0
    Then Grid: Expect Service is Priority Mail
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail Legal Flat Rate Envelope
    Then Details: Select Service Priority Mail Legal Flat Rate Envelope
    Then Details: Expect Service is Priority Mail Legal Flat Rate Envelope
    Then Details: Expect Pounds is 0
    Then Details: Expect Ounces is 0
    Then Grid: Expect Service is Priority Mail
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail Small Flat Rate Box
    Then Details: Select Service Priority Mail Small Flat Rate Box
    Then Details: Expect Service is Priority Mail Small Flat Rate Box
    Then Details: Expect Pounds is 0
    Then Details: Expect Ounces is 0
    Then Grid: Expect Service is Priority Mail
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail Medium Flat Rate Box
    Then Details: Select Service Priority Mail Medium Flat Rate Box
    Then Details: Expect Service is Priority Mail Medium Flat Rate Box
    Then Details: Expect Pounds is 0
    Then Details: Expect Ounces is 0
    Then Grid: Expect Service is Priority Mail
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail Large Flat Rate Box
    Then Details: Select Service Priority Mail Large Flat Rate Box
    Then Details: Expect Service is Priority Mail Large Flat Rate Box
    Then Details: Expect Pounds is 0
    Then Details: Expect Ounces is 0
    Then Grid: Expect Service is Priority Mail
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail Regional Rate Box A
    Then Details: Select Service Priority Mail Regional Rate Box A
    Then Details: Expect Service is Priority Mail Regional Rate Box A
    Then Details: Expect Pounds is 0
    Then Details: Expect Ounces is 0
    Then Grid: Expect Service is Priority Mail
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail Regional Rate Box B
    Then Details: Select Service Priority Mail Regional Rate Box B
    Then Details: Expect Service is Priority Mail Regional Rate Box B
    Then Details: Expect Pounds is 0
    Then Details: Expect Ounces is 0
    Then Grid: Expect Service is Priority Mail
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail Express Flat Rate Envelope
    Then Details: Select Service Priority Mail Express Flat Rate Envelope
    Then Details: Expect Service is Priority Mail Express Flat Rate Envelope
    Then Details: Expect Pounds is 0
    Then Details: Expect Ounces is 0
    Then Grid: Expect Service is Priority Mail Express
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail Express Padded Flat Rate Envelope
    Then Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    Then Details: Expect Service is Priority Mail Express Padded Flat Rate Envelope
    Then Details: Expect Pounds is 0
    Then Details: Expect Ounces is 0
    Then Grid: Expect Service is Priority Mail Express
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail Express Legal Flat Rate Envelope
    Then Details: Select Service Priority Mail Express Legal Flat Rate Envelope
    Then Details: Expect Service is Priority Mail Express Legal Flat Rate Envelope
    Then Details: Expect Pounds is 0
    Then Details: Expect Ounces is 0
    Then Grid: Expect Service is Priority Mail Express
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Sign out
