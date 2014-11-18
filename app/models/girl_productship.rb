class GirlProductship < ActiveRecord::Base
  belongs_to :girl
  belongs_to :product
end
