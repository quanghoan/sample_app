class CreateUserSteps < ActiveRecord::Migration
  def change
    create_table :user_steps do |t|
      t.references :user, index: true, foreign_key: true
      t.references :step, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
