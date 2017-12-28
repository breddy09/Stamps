Feature: Bulk Update Domestic

  Background:
    Given a valid user is signed in to Web Apps

  @bulk_update_dimensions
  Scenario: ORDERSAUTO-2261 Bulk Update: Dimensions controller
#    #Add 1st order
#    Then add order 1
#    Then set Order Details Ship-From to default
#    Then set Order Details Ship-To to random address between zone 8
#    Then set Order Details service to PM Package
#    Then set Order Details Pounds to 1
#    Then set Order Details Ounces to 1
#    Then set Order Details Length to 1
#    Then set Order Details Width to 1
#    Then set Order Details Height to 1
#    #Add 2nd order
#    Then add order 2
#    Then set Order Details Ship-From to default
#    Then set Order Details Ship-To to random address between zone 8
#    Then set Order Details service to PM Large Package
#    Then set Order Details Pounds to 2
#    Then set Order Details Ounces to 2
#    Then set Order Details Length to 1
#    Then set Order Details Width to 1
#    Then set Order Details Height to 1
#
#    #Check 1st two orders
#    Then check order 1
#    Then check order 2

    #Updating order details
    #Then set Bulk Update Ship From to default
    #todo-BulkUpdate missing expectation for Ship From
    #Then set Bulk Update Domestic service to PME Package
    #todo-BulkUpdate missing expectation for Domestic service

    # check weight

    #Then set Bulk Update Pounds to 1
    #todo-BulkUpdate missing expectation for Bulk Update Pounds
    #Then set Bulk Update Ounces to 1
    #todo-BulkUpdate missing expectation for Bulk Update Ounces

    #check dimensions
    Then set Bulk Update Length to 1
    Then set Bulk Update Width to 1
    Then set Bulk Update Height to 1

    Then set bulk update length to 0
    Then increment bulk update length by 8
    Then decrement bulk update length by 8

    Then set bulk update width to 0
    Then increment bulk update width by 8
    Then decrement bulk update width by 8

    Then set bulk update height to 0
    Then increment bulk update height by 8
    Then decrement bulk update height by 8

    Then click Bulk Update Update Order button
    Then Pause for 2 seconds

    Then Refresh the browser

    #verify fields in 1st order
    Then check Orders Grid row 1
    Then expect Order Details form Ship From is correct
    Then expect Orders Grid service is PME Package
    #Then expect Order Details form Pound is 2

    Then uncheck order 1
    Then uncheck order 2

    #verify fields in 2nd order
    Then check order 2
    Then expect Order Details form Ship From is correct
    Then expect Orders Grid service is PME Package
    #Then expect Order Details form Pound is 2

    Then Sign out

    @bulk_update_dom
    Scenario: Bulk Update Domestic
      #Adding 1st order
      Then add new order
      Then set Order Details Ship-From to default
      Then set Order Details Ship-To to random address in zone 1
      Then set Order Details service to PM Package
      Then set Order Details Pounds to 1

      #Adding 2nd order
      Then add new order
      Then set Order Details Ship-From to default
      Then set Order Details Ship-To to random address in zone 1
      Then set Order Details service to PM Package
      Then set Order Details Pounds to 1

      Then Refresh the browser

      #Check 1st two orders
      Then check Orders Grid row 1
      Then check Orders Grid row 2

      #Updating order details
      Then set Bulk Update Ship From to default
      Then set Bulk Update Domestic service to PME Package
      Then set Bulk Update Pounds to 1
      Then set Bulk Update Ounces to 1
      Then click Bulk Update Update Order button
      Then Pause for 2 seconds

      Then Refresh the browser

      #verify fields in 1st order
      Then check Orders Grid row 1
      Then expect Order Details form Ship From is default
      Then expect Orders Grid service is PME Package
      #Then expect Order Details form Pound is 2
      Then uncheck Orders Grid row 1

      #verify fields in 2nd order
      Then check Orders Grid row 2
      Then expect Order Details form Ship From is correct
      Then expect Orders Grid service is PME Package
      #Then expect Order Details form Pound is 2

      Then Sign out