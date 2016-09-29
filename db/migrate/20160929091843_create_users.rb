class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.boolean :is_admin
      t.integer :mobilen_number
      t.string :wx_code

      t.timestamps
    end
  end
end
