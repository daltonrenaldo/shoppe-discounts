class CreateShoppeDiscounts < ActiveRecord::Migration
  def change
    create_table :shoppe_discounts do |t|
      t.string :code
      t.decimal :value
      t.string :unit
      t.text :description
      t.integer :use_count, default: 0
      t.integer :max_uses, default: -1
      t.boolean :active, default: false
      t.datetime :expire_at
    end

    create_table :shoppe_order_discounts do |t|
      t.integer :order_id
      t.integer :discount_id
    end

    add_index :shoppe_order_discounts, :order_id
    add_index :shoppe_order_discounts, :discount_id
  end
end
