class CartsController < ApplicationController

  def show

  end

  def update
    failed_products = []
    params[:item].each do |product_id, quantity|
      @product = Product.find(product_id)
      if quantity.to_i > @product.quantity
        failed_products << @product
      end
    end

    if failed_products.empty?
      params[:item].each do |product_id, quantity|
        current_cart.update(product_id, quantity)
      end
      flash[:notice] = "修改數量成功"
    else
      product_names = failed_products.map{ |x| x.title }.join(", ")
      flash[:alert] = "#{product_names} 已超過商品數量"
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
    flash[:notice] = "商品已移除"

    redirect_to :back
  end
end
