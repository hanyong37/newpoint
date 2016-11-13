class CorrectUserAndMember < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :membership_id
    remove_column :users, :membership_number

    add_reference  :members,:memberships, index: true, foreign_key: true
    add_column :members, :membership_number, :string
  end
end
