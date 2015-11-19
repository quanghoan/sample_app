class CreateLogTimes < ActiveRecord::Migration
  def change
    create_table :log_times do |t|
    	t.datetime :log_time 
    	t.string :log_type
    	t.string :log_message
    	t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
