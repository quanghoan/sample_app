class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
    	t.references :template, index: true, foreign_key: true
    	t.integer :hour
    	t.integer :day
      t.timestamps null: false
    end
  end
end
