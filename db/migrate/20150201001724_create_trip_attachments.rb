class CreateTripAttachments < ActiveRecord::Migration
  def change
    create_table :trip_attachments do |t|
      t.integer :trip_id
      t.string :avatar

      t.timestamps null: false
    end
  end
end
