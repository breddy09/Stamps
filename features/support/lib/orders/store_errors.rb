module Stamps
  module Orders
    module Stores
      class ServerError < Browser::Modal
        def present?
          browser.div(text: "Server Error").present?
        end

        def message
          element_helper.text browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]")
        end

        def ok
          button = BrowserElement.new browser.span(text: 'OK')
          button.click_while_present
        end
      end
    end
  end
end