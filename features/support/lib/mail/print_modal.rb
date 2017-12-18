# encoding: utf-8
module Stamps
  module Mail
    module PrintModal
      class InstallStampsConnect < Browser::Base
        def window_title
          StampsField.new(browser.divs(text: 'Install Stamps.com Connect').first)
        end

        def present?
          window_title.present?
        end

        def body
          StampsField.new(browser.div(css: "[class*=x-window-default-closable] [id^=dialoguemodal-][class=x-autocontainer-innerCt]"))
        end

        def install_stamps_connect

        end
      end

      class MailPrinterComboBox < Browser::Base
        def dropdown
          @dropdown=StampsField.new(browser.div(css: "[id^=printwindow-] [class*=x-form-arrow-trigger-default]")) if @dropdown.nil?||!@dropdown.present?
          @dropdown
        end

        def textbox
          @textbox=StampsTextbox.new(browser.text_field(name: "printers")) if @textbox.nil?||!@textbox.present?
          @textbox
        end

        def present?
          textbox.present?
        end

        # /\\.+\.*/ =~ str, this will check str pattern
        def select_printer(str)
          selected_printer=StampsField.new(browser.li(css: "div[id*=boundlist][class*='x-boundlist-default'][data-savedtabindex-ext-field-1='0'] li[class*='x-boundlist-item x-boundlist-selected']"))
          partial_printer_name=(str.include?('\\'))? /\\\\(.+)\\/.match(str)[1] : str
          5.times do
            return textbox.text if textbox.text.include?(partial_printer_name)
            selection=StampsField.new(browser.li(text: /#{partial_printer_name}/))
            dropdown.click unless selected_printer.present?
            return false if selected_printer.present? && !selection.present?
            selection.click
            return textbox.text if textbox.text.include?(partial_printer_name)
          end
          false
        end
      end

      class MailPaperTrayComboBox < Browser::Base
        attr_accessor :dropdown, :textbox

        def initialize(param)
          super
          @textbox=StampsTextbox.new(browser.input(name: "paperTrays"))
          @dropdown=StampsField.new(browser.div(css: "div[class*='x-vbox-form-item']>div>div>div[id$=-trigger-picker]"))
        end

        def select(str)
          selection_label=StampsField.new(browser.li(text: str))
          10.times do
            dropdown.click unless selection_label.present?
            selection_label.click
            sleep(0.15)
            break if textbox.text.include?(str)
          end
        end
      end

      class MailPrintModal < Browser::Base
        attr_accessor :paper_tray, :mail_printer, :print_button, :reprint_link

        def initialize(param)
          super
          @mail_printer=MailPrinterComboBox.new(param)
          @paper_tray=MailPaperTrayComboBox.new(param)
          @print_button=StampsField.new(browser.span(id: 'sdc-printwin-printbtn-btnInnerEl'))
          @reprint_link=StampsField.new(browser.a(text: 'Reprint'))
        end

        def window_title
          StampsField.new(browser.div(text: "Print"))
        end

        def present?
          window_title.present?
        end

        def wait_until_present(*args)
          window_title.wait_until_present(*args)
        end

        def print
          wait_until_present(8)
          expect(present?).to be(true), "Print button on Mail Print Modal is not present."
          5.times do
            print_button.click
            sleep(0.75)
            break unless print_button.present?
          end
          print_button.wait_while_present(8)
          expect(print_button.present?).to be(false), "Unable to click Print button on Mail Print Modal."
        end

        def print_expecting_rating_error
          RatingError.new(param).wait_until_present
        end

        def label_sheet_required_count
          browser.label(css: 'label[class*=label-sheets-requred]').text.gsub(/[^\d]/, '')
        end

        def title
          StampsField.new(browser.div(css: "div[id^=printwindow]>div[id^=title]>div[id^=title]")).text
        end

        def error_ok_button
          browser.span(text: 'OK')
        end

        def error_message
          StampsField.new(browser.div(css: 'div[class=x-autocontainer-outerCt][id^=dialoguemodal]>div[id^=dialoguemodal]')).text
        end

        def close
          begin
            x_button.click
          rescue
            #ignore
          end
        end

        def total_cost
          test_helper.dollar_amount_str(StampsField.new(browser.label(text: 'Total Cost:').parent.labels.last)).to_f.round(2)
        end

        def check_naws_plugin_error
          begin
            error_label=browser.div text: 'Error'
            if error_label.present?
              @printing_error=true
              ptags=browser.ps css: 'div[id^=dialoguemodal]>p'
              logger.info "-- Chrome NAWS Plugin Error --"
              ptags.each {|p_tag| logger.error "#{StampsField.new(p_tag).text}" if p_tag.present? }
              logger.info "-- Chrome NAWS Plugin Error --"
              if error_ok_button.present?
                error_message=self.error_message
                5.times {
                  error_ok_button.click
                  break unless error_ok_button.present?
                }
                close
              end
              close
            end
          rescue
            #ignore
          end
          @printing_error
        end

        def printing_error_check
          @printing_error=""
          incomplete_order_window=StampsField.new(browser.div text: "Incomplete Order")
          error_window=StampsField.new(browser.div text: "Error")
          ok_button=StampsField.new(browser.span text: 'OK')
          message_label=StampsField.new((browser.divs css: "div[id^=dialoguemodal][class=x-autocontainer-innerCt]").first)

          sleep(2)

          if error_window.present?||incomplete_order_window.present?
            window_text=error_window.text
            err_msg=message_label.text
            @printing_error="#{window_text} \n #{(err_msg)}"
            logger.info "Printing Error: \n#{@printing_error}"
          end

          if ok_button.present?
            logger.info "Error Window OK button"
            ok_button.click
            ok_button.click
            ok_button.click
          end
          @printing_error
        end

        def x_button
          browser.fields(css: 'img[class*=x-tool-close]').last
        end

        def printer_label
          browser.label text: 'Printer:'
        end

        def printer_field
          browser.text_field name: 'printers'
        end

        def paper_tray_field
          browser.text_field name: 'paperTrays'
        end
      end
    end
  end
end

