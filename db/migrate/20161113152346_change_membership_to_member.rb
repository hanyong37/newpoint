class ChangeMembershipToMember < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :memberships_id, :membership_id
  end
end
