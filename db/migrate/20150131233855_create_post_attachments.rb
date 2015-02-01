class CreatePostAttachments < ActiveRecord::Migration
  def change
    create_table :post_attachments do |t|
      t.integer :trip_id
      t.string :avatar

      t.timestamps null: false
    end
  end
end
