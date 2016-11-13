class AddLimitedToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :limit , :integer
  end
end
