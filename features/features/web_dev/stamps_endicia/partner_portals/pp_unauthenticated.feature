Feature: PP-MVP: Authenticate

  Background:
    Given PP: A valid user is signed into Partner Portal

  @pp_authenticate
  Scenario: PP: Authenticate Validation


    Then PP: de-authenticate user
    Then PP: expect user is redirect to the login page

    Then PP: set login page email to env value
    Then PP: set login page password to env value
    Then PP: User clicks Log In
    Then PP: expect dashboard page header exist
    Then PP: navigate back to previous page
    Then PP: User clicks Forgot Password link
    Then PP: click on global header
    Then PP: expect global header exists

