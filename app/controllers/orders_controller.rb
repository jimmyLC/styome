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

    if @order.save
      OrderConfirm.confirm(@order).deliver
      current_cart.clear
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:receive_name, :receive_address, :payment_type)
  end
end