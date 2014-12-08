class AddImageToGirl < ActiveRecord::Migration
  def self.up
    add_attachment :girls, :avatar
  end

  def self.down
    remove_attachment :girls, :avatar
  end
end
