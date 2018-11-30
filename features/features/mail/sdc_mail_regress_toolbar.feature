Feature:  Mail Print Form Toolbar

  Background:
    Given Start test driver

  @mail_print_button_labels
  Scenario: WEBAPPS-11938 Label for printing stamps has incorrect text
    Then sign-in to mail
    Then select print on Stamps
    Then expect mail toolbar print button label is Print Stamps
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then expect mail toolbar print button label is Print Label
    Then select print on Envelope - #10, 4 ⅛" x 9 ½"
    Then expect mail toolbar print button label is Print Envelope
    Then select print on Roll - 4" x 6" Shipping Label
    Then expect mail toolbar print button label is Print Label
    Then sign out

  @dropdown_tooltips
  Scenario: WEBAPPS-11395 Tooltip Should Not Display when Drop Down Is Active
    Then sign-in to mail
#    print
    Then click mail toolbar print dropdown
    Then expect mail toolbar print dropdown tooltip is not present
    Then click mail toolbar print dropdown
    Then blur out on print form
    Then hover on mail toolbar print dropdown
    Then expect mail toolbar print dropdown tooltip is present

#    favorites
    Then click mail toolbar favorites
    Then expect mail toolbar favorites tooltip is not present
    Then click mail toolbar favorites
    Then blur out on print form
    Then hover on mail toolbar favorites dropdown
    Then expect mail toolbar favorites tooltip is present

#    orders
    Then navigate to Orders
    Then click orders toolbar tags
    Then expect orders toolbar tags tooltip is not present
    Then click orders toolbar tags
    Then blur out on orders
    Then hover on orders toolbar tags
    Then expect orders toolbar tags tooltip is present

    Then navigate to History
#    history
#    schedule pickup
    Then click schedule pickup button on history toolbar
    Then expect schedule pickup tooltip on history toolbar is not present
    Then click schedule pickup button on history toolbar
    Then blur out on history
    Then hover on schedule pickup button on history toolbar
    Then expect schedule pickup tooltip on history toolbar is present

#    create scan form
    Then click create scan form button on history toolbar
    Then expect create scan form tooltip on history toolbar is not present
    Then click create scan form button on history toolbar
    Then blur out on history
    Then hover on create scan form button on history toolbar
    Then expect create scan form tooltip on history toolbar is present

#    cost codes
    Then click cost codes button on history toolbar
    Then expect cost codes tooltip on history toolbar is not present
    Then click cost codes button on history toolbar
    Then blur out on history
    Then hover on cost codes button on history toolbar
    Then expect cost codes tooltip on history toolbar is present

#    reports
#    date
    Then click date link on reports toolbar
    Then expect date tooltip on reports toolbar is not present
    Then click date link on reports toolbar
    Then blur out on reports
    Then hover on date link on reports toolbar
    Then expect date tooltip on reports toolbar is present

#    view
    Then click view link on reports toolbar
    Then expect view tooltip on reports toolbar is not present
    Then click view link on reports toolbar
    Then blur out on reports
    Then hover on view link on reports toolbar
    Then expect view tooltip on reports toolbar is present

#    interval
    Then click interval link on reports toolbar
    Then expect interval tooltip on reports toolbar is not present
    Then click interval link on reports toolbar
    Then blur out on reports
    Then hover on interval link on reports toolbar
    Then expect interval tooltip on reports toolbar is present

    Then sign out