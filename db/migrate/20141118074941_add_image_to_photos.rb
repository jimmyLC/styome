class AddImageToPhotos < ActiveRecord::Migration
  def self.up
    add_attachment :photos, :images
  end

  def self.down
    remove_attachment :photos, :images
  end

end
