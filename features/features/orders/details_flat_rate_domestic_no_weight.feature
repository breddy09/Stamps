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
  Scenario:  Domestic Flat Rate
    Then Toolbar: Add

    # Priority Mail Flat Rate Envelope
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address in Zone 1
    Then Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Details: Expect Service to be "Priority Mail Flat Rate Envelope"
    Then Details: Expect Pounds to be 0.00
    Then Details: Expect Ounces to be 0.00
    Then Grid: Expect Service to be Priority Mail
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail Padded Flat Rate Envelope
    Then Details: Set Service to "Priority Mail Padded Flat Rate Envelope"
    Then Details: Expect Service to be "Priority Mail Padded Flat Rate Envelope"
    Then Details: Expect Pounds to be 0.00
    Then Details: Expect Ounces to be 0.00
    Then Grid: Expect Service to be Priority Mail
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail Legal Flat Rate Envelope
    Then Details: Set Service to "Priority Mail Legal Flat Rate Envelope"
    Then Details: Expect Service to be "Priority Mail Legal Flat Rate Envelope"
    Then Details: Expect Pounds to be 0.00
    Then Details: Expect Ounces to be 0.00
    Then Grid: Expect Service to be Priority Mail
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail Small Flat Rate Box
    Then Details: Set Service to "Priority Mail Small Flat Rate Box"
    Then Details: Expect Service to be "Priority Mail Small Flat Rate Box"
    Then Details: Expect Pounds to be 0.00
    Then Details: Expect Ounces to be 0.00
    Then Grid: Expect Service to be Priority Mail
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail Medium Flat Rate Box
    Then Details: Set Service to "Priority Mail Medium Flat Rate Box"
    Then Details: Expect Service to be "Priority Mail Medium Flat Rate Box"
    Then Details: Expect Pounds to be 0.00
    Then Details: Expect Ounces to be 0.00
    Then Grid: Expect Service to be Priority Mail
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail Large Flat Rate Box
    Then Details: Set Service to "Priority Mail Large Flat Rate Box"
    Then Details: Expect Service to be "Priority Mail Large Flat Rate Box"
    Then Details: Expect Pounds to be 0.00
    Then Details: Expect Ounces to be 0.00
    Then Grid: Expect Service to be Priority Mail
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail Regional Rate Box A
    Then Details: Set Service to "Priority Mail Regional Rate Box A"
    Then Details: Expect Service to be "Priority Mail Regional Rate Box A"
    Then Details: Expect Pounds to be 0.00
    Then Details: Expect Ounces to be 0.00
    Then Grid: Expect Service to be Priority Mail
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail Regional Rate Box B
    Then Details: Set Service to "Priority Mail Regional Rate Box B"
    Then Details: Expect Service to be "Priority Mail Regional Rate Box B"
    Then Details: Expect Pounds to be 0.00
    Then Details: Expect Ounces to be 0.00
    Then Grid: Expect Service to be Priority Mail
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail Express Flat Rate Envelope
    Then Details: Set Service to "Priority Mail Express Flat Rate Envelope"
    Then Details: Expect Service to be "Priority Mail Express Flat Rate Envelope"
    Then Details: Expect Pounds to be 0.00
    Then Details: Expect Ounces to be 0.00
    Then Grid: Expect Service to be Priority Mail Express
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail Express Padded Flat Rate Envelope
    Then Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Details: Expect Service to be "Priority Mail Express Padded Flat Rate Envelope"
    Then Details: Expect Pounds to be 0.00
    Then Details: Expect Ounces to be 0.00
    Then Grid: Expect Service to be Priority Mail Express
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail Express Legal Flat Rate Envelope
    Then Details: Set Service to "Priority Mail Express Legal Flat Rate Envelope"
    Then Details: Expect Service to be "Priority Mail Express Legal Flat Rate Envelope"
    Then Details: Expect Pounds to be 0.00
    Then Details: Expect Ounces to be 0.00
    Then Grid: Expect Service to be Priority Mail Express
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Sign out
