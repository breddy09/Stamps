
Feature:  Rakuten Store Management

  Background:
    Given a valid user is signed in to Web Apps

    @rakuten
    Scenario: Rakuten Store Management
      Then Manage Stores: Open Modal
      Then Manage Stores: Delete All Stores

      # Add Store
      Then Manage Stores: Add

      Then Marketplace: Expect store selection modal contains Rakuten
      Then Marketplace: Select Rakuten

      Then Rakuten Store: Set Rakuten Seller ID 40549242
      Then Rakuten Store: Set FTP Username batchstore@stamps.com
      Then Rakuten Store: Set FTP Password stampstest225
      Then Rakuten Store: Set Map Rakuten SKU as your Product SKU to checked
      Then Rakuten Store: Set Map Rakuten SKU as your Product SKU to unchecked
      Then Rakuten Store: Set Map Rakuten SKU as your Product SKU to checked
      
      Then Rakuten Store: Connect

      Then Store Settings: Set Store Nickname to random

      Then Store Settings: Set Automatically Import New Orders to checked
      Then Store Settings: Save
      Then in Orders Toolbar, Refresh Orders

      Then Manage Stores: Select Store random

      # Reconnect Store
      Then Manage Stores: Reconnect

      Then Rakuten Store: Set Rakuten Seller ID 40549242
      Then Rakuten Store: Set FTP Username batchstore@stamps.com
      Then Rakuten Store: Set FTP Password stampstest225
      Then Rakuten Store: Set Map Rakuten SKU as your Product SKU to checked
      Then Rakuten Store: Set Map Rakuten SKU as your Product SKU to unchecked
      Then Rakuten Store: Set Map Rakuten SKU as your Product SKU to checked
      
      Then Rakuten Store: Connect

      Then Store Settings: Set Store Nickname to random

      Then Store Settings: Set Automatically Import New Orders to checked
      Then Store Settings: Save
      Then in Orders Toolbar, Refresh Orders

      # Edit Store
      Then Manage Stores: Select Store random
      Then Manage Stores: Edit

      Then Store Settings: Set Store Nickname to random

      Then Store Settings: Set Automatically Import New Orders to checked
      Then Store Settings: Save
      Then in Orders Toolbar, Refresh Orders

      # Delete Store
      Then Manage Stores: Select Store random
      Then Manage Stores: Delete
      Then in Orders Toolbar, Refresh Orders

      Then Manage Stores: Close Modal
      Then Sign out



