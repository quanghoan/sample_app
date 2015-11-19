class AddLogtimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :login_at, :datetime
    add_column :users, :logout_at, :datetime
  end
end
