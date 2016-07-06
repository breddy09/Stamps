module Stamps
  module Browser
    class ModalParam
      attr_accessor :browser, :logger, :scenario_name
    end

    # A modal is a window composed of buttons, labels, text boxes, drop-downs, links, inputs, etc
    class Modal
      attr_accessor :param, :browser, :logger, :scenario_name, :browser_helper
      def initialize param
        raise "Illegal Parameter Exception. Expecting #{ModalParam.class}, got #{param.class}" unless param.is_a? ModalParam
        @param = param
        @browser = param.browser
        @logger = param.logger
        @scenario_name = param.scenario_name
        @browser_helper = BrowserHelper
      end

      def stop_test message
        logger.fatal message
        logger.fatal "Teardown: Begin tearing down test"
        TestHelper.teardown
        logger.fatal "Teardown: Done!"
        raise message
      end
    end

    # A Browser Element are elements found on a browser page. Buttons, text boxes, links, labels are examples of a browser element.
    class BrowserElement
      attr_reader :browser, :browser_helper, :element, :error_qtip_element, :error_qtip_element_attribute
      def initialize *args
        case args.length
          when 1
            @element = args[0]
          when 2 #use this when data error qtip is found in the element
            @element = args[0]
            @error_qtip_element_attribute = args[1]
          when 3 # use this when data error qtip is in a another element
            @element = args[0]
            @error_qtip_element = args[1]
            @error_qtip_element_attribute = args[2]
          else
            stop_test "Illegal number of arguments.  Unable to create element."
        end
        @browser = @element.browser
        @browser_helper = BrowserHelper
      end

      def url
        stop_test "url is not yet implemented"
      end

      def disabled?
        begin
          element.disabled?
        rescue
          false
        end
      end

      def exist?
        begin
          element.exist?
        rescue
          false
        end
      end

      def present?
        begin
          element.present?
        rescue
          false
        end
      end

      def visible?
        begin
          element.visible?
        rescue
          false
        end
      end

      def enabled?
        begin
          element.enabled?
        rescue
          false
        end
      end

      def hover
        element.hover
      end

      def data_error_qtip
        begin
          # if data qtip element was not set or is nil, try to get data error qtip from the element representing this textbox.
          if error_qtip_element.nil?
            return browser_helper.attribute_value element, (error_qtip_element_attribute.nil?)?"data-errorqtip":error_qtip_element_attribute
          else
            return browser_helper.attribute_value error_qtip_element, (error_qtip_element_attribute.nil?)?"data-errorqtip":error_qtip_element_attribute
          end
        rescue
          #if data error element does not exist, return an empty string
          return ""
        end
      end

      def attribute_enabled?
        browser_helper.attribute_enabled? element
      end

      def data_error
        browser_helper.attribute_value element, "data-errorqtip"
      end

      def scroll_into_view
        begin
          browser.execute_script('arguments[0].scrollIntoView();', element)
        rescue
          # ignore
        end
      end

      def safe_scroll_into_view
        begin
          scroll_into_view
        rescue
          #ignore
        end
      end

      def attribute_value *args
        case args.length
          when 1
            #fetch the attribute value of this element using specified name
            attribute_name = args[0]
            browser_helper.attribute_value element, attribute_name
          when 2
            attribute_name = args[0]
            value = args[1]
            browser_helper.attribute_value element, attribute_name, value
          else
            raise "Illegal number of arguments for attribute_value. Pass 1 argument to get the value of that element or pass 2 arguments to set the value of that element"
        end
      end

      def placeholder
        attribute_value "placeholder"
      end

      def style property
        browser_helper.style property
      end

      def wait_while_present
        browser_helper.wait_while_present @element
      end

      def wait_until_present
        browser_helper.wait_until_present @element
      end

      def click
        browser_helper.click @element
      end

      def safe_click
        browser_helper.safe_click @element
      end

      def double_click
        browser_helper.double_click @element
      end

      def safe_double_click
        browser_helper.safe_double_click @element
      end

      def click_while_present
        20.times{
          safe_click
          break unless present?
        }
      end

      def safe_send_keys special_char
        begin
          send_keys special_char
        rescue
          #ignore
        end
      end

      def send_keys special_char
        browser_helper.send_keys element, special_char
      end

      def text
        txt = browser_helper.text element
        val = browser_helper.attribute_value element, "value"
        (txt.size>0)?txt:val
      end
    end

    class BrowserSelection < BrowserElement
      attr_accessor :verify_element, :attribute, :verify_element_attrib
      def initialize element, verify_element, attribute, verify_element_attrib
        super element
        @verify_element = verify_element
        @attribute = attribute
        @verify_element_attrib = verify_element_attrib
      end

      def select
        10.times{
          break if selected?
          click
        }
      end

      def selected?
        begin
          attribute_value_str = browser_helper.attribute_value verify_element, attribute
          return attribute_value_str == "true" if attribute_value_str == "true" || attribute_value_str == "false"
          return attribute_value_str.include? verify_element_attrib
        rescue
          false
        end
      end
    end

    class BrowserCheckbox < BrowserElement
      attr_accessor :verify_element, :attribute, :attribute_value
      def initialize element, verify_element, attribute, attribute_value
        super element
        @verify_element = verify_element
        @attribute = attribute
        @attribute_value = attribute_value
      end

      def check
        5.times{
          break if checked?
          safe_click
        }
      end

      def uncheck
        if checked?
          5.times{
            safe_click
            break unless checked?
          }
        end
      end

      def checked?
        begin
          actual_attribute_value = browser_helper.attribute_value verify_element, attribute
          if actual_attribute_value == "true" || actual_attribute_value == "false"
            return actual_attribute_value == "true"
          else
            actual_attribute_value.include? attribute_value
          end
        rescue
          false
        end
      end
    end

    class BrowserTextBox < BrowserElement
      #todo FIX ME!
      def set text
        15.times do
          begin
            attribute_value "value", ""
            browser_helper.set element, ""

            # set element text normally
            browser_helper.set element, text
            text_value = browser_helper.text element
            break if text_value==text

            # set element attribute value
            attribute_value "value", text
            text_value = browser_helper.text element
            break if text_value==text
          rescue
            #ignore
          end
        end
        self
      end

      def safe_set text
        begin
          set text
        rescue
          #ignore
        end
      end

      def set_until text
        set text
      end
    end

    class BrowserDropdown < BrowserElement
      def initialize browser, dd, html_tag_symbol, input
        super browser
        @drop_down = dd
        @html_tag_symbol = html_tag_symbol
        @input = input
      end

      def drop_down_caret
        BrowserElement.new @drop_down
      end

      def text_box
        BrowserTextBox.new @input
      end

      def select selection
        case selection
          when String
            5.times{
              selection_element = expose_selection selection
              browser_helper.safe_click selection_element
              input_text = text_box.text
              break if input_text.include? selection
            }
          else
            2.times {
              selection_element = expose_selection selection
              browser_helper.safe_click selection_element
            }
        end
      end

      def selection_element selection
        case selection
          when String
            # Selection passed is String object.
            case @html_tag_symbol
              when :li
                return browser.li :text => selection
              else
                stop_test "Unsupported HTML drop-down selection tag #{@html_tag_symbol}"
            end
          else
            return selection
        end
      end

      def expose_selection selection
        @verify_element_attrib = selection_element selection
        5.times{
          browser_helper.safe_click @drop_down, "drop-down"
          #logger.info "Selection is present? #{browser_helper.present? @selection_element}"
          return @verify_element_attrib if browser_helper.present? @verify_element_attrib
        }
      end

      def selection operation, selection
        case operation.downcase
          when :element
            return BrowserElement.new (expose_selection selection)
          when :tooltip
            selection_element = expose_selection selection
            tooltip = browser_helper.attribute_value selection_element, "data-qtip"
            #logger.info "element Selection Tooltip (data-qtip):  #{tooltip}"
            tooltip
          else
            #do nothing
        end
      end
    end

    class BrowserHelper
      class << self
        def style element, var_name
          begin
            style = element.style(var_name)
            #logger.info "element Style:  #{style}"
            return style
          rescue
            #
          end
          nil
        end

        def attribute_enabled? *args
          case args.length
            when 1
              element = args[0]
              element_attribute = "class"
              search_string = "enabled"
            when 3
              element = args[0]
              element_attribute = args[1]
              search_string = args[2]
            else
              stop_test "Wrong number of arguments for enabled?"
          end
          attribute_value = attribute_value element, element_attribute
          attribute_value.include? search_string
        end

        def attribute_value *args

          case args.length
            when 2
              # get the value of an attribute
              element = args[0]
              attribute_name = args[1]
              begin
                element.attribute_value attribute_name
              rescue
                ""
              end
            when 3
              # set the value of an attribute
              element = args[0]
              attribute_name = args[1]
              value = args[2]
              script = "return arguments[0].#{attribute_name} = '#{value}'"
              element.browser.execute_script(script, element)
            else
              raise "Illegal number of arguments for attribute_value.  Check your TestHelper."
          end
        end

        def drop_down browser, drop_down_button, selection_element_type, drop_down_input, selection
          dd = BrowserDropdown.new browser, drop_down_button, selection_element_type, drop_down_input
          dd.select selection
        end

        def text *args
          case args.length
            when 1
              element_text args[0]
            when 2
              element_text args[0]
            #logger.browser_element args[0], text, args[1]
            else
              stop_test "Wrong number of arguments for BrowserHelper.text method."
          end
        end

        def text=(*args)
          set args
        end

        def send_keys *args
          case args.length
            when 2
              element = args[0]
              text = args[1]
              element_name = ""
            when 3
              element = args[0]
              text = args[1]
              element_name = args[2]
            else
              stop_test "Wrong number of arguments for BrowserHelper.set_text method."
          end
          2.times do
            begin
              element.send_keys text
            rescue
              #ignore
            end
          end
        end

        def set *args
          case args.length
            when 2
              element = args[0]
              text = args[1]
              element_name = ""
            when 3
              element = args[0]
              text = args[1]
              element_name = args[2]
            else
              stop_test "Wrong number of arguments for BrowserHelper.set_text method."
          end

          5.times do
            begin
              element.focus
              element.clear
              element.set text
              actual_value =  element_text(element)
              break if (actual_value.to_s.include? text) || (text.to_s.include? actual_value)
            rescue
              #ignore
            end
          end
        end

        def element_text element
