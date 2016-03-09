
Feature:  Amazon Store Management

  Background:
    Given I am signed in to Orders

    @amazon
    Scenario: Store Management - Amazon Store
      Then Manage Stores: Open Modal
      Then Manage Stores: Delete All Stores in Grid

      Then Manage Stores: Add

      Then Marketplace: Select Amazon

      Then Amazon Store: Set Amazon Seller ID to A1BX1F0B3I9QDV
      Then Amazon Store: Set Amazon MWS Auth Token to amzn.mws.caa9355f-c8a9-768e-bf55-8b51e73b8f98
      Then Amazon Store: Click Verify Seller ID button
      Then Amazon Store: Set Order Source to Amazon.com
      Then Amazon Store: Set Product Identifier to Use SKU
      Then Amazon Store: Connect for the first time expecting Amazon Settings modal

      Then Store Settings: Set Store Nickname to random

      Then Store Settings: Check Automatically Import New Orders
      Then Store Settings: Save
      Then Toolbar: Refresh Orders

      Then Manage Stores: Select Store random

      # Test Reconnect
      Then Manage Stores: Reconnect

      Then Amazon Store: Set Amazon Seller ID to A1BX1F0B3I9QDV
      Then Amazon Store: Set Amazon MWS Auth Token to amzn.mws.caa9355f-c8a9-768e-bf55-8b51e73b8f98
      Then Amazon Store: Click Verify Seller ID button
      Then Amazon Store: Set Order Source to Amazon.com
      Then Amazon Store: Set Product Identifier to Use SKU
      Then Amazon Store: Connect

      Then Manage Stores: Select Store random
      Then Manage Stores: Delete
      Then Toolbar: Refresh Orders

      Then Manage Stores: Close Modal
      Then Sign out



