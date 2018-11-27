Feature:  History Filter Panel

  Background:
    Given Start test driver

  @history_filter_panel
  Scenario: History Filter Panel functions
    Then sign-in to orders
    Then navigate to History
    Then expand date printed on history filter panel

    Then select today on history filter panel
    Then expect today is selected on history filter panel
    Then expect today count on history filter panel is greater than 0

    Then select past 7 days on history filter panel
    Then expect past 7 days is selected on history filter panel
    Then expect past 7 days count on history filter panel is greater than 0

    Then select past 30 days on history filter panel
    Then expect past 30 days is selected on history filter panel
    Then expect past 30 days count on history filter panel is greater than 0

    Then select past 3 months on history filter panel
    Then expect past 3 months is selected on history filter panel
    Then expect past 3 months count on history filter panel is greater than 0

    Then select past 6 months on history filter panel
    Then expect past 6 months is selected on history filter panel
    Then expect past 6 months count on history filter panel is greater than 0

    Then select past 12 months on history filter panel
    Then expect past 12 months is selected on history filter panel
    Then expect past 12 months count on history filter panel is greater than 0

    Then select past 2 years on history filter panel
    Then expect past 2 years is selected on history filter panel
    Then expect past 2 years count on history filter panel is greater than 0

  @history_filter_direct_url
  @history_filter_direct_url_1
  Scenario: Navigating to direct URLs
    Then sign-in to mail
    Then navigate to History
    Then go to delivered filter on history directly
    Then wait while loading history filters grid
    Then expect delivered is selected on history filter panel status
    Then go to pending recipient action filter on history directly
    Then wait while loading history filters grid
    Then expect pending recipient action is selected on history filter panel status
    Then go to undeliverable filter on history directly
    Then wait while loading history filters grid
    Then expect undeliverable is selected on history filter panel status
    Then sign out

  @history_filter_direct_urlx
  Scenario: Not signed in user navigates to direct URLs
    Then go to delivered filter on history directly
    Then login to webclient
    Then wait while loading history filters grid
    Then expect delivered is selected on history filter panel status
    Then sign out
    Then go to pending recipient action filter on history directly
    Then login to webclient
    Then wait while loading history filters grid
    Then expect pending recipient action is selected on history filter panel status
    Then sign out
    Then go to undeliverable filter on history directly
    Then login to webclient
    Then wait while loading history filters grid
    Then expect undeliverable is selected on history filter panel status
    Then sign out


  @verify_search_by_recipient
  Scenario: Verify for File Insurance Claim Search Recipient works
    Then sign-in to mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then set print form mail-from to default
    Then set print form mail-to to address  Diana Dolly, random company, Attn RMA Department, 3345 Point Pleasant Road, Hebron, KY 41048-9711
    Then select print form service PM Large/Thick Envelope
    Then set print form weight to lbs 0 oz 1
    Then click print label
    Then confirm print on gif printing dialog
    Then click continue on confirm print modal
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then navigate to History
    Then set search prints tracking number on history filter panel to Diana Dolly
    Then click search icon on history filter panel
   # Then verify the grid count based on recipient column as Diana Doly
    Then expect history filter panel search results tab is present
    Then expect recipient column include Diana Dolly