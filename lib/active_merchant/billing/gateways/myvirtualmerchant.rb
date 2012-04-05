module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    class MyvirtualmerchantGateway < Gateway
      # To obtain credentials, contact
      # internetproductsupport@merchantconnect.com
      # or call 1-800-377-3962
      TEST_URL = 'https://example.com/test'
      LIVE_URL = 'https://example.com/live'

      # The countries the gateway supports merchants from as 2 digit ISO country codes
      self.supported_countries = ['US']

      # The card types supported by the payment gateway
      self.supported_cardtypes = [:visa, :master, :american_express, :discover]

      # The homepage URL of the gateway
      self.homepage_url = 'http://www.example.net/'

      # The name of the gateway
      self.display_name = 'New Gateway'

      def initialize(options = {})
        #requires!(options, :login, :password)
        @options = options
        super
      end

      # Options requested by MyVirtualMerchant
      # AVS Data, CVV2/CVX/CID, Invoice number, Card Present Indicator
      # Level II data requested: Customer Code, Sales Tax
      #
      # We will also need to keep track of the transaction id, as that
      # is the key used by MyVirtualMerchant for retrieving information
      # (value is ssl_txn_id)
      def authorize(money, creditcard, options = {})
        post = {}
        add_invoice(post, options)
        add_creditcard(post, creditcard)
        add_address(post, creditcard, options)
        add_customer_data(post, options)

        commit('authonly', money, post)
      end

      def purchase(money, creditcard, options = {})
        post = {}
        add_invoice(post, options)
        add_creditcard(post, creditcard)
        add_address(post, creditcard, options)
        add_customer_data(post, options)

        commit('sale', money, post)
      end

      def capture(money, authorization, options = {})
        commit('capture', money, post)
      end

      private

      def add_customer_data(post, options)
      end

      def add_address(post, creditcard, options)
      end

      def add_invoice(post, options)
      end

      def add_creditcard(post, creditcard)
      end

      def parse(body)
      end

      # We need to set ssl_show_form to false in order to hide
      # the payment form.
      def commit(action, money, parameters)
      end

      def message_from(response)
      end

      def post_data(action, parameters = {})
      end
    end
  end
end

