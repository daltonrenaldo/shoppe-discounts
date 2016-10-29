class AddMaxUsesPerUserToShoppeDiscounts < ActiveRecord::Migration
  def change
    add_column :shoppe_discounts, :max_uses_per_user, :integer, default: 1
  end
end
