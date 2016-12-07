class AddViewPriorityToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :view_priority, :integer, default: 1
  end
end
