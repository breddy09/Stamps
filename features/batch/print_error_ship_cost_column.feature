
Feature:  B-01742 Show an Order's Most Recent GetRates(), CleanseAddress(), or CreateIndicium() Error in Ship Cost Column

  Background:
    * I am signed in as a batch shipper

  @ship_cost_indicium_error
  Scenario:  B-01742 Error in Ship Cost Column
    * Add new order
    * Print expecting rating error
    * Edit row 1 in the order grid
    * Set Recipient Address to B-01742 Invalid Address
    * Set Phone to 4157984533
    * Print expecting invalid address error
    * Sign out
