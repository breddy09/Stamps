module Stamps
  module Windows
    class OpenFile
      attr_accessor :browser_selection

      def initialize
        @browser_selection = BrowserSelection.new
      end

      def present?
        begin
          if browser_selection.firefox?
            exist = RAutomation::Window.new(:title => /File Upload/i).exists?
            return exist
          elsif browser_selection.chrome?
            exist = RAutomation::Window.new(:title => /&Open/i).exists?
            return exist
          else
            expect("Invalid browser selection.  #{@browser_type} is not recognized.  User :firefox, :chrome or :ie").to eql ""
          end
        rescue
          false
        end
      end

      def wait_until_present
        5.times do
          break if present?
          sleep(0.35)
        end
      end

      def file_name filename
        if browser_selection.firefox?
          print_window = RAutomation::Window.new(:title => /File Upload/i)
          wait_until_present
          expect("Print Window is not open").to eql "" unless present?
          print_window.activate

          print_window.text_field(class: "Edit", :index => 0).set filename

          print_window.button(:value => "&Open").click

          #todo fix TestHelper.browser
        elsif browser_selection.chrome?
          print_window = RAutomation::Window.new(:title => /&Open/i)
          wait_until_present
          expect("Print Window is not open").to eql "" unless present?
          print_window.activate
          print_window.button(:value => "&Open").click
        else
          expect("Invalid browser selection.  #{@browser_type} is not recognized.  User :firefox, :chrome or :ie").to eql ""
        end
      end
    end
  end
end