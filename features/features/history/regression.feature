Feature:  History regression

  Background:
    Given Start test driver

  @container_label_return_address
  Scenario: Container label return address is user selected
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-from to Test User - el segundo, CA
    Then show advanced options
    Then set print form ship-to to international address
      | name   | company | street_address1 | street_address2  | city   | province | postal_code | country| phone  |
      | random | random  | random          | random           | random | random   | random      | Italy  | random |
    Then set print form weight to lbs 0 oz 1
    Then select print form service PMI Flat Rate Envelope
    Then click print form edit customs form button
    Then expect customs i agree to the usps privacy act statement is unchecked
    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set print form weight to lbs 0 oz 1
    Then click print label

    Then click continue on confirm print modal
    Then confirm print on gif printing dialog
    Then close your international label modal

    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then navigate to History
    Then expand eligible for on history filter panel
    Then select container label on history filter panel eligible for
    Then check row 1 on history grid
    Then click create container label on history toolbar
    Then click selected packages on history toolbar create container label
    Then click print label on container label modal
    Then click print button on ready to print modal

    Then confirm print on gif printing dialog

    Then close your container label modal on history
    Then expand date printed on history filter panel
    Then select today on history filter panel
    Then check row 1 on history grid
    Then expect print details on history is present
    Then expect return to on history print details contain Test User
    Then expect return to on history print details contain el segundo, CA
    Then sign out

  @container_label_return_address
  @container_label_return_address_selected
  Scenario: Container label return address is default address
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-from to Test User2 - el segundo, CA
    Then show advanced options
    Then set print form ship-to to international address
      | name   | company | street_address1 | street_address2  | city   | province | postal_code | country| phone  |
      | random | random  | random           | random            | random | random   | random      | Italy | random  |
    Then set print form weight to lbs 0 oz 1
    Then select print form service PMI Flat Rate Envelope
    Then click print form edit customs form button
    Then expect customs i agree to the usps privacy act statement is unchecked
    Then set customs package contents to Commercial Sample
    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set print form weight to lbs 0 oz 1
    Then click print label

    Then click continue on confirm print modal
    Then confirm print on gif printing dialog
    Then close your international label modal

    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then navigate to History
    Then expand eligible for on history filter panel
    Then select container label on history filter panel eligible for
    Then check row 1 on history grid
    Then click create container label on history toolbar
    Then click selected packages on history toolbar create container label
    Then click print label on container label modal
    Then click print button on ready to print modal

    Then confirm print on gif printing dialog

    Then close your container label modal on history
    Then expand date printed on history filter panel
    Then select today on history filter panel
    Then check row 1 on history grid
    Then expect print details on history is present
    Then expect return to on history print details contain Test User2
    Then expect return to on history print details contain el segundo, CA
    Then sign out

  @container_label_reprint
  Scenario: Container label reprint for Shipping label 8x11 paper
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then show advanced options
    Then set print form ship-to to international address
      | name   | company | street_address1 | street_address2  | city   | province | postal_code | country| phone  |
      | random | random  | random           | random            | random | random   | random      | Italy | random  |
    Then set print form weight to lbs 0 oz 1
    Then select print form service PMI Flat Rate Envelope
    Then click print form edit customs form button
    Then expect customs i agree to the usps privacy act statement is unchecked
    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set print form weight to lbs 0 oz 1
    Then click print label
    Then expect print modal on mail is present
    Then set mail print modal printer factory
    Then click print button on mail print modal
    Then close your international label modal
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then navigate to History
    Then select container label on history filter panel eligible for
    Then check row 1 on history grid
    Then click create container label on history toolbar
    Then click selected packages on history toolbar create container label
    Then expect container label modal on history is present
    Then expect number of containers on container label modal is 1
    Then click print label on container label modal
    Then select Shipping Label - 8 ½" x 11" Paper on printing on drop down on ready to print modal
    Then expect total cost on ready to print modal is 0
    Then click print button on ready to print modal

    Then click reprint button on your container label modal
    Then expect reprint modal on history is present
    Then click printing on drop down on ready to print modal
    Then expect Shipping Label - 8 ½" x 11" Paper is present on printing on on reprint modal
    Then expect Shipping Label - SDC-1200 is present on printing on on reprint modal
    Then expect Shipping Label - 5 ½" x 8 ½" is present on printing on on reprint modal
    Then expect Roll - 4" x 6" Shipping Label is not present on printing on on reprint modal
    Then expect Roll - 4 ⅛" x 6 ¼" Shipping Label is not present on printing on on reprint modal
    Then blur out on reprint modal
    Then select Shipping Label - 8 ½" x 11" Paper on printing on drop down on reprint modal
    Then click reprint button on reprint modal

    Then click reprint button on your container label modal
    Then expect reprint modal on history is present
    Then click printing on drop down on ready to print modal
    Then expect Shipping Label - 8 ½" x 11" Paper is present on printing on on reprint modal
    Then expect Shipping Label - SDC-1200 is present on printing on on reprint modal
    Then expect Shipping Label - 5 ½" x 8 ½" is present on printing on on reprint modal
    Then expect Roll - 4" x 6" Shipping Label is not present on printing on on reprint modal
    Then expect Roll - 4 ⅛" x 6 ¼" Shipping Label is not present on printing on on reprint modal
    Then blur out on reprint modal
    Then select Shipping Label - SDC-1200 on printing on drop down on reprint modal
    Then click reprint button on reprint modal

    Then click reprint button on your container label modal
    Then expect reprint modal on history is present
    Then click printing on drop down on ready to print modal
    Then expect Shipping Label - 8 ½" x 11" Paper is present on printing on on reprint modal
    Then expect Shipping Label - SDC-1200 is present on printing on on reprint modal
    Then expect Shipping Label - 5 ½" x 8 ½" is present on printing on on reprint modal
    Then expect Roll - 4" x 6" Shipping Label is not present on printing on on reprint modal
    Then expect Roll - 4 ⅛" x 6 ¼" Shipping Label is not present on printing on on reprint modal
    Then blur out on reprint modal
    Then select Shipping Label - 5 ½" x 8 ½" on printing on drop down on reprint modal
    Then click reprint button on reprint modal

    Then close reprint modal
    Then sign out

  @container_label_reprint
  Scenario: Container label reprint for Shipping label 8x11 paper
    Then sign-in to mail
    Then select print on Roll - 4" x 6" Shipping Label
    Then show advanced options
    Then set print form ship-to to international address
      | name   | company | street_address1 | street_address2  | city   | province | postal_code | country| phone  |
      | random | random  | random           | random            | random | random   | random      | Italy | random  |
    Then set print form weight to lbs 0 oz 1
    Then select print form service PMI Flat Rate Envelope
    Then click print form edit customs form button
    Then expect customs i agree to the usps privacy act statement is unchecked
    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set print form weight to lbs 0 oz 1
    Then click print label
    Then expect print modal on mail is present
    Then set mail print modal printer ZDesigner GC420d (EPL)
    Then click print button on mail print modal
    Then close your international label modal
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save tracking number on print form message panel
    Then navigate to History
    Then select container label on history filter panel eligible for
    Then check row 1 on history grid
    Then click create container label on history toolbar
    Then click selected packages on history toolbar create container label
    Then expect container label modal on history is present
    Then expect number of containers on container label modal is 1
    Then click print label on container label modal
    Then select Roll - 4" x 6" Shipping Label on printing on drop down on ready to print modal
    Then expect total cost on ready to print modal is 0
    Then click print button on ready to print modal

    Then click reprint button on your container label modal
    Then expect reprint modal on history is present
    Then click printing on drop down on ready to print modal
    Then expect Roll - 4" x 6" Shipping Label is present on printing on on reprint modal
    Then expect Roll - 4 ⅛" x 6 ¼" Shipping Label is present on printing on on reprint modal
    Then expect Shipping Label - 8 ½" x 11" Paper is not present on printing on on reprint modal
    Then expect Shipping Label - SDC-1200 is not present on printing on on reprint modal
    Then expect Shipping Label - 5 ½" x 8 ½" is not present on printing on on reprint modal
    Then blur out on reprint modal
    Then select Roll - 4" x 6" Shipping Label on printing on drop down on reprint modal
    Then click reprint button on reprint modal

    Then click reprint button on your container label modal
    Then expect reprint modal on history is present
    Then click printing on drop down on ready to print modal
    Then expect Roll - 4" x 6" Shipping Label is present on printing on on reprint modal
    Then expect Roll - 4 ⅛" x 6 ¼" Shipping Label is present on printing on on reprint modal
    Then expect Shipping Label - 8 ½" x 11" Paper is not present on printing on on reprint modal
    Then expect Shipping Label - SDC-1200 is not present on printing on on reprint modal
    Then expect Shipping Label - 5 ½" x 8 ½" is not present on printing on on reprint modal
    Then blur out on reprint modal
    Then select Roll - 4 ⅛" x 6 ¼" Shipping Label on printing on drop down on reprint modal
    Then click reprint button on reprint modal

    Then close reprint modal
    Then sign out