class RemovePasswordDigestToUser < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :mobile_number, :string
    remove_column :users, :password
  end
end
