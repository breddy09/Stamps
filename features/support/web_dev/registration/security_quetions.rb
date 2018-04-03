module Stamps
  module Registration
    class SecurityFirstQuestion < WebApps::Base

      def drop_down
        @drop_down ||= StampsField.new(driver.span(css: "button[title*='1ST QUESTION']>span[class*=filter-option]")) if @drop_down.nil?||!@drop_down.present?
        @drop_down
      end

      def select(str)
        drop_down.click
        selection=StampsField.new(driver.spans(text: str).first)
         5.times do
            drop_down.click unless selection.present?
            selection.scroll_into_view
            selection.click
        end
      end

      def first_answer
        @first_answer ||= StampsTextbox.new(driver.text_field(id: 'secretAnswer1')) if @first_answer.nil?||!@first_answer.present?
        @first_answer
      end
    end

    class SecuritySecondQuestion < WebApps::Base
      def drop_down
        @drop_down ||= StampsField.new(driver.span(css: "button[title*='2ND QUESTION']>span[class*=filter-option]")) if @drop_down.nil?||!@drop_down.present?
        @drop_down
      end

      def select(str)
        drop_down.click
        selection=StampsField.new(driver.spans(text: str).last)
         5.times do
           drop_down.click unless selection.present?
           selection.scroll_into_view
           selection.click
        end
      end

      def second_answer
        @second_answer ||= StampsTextbox.new(driver.text_field(id: 'secretAnswer2')) if @second_answer.nil?||!@second_answer.present?
        @second_answer
      end
    end

    class SecurityQuestionsRegistration < WebApps::Base

      def first_question
        @first_question=SecurityFirstQuestion.new(param) if @first_question.nil?||!@first_question.present?
        @first_question
      end

      def second_question
        @second_question=SecuritySecondQuestion.new(param) if @second_question.nil?||!@second_question.present?
        @second_question
      end

      def get_started
        @get_started=StampsField.new(driver.button(id: "li[id=pagination]>div>div>button[id=startPrinting]")) if @get_started.nil?||!@get_started.present?
        @get_started
      end
    end
  end
end


