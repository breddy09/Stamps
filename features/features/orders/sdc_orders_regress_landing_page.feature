Feature:  Landing Page

  Background:
    Given Start test driver

  @changes_to_landing_page
  Scenario: WEBAPPS-11290 Changes to Sign In Page
    Then visit Orders landing page
    Then expect landing page help link is Visit our Learning Center
    Then expect landing page sign up link is New to Stamps.com? Sign Up
    Then visit Orders landing page
    Then click on help link on landing page
    Then verify landing page help link url
    Then click sign up link on landing page
    Then expect resulting web reg url is correct
