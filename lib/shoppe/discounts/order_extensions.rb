require 'active_support/concern'
module Shoppe
  module Discounts
    module OrderExtensions
      extend ActiveSupport::Concern
      included do
        belongs_to :discount, class_name: 'Shoppe::Discount'

        after_confirmation :increment_discount_use_count, if: :discount

        # renamed total to total_before_discount
        alias_method :total_before_discount, :total
        alias_method :total_cost_before_discount, :total_cost
        # total method is now the same as total_with_discount
        alias_method :total, :total_with_discount
        alias_method :total_cost, :total_cost_with_discount
      end

      # new total method
      def total_with_discount
        total_before_discount - discount_value(total_before_discount)
      end

      # new total_cost method
      def total_cost_with_discount
        total_cost_before_discount - discount_value(total_cost_before_discount)
      end

      private

      def increment_discount_use_count
        discount.increment(:use_count).save
      end

      def discount_value(original_cost)
        return BigDecimal(0) unless discount.present?
        if discount.unit == "cash"
          discount.value
        else
          (discount.value * original_cost) / BigDecimal(100)
        end
      end

    end

  end
end
