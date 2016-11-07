class RenameCatagoryToCategory < ActiveRecord::Migration[5.0]
  def self.up
    rename_table :catagories, :categories
    change_table :products do |t|
      t.rename :catagory_id, :category_id
    end
  end

  def self.down
    rename_table :categories , :catagories
     change_table :products do |t|
      t.rename :category_id ,:catagory_id
    end

  end
end
