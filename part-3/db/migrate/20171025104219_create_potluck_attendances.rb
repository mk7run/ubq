class CreatePotluckAttendances < ActiveRecord::Migration
  def change
    create_table :potluck_attendances do |t|
      t.string :dish, null: false
      t.integer :potluck_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
