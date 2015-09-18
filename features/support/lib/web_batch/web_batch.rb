module Batch

  class WebBatch < BatchPage

    def visit *args
      if args.length == 1
        ENV['URL'] = args[0]
      end

      url = "http://#{Batch.url_prefix}.stamps.com/webbatch/"
      @browser.goto url
      log "Page loaded.  #{url}"
      self
    end

    def sign_in *args
      LoginPage.new(@browser).sign_in args
    end

    def awaiting_shipment
      #todo-elie here are your steps;
      Filters.new(@browser).filter("Awaiting Shipment")
      Grid.new @browser
    end

    def shipped
      #todo-elie here are your steps;
      Filters.new(@browser).filter("Shipped")
      Grid.new @browser
    end

    def filters_panel
      Filters.new(@browser)
    end

    def multi_order
      MultiOrder.new(@browser)
    end

    def single_order_form
      SingleOrderForm.new(@browser)
    end

    def grid
      Grid.new(@browser)
    end

    def styles
      PageStyles.new @browser
    end
  end

end