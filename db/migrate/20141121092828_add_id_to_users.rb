class AddIdToUsers < ActiveRecord::Migration
  def change
    add_column :girls, :user_id, :integer
    add_column :users, :admin_id, :boolean, :default => false
  end
end
