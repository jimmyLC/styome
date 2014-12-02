class Product < ActiveRecord::Base
  belongs_to :girl

  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos

  has_many :cart_items
  has_many :carts, through: :cart_item

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
