class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :member_id
      t.string :memo
      t.string :address
      t.integer :status
      t.string :feedback
      t.integer :stars

      t.timestamps
    end
  end
end
