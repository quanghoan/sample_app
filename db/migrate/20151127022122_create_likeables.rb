class CreateLikeables < ActiveRecord::Migration
  def change
    create_table :likeables do |t|
      t.references :user, index: true, foreign_key: true
      t.references :micropost, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :likeables, [:user_id, :micropost_id], unique: true
  end
end
