class AddFieldsToMember < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :default_ship_reciever, :string
    add_column :members, :default_ship_address, :string
    add_column :members, :default_ship_mobile, :string

    add_column :orders, :ship_reciever, :string
    add_column :orders, :ship_address, :string
    add_column :orders, :ship_mobile, :string
  end
end
