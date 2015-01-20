class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :title
      t.string :difficulty
      t.string :text
      t.integer :grade
      t.integer :user_id
      t.integer :country_id
      t.string :picture
      t.timestamps null: false
    end
  end
end
