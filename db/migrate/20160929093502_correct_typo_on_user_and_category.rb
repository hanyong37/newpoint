class CorrectTypoOnUserAndCategory < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.rename :mobilen_number, :mobile_number
    end
  end
end
