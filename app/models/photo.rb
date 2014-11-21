class Photo < ActiveRecord::Base
  belongs_to :product
  has_attached_file :images, :styles => { :medium => "300x300>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :images, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :images
end
