@pp_header_favicons
Feature: PP-MVP: Header and Favicons

  Background:
    Given PP: A valid user is signed into Partner Portal

  Scenario: PP: Header and Favicons Validation
    Then PP: Expect Stamps Endicia Partner Portal Logo exists
    Then PP: expect user is redirected to the Dashboard page