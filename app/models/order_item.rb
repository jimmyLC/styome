class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  after_save :setup_quantity

  protected

  def setup_quantity
    p = self.product
    p.quantity -= self.quantity
    p.save!
  end
end
