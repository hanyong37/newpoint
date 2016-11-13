class CreateMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships do |t|
      t.integer :order_limit
      t.string :name
      t.timestamps
    end
  end
end
