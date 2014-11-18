class Girl < ActiveRecord::Base
  has_many :girl_productships
  has_many :products, :through => :girl_productships
end
