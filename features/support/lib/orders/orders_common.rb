module Stamps
  module Orders
    module Common
      module ServiceSelection
        ##
        # Persistent container
        class FloatingBoundList
          @@hash = {}
          class << self
            def set(key, val)
              @@hash[key.to_sym] = val
            end

            def get(key)
              @@hash[key.to_sym]
            end

            def has_key?(key)
              @@hash.has_key?(key.to_sym)
            end

            def keys
              @@hash.keys
            end

            def values
              @@hash.values
            end
          end

          def set(key, val)
            self.class.set(key, val)
          end

          def get(key)
            self.class.get(key)
          end

          def has_key?(key)
            self.class.has_key?(key.to_sym)
          end

          def keys
            self.class.keys
          end

          def values
            self.class.values
          end
        end

        ##
        # This class keeps track of Service floating bound list # (service list
        # of values) in the DOM. The problem we have is that service drop down
        # list of values are not named properly, this class keeps track of
        # bulk update form and order details form service list of values.
        # This class is shared between BulkUpdate and OrderDetails.
        class FloatingServiceTracker < FloatingBoundList
          BULK_UPDATE = :bulk_update unless defined? BULK_UPDATE
          SINGLE_ORDER = :single_order unless defined? SINGLE_ORDER
          attr_reader :param
          def initialize(param)
            @param = param
          end

          def lov_count(str)
            param.browser.tds(css: "li##{data_for(:orders_services, {})[str]} td.x-boundlist-item-text").size
          end

          def selection_field(form, str)
            if form == BULK_UPDATE
              if get(BULK_UPDATE).nil? && get(SINGLE_ORDER).nil?
                set(BULK_UPDATE, 0)
              elsif get(BULK_UPDATE).nil? && !get(SINGLE_ORDER).nil? && lov_count(str) > 0
                set(BULK_UPDATE, values.max + 1)
              end
            elsif form == SINGLE_ORDER
              if get(SINGLE_ORDER).nil? && get(BULK_UPDATE).nil?
                set(SINGLE_ORDER, 0)
              elsif get(SINGLE_ORDER).nil? && !get(BULK_UPDATE).nil? && lov_count(str) > 0
                set(SINGLE_ORDER, values.max + 1)
              end
              nil
            end
            StampsField.new(param.browser.tds(css: "li##{data_for(:orders_services, {})[str]} td.x-boundlist-item-text")[get(form)])
          end
        end
      end
    end
  end
end


