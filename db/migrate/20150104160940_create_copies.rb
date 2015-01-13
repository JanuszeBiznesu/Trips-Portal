class CreateCopies < ActiveRecord::Migration
  def change
    create_table :copies do |t|
      t.integer :book_id
      t.integer :user_id
      t.string  :text
      t.integer :grade

      t.timestamps null: false
    end
  end
end
