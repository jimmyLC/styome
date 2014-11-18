class Product < ActiveRecord::Base
  belongs_to :girl

  has_many :photos
  accepts_nested_attributes_for :photos

  def main_photo
    photos.first
  end
end
