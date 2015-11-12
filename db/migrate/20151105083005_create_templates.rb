class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
    	t.references :user, index: true, foreign_key: true
      t.text :subject
      t.text :body
      t.timestamps null: false
    end 
    add_index :templates, [:user_id, :created_at] 
  end
end
