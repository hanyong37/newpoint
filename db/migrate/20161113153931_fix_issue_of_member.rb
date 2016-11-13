class FixIssueOfMember < ActiveRecord::Migration[5.0]
  def change
    rename_column :members, :memberships_id, :membership_id
  end
end
