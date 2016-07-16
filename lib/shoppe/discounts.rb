require "active_support/dependencies"
require "shoppe" # shoppe gem
require "shoppe/discounts/version"
require "shoppe/discounts/engine"

module Shoppe
  module Discounts
    mattr_accessor :app_root, :root

    def self.setup
      nav = Shoppe::NavigationManager.find(:admin_primary)
      ActionView::Base.send :include, DiscountsHelper
      nav.add_item :discounts
      yield self
    end
  end
end
