Feature: click print modal print button Sample - PME Padded Flat Rate Envelope

  Background:
    Given a valid user is signed in to Web Apps

  @print_sample_pme_padded_flat_rate_envelope
  Scenario:  PME Padded Flat Rate Envelope
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PME Padded Flat Rate Envelope
    Then set Order Details form Ounces to 1
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then click print modal print button Sample
    Then Sign out