# encoding: utf-8
module Stamps
  module Mail
    module PrintModal
      class MailConfirmPrint < Browser::Base
        attr_accessor :window_title, :do_not_prompt, :continue_btn

        def initialize(param)
          super
          @window_title = StampsField.new(browser.div(text: "Confirm Print"))
          @continue_btn = StampsField.new(browser.span(text: "Continue"))
          @do_not_prompt = StampsCheckbox.new browser.span(css: "div[id^=dialoguemodal-][id$=-targetEl]>div>div>div>span"),
                                              browser.div(css: "div[id^=dialoguemodal-][id$=-targetEl]>div[class*=checkbox]"), "class", "checked"
        end

        def present?
          window_title.present?
        end

        def wait_until_present(*args)
          window_title.wait_until_present(*args)
        end

        def continue
          10.times do
            continue_btn.click
            sleep(0.125)
            break unless collapse_button.present?
          end
        end
      end

      class PleaseWait < Browser::Base
        attr_accessor :window_title, :paragraph, :ok_btn

        def initialize(param)
          super
          @window_title = StampsField.new(browser.div(text: "Please Wait"))
          @paragraph = StampsField.new(browser.div(css: "div[class*=resizable]>div[id^=dialoguemodal-][id$=-body]>div>div"))
          @ok_btn = StampsField.new(browser.span(text: "OK"))
        end

        def present?
          window_title.present?
        end

        def ok
          10.times do
            ok_btn.click
            break unless present?
          end
        end
      end
    end
  end
end

