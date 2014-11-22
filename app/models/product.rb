class Product < ActiveRecord::Base
  belongs_to :girl

  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos

  has_many :cart_items
  has_many :carts, through: :cart_item

  def main_photo
    photos.first
  end
end
