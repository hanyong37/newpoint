class ModifyMemberModel < ActiveRecord::Migration[5.0]
  def change
      add_column :members, :mobile, :string
      add_column :members, :wxcode, :string
      add_column :members, :name, :string
      remove_column :members, :user_id
  end
end
