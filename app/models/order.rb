class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  before_save :set_total

  protected

  def set_total
    self.total = self.order_items.map{ |i| i.amount }.sum
  end
end
