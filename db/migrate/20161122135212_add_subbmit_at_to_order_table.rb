class AddSubbmitAtToOrderTable < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :submitted_at, :timestamp
    add_column :orders, :created_by, :integer
    add_column :orders, :target_deliver_week, :integer
  end
end
