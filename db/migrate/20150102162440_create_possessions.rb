class CreatePossessions < ActiveRecord::Migration
  def change
    create_table :possessions do |t|
      t.integer :borrower_id
      t.integer :borrowed_id

      t.timestamps null: false
    end
  	add_index :possessions, :borrower_id
	add_index :possessions, :borrowed_id
	add_index :possessions, [:borrower_id, :borrowed_id], unique: true
  end
end
