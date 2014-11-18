class Product < ActiveRecord::Base
  has_many :girl_productships
  has_many :girl, :through => :girl_productships

  has_many :photos
  accepts_nested_attributes_for :photos
end
