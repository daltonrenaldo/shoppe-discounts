module Shoppe
  module Discounts
    class Engine < ::Rails::Engine
      initializer "shoppe.discounts.initializer" do |app|
        require 'shoppe/discounts/order_extensions'
        Shoppe::Order.include Shoppe::Discounts::OrderExtensions

        Shoppe::Discounts.setup do |config|
          config.app_root = app.root
          config.root = root
        end
      end

      initializer "shoppe.discounts.append_migrations" do |app|
        unless app.root.to_s.match root.to_s
          config.paths["db/migrate"].expanded.each do |expanded_path|
            app.config.paths["db/migrate"] << expanded_path
          end
        end
      end
    end
  end
end
