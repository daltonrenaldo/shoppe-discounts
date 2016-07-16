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
  end
end
