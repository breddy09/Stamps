Feature: Envelopes BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_bvt_envelopes
  Scenario: Envelope
    Then select Print On Envelope - 10
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    #Then expect Print Form service cost for FCM Letter is N/A
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then Sign out


