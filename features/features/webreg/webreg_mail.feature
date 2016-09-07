Feature: First time Mail sign in

  Background:
    Given I launched default browser

  @webreg_mail
  Scenario: What's new modal
    Then WebReg Profile: Load Registration Page
    Then WebReg Profile: Set User ID and Email to Random Value

    Then WebReg Profile: Set Password to pass111
    Then WebReg Profile: Set Re-Type password to pass111
    Then WebReg Profile: Set How will you use Stamps.com to Both Mailing and Shipping
    Then WebReg Profile: Set Referrer Name to Already used in office
    Then WebReg Profile: Set 1st Question to What is your mother's maiden name
    Then WebReg Profile: Set 1st Answer to stamps
    Then WebReg Profile: Set 2nd Question to What was your high school mascot
    Then WebReg Profile: Set 2nd Answer to stamps

    Then WebReg Profile: Continue to Mailing Information Page
    Then WebReg Membership: Set First Name to random
    Then WebReg Membership: Set Last Name to random
    Then WebReg Membership: Set Company to random
    Then WebReg Membership: Set Address to 1990 E Grand Avenue
    Then WebReg Membership: Set City to El Segundo
    Then WebReg Membership: Set State to California
    Then WebReg Membership: Set Zip Code to 90245
    Then WebReg Membership: Set Phone to random
    Then WebReg Membership: Set Extenion to random

    Then WebReg Membership: Set Cardholder name to random
    Then WebReg Membership: Set Card number to 4111111111111111
    Then WebReg Membership: Set Expiration Month to February
    Then WebReg Membership: Set Expiration Year to 2019
    Then WebReg Membership: Set Billing address same as mailing address to Checked
    Then WebReg Membership: Set Terms & Conditions to Checked

    Then WebReg Membership: Submit and correct errors
    Then Registration Choose Supplies: Place Order
    Then Registration: Expect Web Registration result page is either Download page or Webpostage
    Then WebReg Profile:  Send username to standard out

    Then What's New: Expect modal to be present
    Then What's new: Click More Info
    Then More Info: Expect More Info page is present
    Then More Info: Close More Info page
    Then What's New: Click Continue button
    Then Sign out