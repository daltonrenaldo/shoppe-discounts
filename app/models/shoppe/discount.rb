module Shoppe
  class Discount < ActiveRecord::Base
    def active?
      active && (expire_at.nil? || Time.current <= expire_at) && (max_uses == -1 || max_uses > use_count)
    end

    def fixed?
      unit == 'cash'
    end

    def percentage?
      unit == 'percentage'
    end
  end
end
