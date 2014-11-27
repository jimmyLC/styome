class OrdersController < ApplicationController

  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.new( order_params )

    current_cart.products.each do |p|
      @order.order_items.build( product_id: p[:product_id],
                                quantity: p[:quantity],
                                amount: p[:amount] )
    end

    current_cart.clear

    if @order.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:receive_name, :receive_address, :payment_type)
  end
end
