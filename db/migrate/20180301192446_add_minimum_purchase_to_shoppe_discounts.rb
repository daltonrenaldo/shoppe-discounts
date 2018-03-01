class AddMinimumPurchaseToShoppeDiscounts < ActiveRecord::Migration
  def change
    add_column :shoppe_discounts, :minimum_purchase, :decimal
  end
end
