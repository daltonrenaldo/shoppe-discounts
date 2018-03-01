require 'active_support/concern'
module Shoppe
  module Discounts
    module OrderExtensions
      extend ActiveSupport::Concern
      included do
        belongs_to :discount, class_name: 'Shoppe::Discount'

        # before_validation do
        #   discount = nil if discount.present? && purchase_minimum_for_discount_unmet?
        # end

        validate do
          if !self.received? && discount.present?
            errors.add(:base, "Discount no longer valid") unless discount.active?
            errors.add(:base, "Discount '#{discount.code}' already used") if customer.present? && customer.overused_discount?(discount)
            errors.add(:base, "#{helper.number_to_currency discount.minimum_purchase} minimum purchase required for #{discount.code} discount") if purchase_minimum_for_discount_unmet?
          end
        end

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
        subtotal = total_before_discount - discount_value(total_before_discount)
        return 0 if subtotal <= 0
        subtotal
      end

      # new total_cost method
      def total_cost_with_discount
        subtotal = total_cost_before_discount - discount_value(total_cost_before_discount)
        return 0 if subtotal <= 0
      end

      def discount_amount
        discount_value(total_before_discount)
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

      def purchase_minimum_for_discount_unmet?
        discount.minimum_purchase_required? && total_before_discount < discount.minimum_purchase
      end

      def helper
        @helper ||= Class.new do
          include ActionView::Helpers::NumberHelper
        end.new
      end

    end

  end
end
