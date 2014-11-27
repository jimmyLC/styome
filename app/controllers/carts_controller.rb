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
  end

  def destroy
    pid = params[:product_id]
    current_cart.remove(pid)

    redirect_to :back
  end
end
