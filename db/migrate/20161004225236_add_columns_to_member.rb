class AddColumnsToMember < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :address, :text
  end
end
