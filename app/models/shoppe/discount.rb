module Shoppe
  class Discount < ActiveRecord::Base
    def active?
      active && Time.current <= expire_at
    end
  end
end
