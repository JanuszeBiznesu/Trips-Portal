class AddAmountToBooks < ActiveRecord::Migration
  def change
    add_column :books, :amount, :integer
  end
end
