class Manager::ProductsController < ApplicationController

  before_action :find_girl
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = @girl.products.all
    @product = Product.new
  end

  def show

  end

  def create
    @product = @girl.products.build(product_params)
    if @product.save
      redirect_to manager_girl_products_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @product.update(product_params)
      redirect_to manager_girl_products_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to manager_girl_products_path
  end

  private

  def find_girl
    @girl = Girl.find(params[:girl_id])
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :girl_id, :quantity, :photos_attributes => [:images])
  end

end
