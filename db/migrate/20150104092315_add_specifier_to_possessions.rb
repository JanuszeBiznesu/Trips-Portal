class AddSpecifierToPossessions < ActiveRecord::Migration
  def change
    add_column :possessions, :specifier, :string, default: 'active'
  end
end
