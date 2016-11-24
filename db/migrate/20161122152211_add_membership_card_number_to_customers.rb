class AddMembershipCardNumberToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :membership_card_number, :string
    add_column :members, :default_ship_week_day, :integer
  end
end
