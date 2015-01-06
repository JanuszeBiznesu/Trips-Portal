class CreateCopies < ActiveRecord::Migration
  def change
    create_table :copies do |t|
      t.integer :book_id

      t.timestamps null: false
    end
  end
end
