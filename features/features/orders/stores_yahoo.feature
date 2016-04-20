
Feature:  Amazon Store Management

  Background:
    Given I am signed in to Orders

    @yahoo
    Scenario: Store Management - Amazon Store
      Then Manage Stores: Open Modal
      #Then Manage Stores: Delete All Stores in Grid

      # Add Store
      Then Manage Stores: Add

      Then Marketplace: Select Yahoo

      Then Yahoo Store: Set Yahoo Store ID to yhst-143052023869418
      Then Yahoo Store: Set Partner Store Contract Token to 1.0_DLe5kels_wFcqVu33hTVLwqMAmGWerWagQ2RLZWbffEomPbeqdfCKZigaJ6FXO_3YcnJtQO.NCMVh9lBJY5gW_iE0oaFSipcty3sjnnx8wP6bgxlwIn.brtFnT8hRUY3srmZFIXJZA--
      Then Yahoo Store: Set First Order ID to Import to 637
      Then Yahoo Store: Test Connection
      Then Yahoo Store: Connect

      Then Store Settings: Set Store Nickname to random

      Then Store Settings: Set Automatically Import New Orders to checked
      Then Store Settings: Save

      Then Toolbar: Refresh Orders

      # Reconnect Store
      Then Manage Stores: Select Store random
      Then Manage Stores: Reconnect

      Then Yahoo Store: Set Yahoo Store ID to yhst-143052023869418
      Then Yahoo Store: Set Partner Store Contract Token to 1.0_DLe5kels_wFcqVu33hTVLwqMAmGWerWagQ2RLZWbffEomPbeqdfCKZigaJ6FXO_3YcnJtQO.NCMVh9lBJY5gW_iE0oaFSipcty3sjnnx8wP6bgxlwIn.brtFnT8hRUY3srmZFIXJZA--
      Then Yahoo Store: Set First Order ID to Import to 637
      Then Yahoo Store: Test Connection
      Then Yahoo Store: Connect

      # Edit Store
      Then Manage Stores: Select Store random
      Then Manage Stores: Edit

      Then Store Settings: Set Store Nickname to random

      Then Store Settings: Set Automatically Import New Orders to checked
      Then Store Settings: Save
      Then Toolbar: Refresh Orders

      Then Manage Stores: Close Modal
      Then Sign out



