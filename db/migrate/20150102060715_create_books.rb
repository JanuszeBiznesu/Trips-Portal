class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :book_id
      t.string :title
      t.string :author
      t.date :year_of_print
      t.string :synopsis

      t.timestamps null: false
    end
  end
end
