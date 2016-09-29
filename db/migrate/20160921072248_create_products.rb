class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :desc
      t.decimal :price
      t.string :photo
      t.integer :status
      t.integer :catagory_id
      t.integer :stock

      t.timestamps
    end
  end
end
