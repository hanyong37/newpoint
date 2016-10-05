class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :user_id
      t.date :validate_from
      t.date :validate_to

      t.timestamps
    end
  end
end
