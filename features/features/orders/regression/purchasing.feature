#todo-rob Fix Purchasing so that if a user has 100K the test will fail right away, not being able to purchase more stamps.
Feature: Purchasing

  Background:
    Given a valid user is signed in to Web Apps

  @orders_purchasing
  Scenario:
    Then on Add Funds modal, purchase 10
    Then on Add Funds modal, click Purchase button
    Then Buy Mail Confirm Purchase: Expect text area contains, Please confirm your $10.00 postage purchase.
    Then Buy Mail Confirm Transction: Click Confirm button
    Then Buy Mail Purchase Approved: Expect text area contains, Your postage purchase request for $10.00 has been approved.
    Then Buy Mail Purchase Approved: Click OK button
    Then Buy Mail: Expect customer balance increased by $10

    Then on Add Funds modal, purchase 25
    Then on Add Funds modal, click Purchase button
    Then Buy Mail Confirm Purchase: Expect text area contains, Please confirm your $25.00 postage purchase.
    Then Buy Mail Confirm Transction: Click Confirm button
    Then Buy Mail Purchase Approved: Expect text area contains, Your postage purchase request for $25.00 has been approved.
    Then Buy Mail Purchase Approved: Click OK button
    Then Buy Mail: Expect customer balance increased by $25

    Then on Add Funds modal, purchase 50
    Then on Add Funds modal, click Purchase button
    Then Buy Mail Confirm Purchase: Expect text area contains, Please confirm your $50.00 postage purchase.
    Then Buy Mail Confirm Transction: Click Confirm button
    Then Buy Mail Purchase Approved: Expect text area contains, Your postage purchase request for $50.00 has been approved.
    Then Buy Mail Purchase Approved: Click OK button
    Then Buy Mail: Expect customer balance increased by $50

    Then on Add Funds modal, purchase 100
    Then on Add Funds modal, click Purchase button
    Then Buy Mail Confirm Purchase: Expect text area contains, Please confirm your $100.00 postage purchase.
    Then Buy Mail Confirm Transction: Click Confirm button
    Then Buy Mail Purchase Approved: Expect text area contains, Your postage purchase request for $100.00 has been approved.
    Then Buy Mail Purchase Approved: Click OK button
    Then Buy Mail: Expect customer balance increased by $100

    Then on Add Funds modal, purchase Other Amount 35
    Then Buy Mail Confirm Purchase: Expect text area contains, Please confirm your $35.00 postage purchase.
    Then Buy Mail Confirm Transction: Click Confirm button
    Then Buy Mail Purchase Approved: Expect text area contains, Your postage purchase request for $35.00 has been approved.
    Then Buy Mail Purchase Approved: Click OK button
    Then Buy Mail: Expect customer balance increased by $35
    Then Sign out