module Stamps
  module Orders

    class ServerError < Browser::Modal
      def present?
        (browser.divs(text: "Server Error").last).present?
      end

      def message
        logger.info "Server Error"
        element_helper.text browser.divs(css: "div[id^=dialoguemodal-][id$=-body][class*=sdc-warning]>div>div").last
      end

      def ok
        20.times do
          button = browser.spans(text: "OK").last
          element_helper.safe_click button
          element_helper.safe_click button
          sleep(0.35)
          break unless present?
        end
      end

    end

    class PrintingError < StandardError
      attr_reader :object

      def initialize(object)
        @object = object
      end
    end

    class OrderError < Browser::Modal

      protected

      def window_title
        browser.div text: 'Order Error'
      end

      def ok_button_span
        browser.span text: 'OK'
      end

      def error_message_label
        browser.div css: "div[class='x-autocontainer-innerCt'][id^=dialoguemodal]"
      end

      public

      def present?
        window_title.present?
      end

      def ok
        5.times {
          begin
            element_helper.safe_click ok_button_span
            break unless ok_button_span.present?
          rescue
            #ignore
          end
        }
      end

      def error_message
        error_message = element_helper.text error_message_label

        logger.info "----  Order Errors  ----"
        logger.info error_message
        logger.info "----  Order Errors  ----"

        error_message
      end

    end

    class IncompleteOrderError < Browser::Modal
      private

      def error_message_label
        browser.div css: "div[class='x-autocontainer-innerCt'][id^=dialoguemodal]"
      end

      def window_title
        order_errors = browser.div text: 'Order Errors'
        order_error = browser.div text: 'Order Error'
        if order_errors.present?
          order_errors
        elsif order_error.present?
          order_error
        else
          nil
        end
      end

      def cancel_button
        browser.span text: "Cancel"
      end

      def ok
        ok_btn = StampsElement.new browser.span(text: "OK")
        10.times{
          ok_btn.safe_click
          break unless ok_btn.present?
        }
      end

      def error_message
        element_helper.text browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]")
      end

      def present?
        browser.div(text: "Incomplete Order").present?
      end

      def continue
        5.times{
          begin
            element_helper.safe_click continue_button
            break unless continue_button.present?
          rescue
            #ignore
          end
        }
        PrintModal.new(param)
      end

      def cancel
        5.times{
          begin
            element_helper.safe_click cancel_button
            break unless cancel_button.present?
          rescue
            #ignore
          end
        }
      end

      def close_window
        5.times{
          element_helper.safe_click window_title
          brea
        }
      end

    end

    class RatingError < Browser::Modal
      private
      def rating_error_p
        browser.p css: 'div[class=x-autocontainer-innerCt]>p:nth-child(1)'
      end

      def ok_button
        browser.span text: 'OK'
      end

      public
      def wait_until_present
        begin
          ok_button.wait_until_present
        rescue
          #ignore
        end
        self
      end

      def present?
        ok_button.present?
      end

      def OK
        logger.info "----  Rating Error  ----"
        logger.info element_helper.text rating_error_p
        logger.info "----  Rating Error  ----"
        5.times {
          element_helper.safe_click ok_button
          break unless present?
        }
      end

      def error_message
        element_helper.text rating_error_p
      end

    end
  end
end