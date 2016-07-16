class AddDiscountIdToShoppeOrders < ActiveRecord::Migration
  def change
    add_column :shoppe_orders, :discount_id, :integer 
  end
end
