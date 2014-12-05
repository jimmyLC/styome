class CartsController < ApplicationController

  def show

  end

  def update
    params[:item].each do |product_id, quantity|
      current_cart.update(product_id, quantity)
    end

    redirect_to :back
  end

  def create
    current_cart.add_item(params[:product_id], params[:quantity] || 1)
    redirect_to :back
    flash[:notice] = "商品已加入購物車"
  end

  def destroy
    pid = params[:product_id]
    current_cart.remove(pid)
    flash[:notice] = "remove successful"

    redirect_to :back
  end
end
