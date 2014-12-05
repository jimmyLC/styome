class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  before_save :set_total
  validates_presence_of :receive_name, :receive_address, :payment_type

  protected
  def set_total
    self.total = self.order_items.map{ |i| i.amount }.sum
  end

end