module Stamps
  module Navigation
    class TransactionComplete < Browser::StampsModal
      attr_reader :window_title, :textarea, :ok_btn

      def initialize(param)
        super
        @window_title = StampsElement.new browser.div(text: "Transaction Complete")
        @textarea = StampsElement.new browser.div(css: "div[componentid^=dialoguemodal-]>div[id$=body]>div>div")
        @ok_btn = StampsElement.new(browser.span(css: "div[id^=panel-][id$=-innerCt]>a>span>span>span[id$=btnInnerEl]"))
      end

      def wait_until_present(*args)
        window_title.wait_until_present(*args)
      end

      def present?
        window_title.present?
      end

      def text
        textarea.text
      end

      def ok
        ok_btn.click_while_present
      end
    end

    class ConfirmTransaction < Browser::StampsModal
      attr_reader :window_title, :transaction_complete, :confirm_btn

      def initialize(param)
        super
        @window_title = StampsElement.new browser.div(text: 'Confirm Transaction')
        @confirm_btn = StampsElement.new browser.span(text: "Confirm")
        @transaction_complete = TransactionComplete.new(param)
      end

      def exit
        StampsElement.new(browser.imgs(class: "x-tool-img x-tool-close").last).click_while_present
      end

      def present?
        window_title.present?
      end

      def wait_until_present(*args)
        window_title.wait_until_present(*args)
      end

      def textarea
        if param.web_app == :orders
          div = browser.div(class: 'sdc-dialoguemodal-confirm-purchase')
        elsif param.web_app == :mail
          div = browser.divs(css: "div[id^=dialoguemodal-][id$=-innerCt]").last
        else
          expect("Purchase Button failure. #{param.web_app} is not a valid value for param.web_app, check your test.").to eql "Invalid Value"
        end
        StampsElement.new div
      end

      def text
        textarea.text
      end

      def confirm
        10.times do
          return transaction_complete if transaction_complete.present?
          confirm_btn.click
          transaction_complete.wait_until_present 6
        end
        expect("Unable to click Confirm button on Confirm Transaction modal!").to eql "Confirm Transaction Modal"
      end
    end

    class MinimumPurchaseAmountNotice < Browser::StampsModal
      def present?

      end

      def text

      end

      def ok

      end
    end

    class AccountBalanceLimit < Browser::StampsModal
      attr_reader :body, :window_title

      def initialize(param)
        super
        @body = StampsElement.new(browser.div(css: "div[id^=dialoguemodal-][id$=-body]>div>div[id^=dialoguemodal-][id$=-innerCt]"))
        @window_title = StampsElement.new(browser.div(text: "Account Balance Limit"))
      end

      def present?
        window_title.present?
      end

      def text
        body.text
      end
    end

    class AutoBuyPostageModal < Browser::StampsModal
      attr_reader :window_title

      def initialize(param)
        super
        @window_title = StampsElement.new(browser.div(text: "Add Funds"))
      end

      def present?
        window_title.present?
      end
    end

    class AddFundsModal < Browser::StampsModal
      attr_reader :confirm_transaction, :auto_add_funds_modal, :auto_buy_postage_link, :window_title, :account_balance_limit

      def initialize(param)
        super
        @confirm_transaction = ConfirmTransaction.new(param)
        @auto_add_funds_modal = AutoBuyPostageModal.new(param)
        @auto_buy_postage_link = StampsElement.new browser.span(text: "Auto-buy postage")
        @window_title = browser.div(text: "Add Funds")
        @account_balance_limit = AccountBalanceLimit.new(param)
      end

      def auto_buy_postage
        10.times do
          auto_buy_postage_link.click
          return auto_add_funds_modal if auto_add_funds_modal.present?
        end
        expect("Auto-Buy Postage modal did not open.").to eql "Unable to open Auto-Buy Postage modal upon clicking Auto-buy postage link"
      end

      def purchase_button
        if param.web_app == :orders
          button = browser.span(id: "sdc-purchasewin-purchasebtn-btnInnerEl")
        elsif param.web_app == :mail
          button = browser.span(id: "sdc-purchasewin-purchasebtn-btnIconEl")
        else
          "raise Purchase Button failure. #{param.web_app} is not a valid value for param.web_app, check your test."
        end
        StampsElement.new button
      end

      def present?
        window_title.present?
      end

      def buy_10
        param.web_app.should_not be nil
        if param.web_app == :orders
          checkbox_element = browser.label(css: "label[for=sdc-purchasewin-10dradio][id$=boxLabelEl]")
          verify_element = checkbox_element.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          StampsRadio.new checkbox_element, verify_element, attribute, verify_element_attrib
        elsif param.web_app == :mail
          checkbox_element = browser.input(id: "sdc-purchasewin-10dradio")
          verify_element = checkbox_element.parent.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          StampsRadio.new checkbox_element, verify_element, attribute, verify_element_attrib

        else
          #
        end
      end

      def buy_25
        if param.web_app == :orders
          checkbox_element = browser.label(css: "label[for=sdc-purchasewin-25dradio][id$=boxLabelEl]")
          verify_element = checkbox_element.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          StampsRadio.new checkbox_element, verify_element, attribute, verify_element_attrib
        elsif param.web_app == :mail
          checkbox_element = browser.input id: "sdc-purchasewin-25dradio"
          verify_element = checkbox_element.parent.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          StampsRadio.new checkbox_element, verify_element, attribute, verify_element_attrib
        else
          "raise Purchase Button failure. #{param.web_app} is not a valid value for param.web_app, check your test."
        end

      end

      def buy_50
        if param.web_app == :orders
          checkbox_element = browser.label(css: "label[for=sdc-purchasewin-50dradio][id$=boxLabelEl]")
          verify_element = checkbox_element.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          StampsRadio.new checkbox_element, verify_element, attribute, verify_element_attrib
        elsif param.web_app == :mail
          checkbox_element = browser.input id: "sdc-purchasewin-50dradio"
          verify_element = checkbox_element.parent.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          StampsRadio.new checkbox_element, verify_element, attribute, verify_element_attrib
        else
          "raise Purchase Button failure. #{param.web_app} is not a valid value for param.web_app, check your test."
        end
      end

      def buy_100
        if param.web_app == :orders
          checkbox_element = browser.label(css: "label[for=sdc-purchasewin-100dradio][id$=boxLabelEl]")
          verify_element = checkbox_element.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          StampsRadio.new checkbox_element, verify_element, attribute, verify_element_attrib
        elsif param.web_app == :mail
          checkbox_element = browser.input id: "sdc-purchasewin-100dradio"
          verify_element = checkbox_element.parent.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          StampsRadio.new checkbox_element, verify_element, attribute, verify_element_attrib
        else
          "raise Purchase Button failure. #{param.web_app} is not a valid value for param.web_app, check your test."
        end
      end

      def buy_other value
        if param.web_app == :orders
          checkbox_element = browser.label(css: "label[for=sdc-purchasewin-otherdradio][id$=boxLabelEl]")
          verify_element = checkbox_element.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          checkbox = StampsRadio.new checkbox_element, verify_element, attribute, verify_element_attrib
        elsif param.web_app == :mail
          checkbox_element = browser.input id: "sdc-purchasewin-otherdradio"
          verify_element = checkbox_element.parent.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          checkbox = StampsRadio.new checkbox_element, verify_element, attribute, verify_element_attrib
        else
          "raise Purchase Button failure. #{param.web_app} is not a valid value for param.web_app, check your test."
        end

        textbox = StampsTextBox.new(browser.text_field id: "sdc-purchasewin-otheramount")

        checkbox.select
        textbox.set(value)
      end

      def purchase
        return confirm_transaction if confirm_transaction.present?
        10.times do
          return confirm_transaction if confirm_transaction.present?
          purchase_button.click
          confirm_transaction.wait_until_present 5
          expect("#{account_balance_limit.window_title.text}:  #{account_balance_limit.text}").to eql "Confirm Transaction Modal" if account_balance_limit.present?
        end
      end

      def edit_payment_method
        expect("Edit Payment Method is not yet implemented.").to eql ""
      end

      def autobuy
        expect("AutoBuy is not implemented").to eql ""
      end
    end

    class BalanceDropDown < Browser::StampsModal
      attr_reader :add_funds_modal, :buy_more_dropdown, :buy_more_link, :view_history_link, :balance_element

      def initialize(param)
        super
        @add_funds_modal = AddFundsModal.new(param)
        @buy_more_dropdown = StampsElement.new(browser.span(class: "balanceLabel"))
        @buy_more_link = StampsElement.new(browser.a(text: "Buy More"))
        @view_history_link = StampsElement.new(browser.a(text: "View Purchase History"))
        @balance_element = StampsElement.new(browser.span(id: 'postageBalanceAmt'))
      end

      def buy_more
        20.times do
          return add_funds_modal if add_funds_modal.present?
          buy_more_dropdown.element.hover
          buy_more_dropdown.click unless buy_more_link.present?
          buy_more_dropdown.element.hover
          buy_more_link.click
          return add_funds_modal if add_funds_modal.present?
        end
        expect("Unable to open Buy Postage Modal").to eql "buy_more failed"
      end

      def purchase_history
        2.times do
          buy_more_dropdown.element.hover
          buy_more_dropdown.click unless view_history_link.present?
          buy_more_dropdown.element.hover
          view_history_link.click
        end
      end

      def amount
        10.times do
          amount = balance_element.text
          amount_no_dollar_sign = amount.gsub("$","")
          amount_stripped_all = amount_no_dollar_sign.gsub(",","")
          return amount_stripped_all.to_f.round(2) if amount_stripped_all.length > 0
        end
      end

      def new_balance old_balance
        10.times do
          balance = (test_helper.remove_dollar_sign(balance_element.text).gsub(',', '').to_f.round(2)).to_s
          break unless balance.include? old_balance.to_s
          sleep(0.35)
        end
        (test_helper.remove_dollar_sign(balance_element.text).gsub(',', '').to_f.round(2)).to_s
      end
    end

    class UsernameDropDown < Browser::StampsModal
      attr_reader :username, :sign_out_link

      def initialize(param)
        super
        @username = StampsElement.new(browser.span id: 'userNameText')
        @sign_out_link = StampsElement.new(browser.a(text: "Sign Out"))
      end

      def present?
        username.present?
      end

      def wait_until_present(*args)
        username.wait_until_present(*args)
      end

      def text
        username.text
      end

      def manage_account

      end

      def home

      end

      def sign_out
        5.times do
          sleep(0.35)
          username.click unless sign_out_link.present?
          username.hover
          sign_out_link.click if sign_out_link.present?
          sleep(0.35)
          return if browser.url.include? "SignIn"
        end
      end
    end

    class NavigationBar < Browser::StampsModal
      attr_reader :balance, :username, :sign_out_link, :signed_in_username, :orders_link, :mail_link, :web_mail, :web_orders

      def initialize(param)
        super
        @balance = BalanceDropDown.new(param)
        @username = UsernameDropDown.new(param)
        @sign_out_link = StampsElement.new(browser.link(id: "signOutLink"))
        @signed_in_username = StampsElement.new(browser.span(id: 'userNameText'))
        @orders_link = StampsElement.new(browser.a(text: 'Orders'))
        @mail_link = StampsElement.new(browser.a(text: 'Mail'))
      end

      def orders
        10.times do
          orders_link.click
          web_orders.wait_until_present(8)
          return web_orders if grid.present?
        end
      end

      def mail
        10.times do
          mail_link.click
          web_mail.wait_until_present(8)
          return web_mail if grid.present?
        end
      end

      def sign_out
        20.times do
          begin
            signed_in_username.click unless sign_out_link.present?
            sign_out_link.click
            sign_out_link.click
            signed_in_username.click unless sign_out_link.present?
            sign_out_link.click
            sleep(0.35)
            sign_out_link.click
            break unless signed_in_username.present?
          rescue
            #ignore
          end
        end
        logger.info "#{ENV["SIGNED_IN_USER"]}#{(signed_in_username.present?)?" - sign-out failed":" was signed out.  Goodbye."}"
      end

      def wait_until_present(*args)
        username.wait_until_present(*args)
      end

      def present?
        username.present?
      end

    end
  end
end