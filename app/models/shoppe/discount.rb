module Shoppe
  class Discount < ActiveRecord::Base
    validates_presence_of :code, :value

    def active?
      active && (expire_at.nil? || Time.current <= expire_at) && (max_uses == -1 || max_uses > use_count)
    end

    def fixed?
      unit == 'cash'
    end

    def percentage?
      unit == 'percentage'
    end

    def minimum_purchase_required?
      !!minimum_purchase
    end
  end
end
