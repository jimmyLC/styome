class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  before_save :set_total

  # validates_numericality_of :total, :greater_than => 0
  # validate :check_enough_quantity

  protected

  # def check_enough_quantity
  #   self.order_items.each do |item|
  #     error[:base] << "#{item.product.name} is Sold out" if item.quantity > item.product.quantity
  #   end
  # end

  def set_total
    self.total = self.order_items.map{ |i| i.amount }.sum
  end

end
