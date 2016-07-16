require 'active_support/concern'
module Shoppe
  module Discounts
    module OrderExtensions
      extend ActiveSupport::Concern
      included do
        belongs_to :discount, class_name: 'Shoppe::Discount'

        # renamed total to total_before_discount
        alias_method :total_before_discount, :total
        # total method is now the same as total_with_discount
        alias_method :total, :total_with_discount
      end

      # new total method
      def total_with_discount
        delivery_price +
          delivery_tax_amount +
          order_items.inject(BigDecimal(0)) { |t, i| t + i.total } -
          discount_value
      end

      private

      def discount_value
        return BigDecimal(0) unless discount.present?
        if discount.unit == "cash"
          discount.value
        else
          (discount.value * total_before_discount) / BigDecimal(100)
        end
      end

    end

  end
end
