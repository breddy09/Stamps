# encoding: utf-8
module Stamps
  module Mail
=begin

    class RollFormView < PrintForm
      def preview_image
        image = StampsElement.new browser.img css: "dimg[src*='Labelsample.gif']"
      end

      def hide_postage_value
        checkbox_field = browser.text_field css: "input[id=hidePostageCheckbox]"
        verify_fields = browser.inputs css: "table[id^=checkboxfield][class*=x-form-type-checkbox]"
        verify_field = verify_fields[5]

        Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
      end

      def print_reference_number
        checkbox_field = browser.text_field css: "input[id=printreferencecheckbox]"
        verify_fields = browser.inputs css: "table[id^=checkboxfield][class*=x-form-type-checkbox]"
        verify_field = verify_fields[6]

        Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
      end

      def reference_number
        StampsTextBox.new browser.text_field name: "referenceNumber"
      end

      def cost_code
        CostCode.new(param)
      end
    end

    class Rolls < PrintForm
      def insure_for
        DetailsInsureFor.new(param)
      end

      def ship_date
        ShipDate.new(param)
      end

      def form_view
        RollFormView.new(param)
      end
    end
=end
  end
end