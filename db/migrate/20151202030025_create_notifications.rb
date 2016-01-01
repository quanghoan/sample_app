class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
    	# t.integer :sender_id
    	t.references :user, index: true, foreign_key: true
      t.references :micropost, index: true, foreign_key: true
      t.references :comment, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
