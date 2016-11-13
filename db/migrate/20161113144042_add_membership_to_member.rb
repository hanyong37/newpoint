class AddMembershipToMember < ActiveRecord::Migration[5.0]
  def change
    add_reference  :users,:memberships, index: true, foreign_key: true
    add_column :users,:membership_number, :string
  end
end