=begin
        begin
          element.focus
        rescue
          #ignore
        end
=end

          begin
            text = element.text
            return text if text.size > 0
          rescue
            #ignore
          end

          begin
            value = element.value
            return value if value.size > 0
          rescue
            #ignore
          end

          begin
            value = element.attribute_value 'value'
            return value if value.size > 0
          rescue
            #ignore
          end
          ""
        end

        def get_varname symb, the_binding
          var_name  = symb.to_s
          var_value = eval(var_name, the_binding)
          puts "#{var_name} = #{var_value.inspect}"
        end

        def safe_click *args
          begin
            click *args
          rescue
            #ignore
          end
        end

        def click *args
          case args.length
            when 1
              args[0].click

            when 2
              args[0].click
            else
              stop_test "Wrong number of arguments."
          end
        end

        def safe_double_click *args
          begin
            double_click *args
          rescue
            #ignore
          end
        end

        def double_click *args
          case args.length
            when 1
              begin
                args[0].focus
              rescue
                #logger.info "Unable to focus on browser element #{args[0]}"
              end

              args[0].double_click
            #var_name = get_varname :args[0],
            #log_browser_click args[0]

            when 2
              begin
                args[0].focus
              rescue
                #logger.info "Unable to focus on browser element #{args[1]} #{args[0]}"
              end
              args[0].double_click
              var_name = %w(args[0])
            #log_browser_click args[0], var_name
            else
              stop_test "Wrong number of arguments."
          end
        end

        def wait_until_present *args
          case args.length
            when 1
              begin
                args[0].wait_until_present
                true
              rescue
                false
              end
            when 2
              begin
                args[0].wait_until_present args[1].to_i
              rescue
                false
              end
            else
              stop_test "Illegal number of arguments for BrowserHelper.wait_until_present"
          end
        end

        def wait_while_present *args
          case args.length
            when 1
              begin
                args[0].wait_while_present
                true
              rescue
                false
              end
            else
              stop_test "Illegal number of arguments for BrowserHelper.wait_until_present"
          end
        end

        def present? element
          begin
            element.present?
          rescue
            return false
          end
        end

        def disabled? *args
          case args.length
            when 1
              @disabled_element = args[0]
              @element_attribute = "class"
              @search_string = "disabled"
            when 3
              @disabled_element = args[0]
              @element_attribute = args[1]
              @search_string = args[2]
            else
              stop_test "Wrong number of arguments for enabled?"
          end
          attribute_value = attribute_value @disabled_element, @element_attribute
          disabled = attribute_value.include? @search_string

          #logger.info "element disabled? #{disabled}"
          disabled
        end

        def exist? element
          begin
            element.exist?
          rescue
            return false
          end
        end

        def visible? element
          begin
            element.visible?
          rescue
            return false
          end
        end

        def enabled? element
          begin
            element.enabled?
          rescue
            return false
          end
        end

        def hover element
          begin
            element.hover
          rescue
            #ignore
          end
        end

      end
    end
  end
end
