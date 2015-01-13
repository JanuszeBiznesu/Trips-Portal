class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :difficulty
      t.string :text
      t.integer :grade
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
