module Shoppe
  class Discount < ActiveRecord::Base
    def active?
      active && (expire_at.nil? || Time.current <= expire_at)
    end
  end
end
