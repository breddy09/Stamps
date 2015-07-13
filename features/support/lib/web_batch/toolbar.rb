module Batch
  #require_relative 'grid'

  #
  #  Contains Add/Edit buton for orders.
  #
  class Toolbar < BrowserObject
    include GridCommon
    private
    def add_field
      @browser.span :text => 'Add'
    end

    def print_button
      @browser.elements(:text => 'Print').first
    end

    def balance_label
      balance = @browser.span(:id => 'postageBalanceAmt').text

    end

    public
    def balance
      balance_label.text
    end

    def print(*args)
      printer_window = PrintWindow.new(@browser)
      7.times {
        break if printer_window.present?
        begin
          browser_helper.click print_button, "print_button"
          sleep(2)
        rescue
          #ignore
        end
      }
      printer_window.print_options *args
    end

    def add
      add_field.when_present.click
      3.times do
        Batch.order_id = order_id(1)
        unless Batch.order_id.size == 0
          break
        end
      end
    end

    def wait_until_present
      add_field.wait_until_present
    end

    def present?
      browser_helper.field_present?  add_field
    end
  end

end