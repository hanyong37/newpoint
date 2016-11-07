class CreateLineitems < ActiveRecord::Migration[5.0]
  def change
    create_table :lineitems do |t|
      t.string :product_id
      t.integer :amount
      t.string :order_id
      t.decimal :price, precision: 10, scale: 2
      t.string :description

      t.timestamps
    end
  end
end
