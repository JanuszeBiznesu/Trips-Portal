class AddToCopies < ActiveRecord::Migration
  def change
  	add_column :copies, :ISBN, :string
  	add_column :copies, :edition, :integer
  	add_column :copies, :year_of_print, :integer
  end
end
