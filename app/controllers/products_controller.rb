class ProductsController < ApplicationController
  before_action :find_params, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @products = Product.all
    @girls = Girl.all

    @product = Product.new
    @photo = @product.photos.new
  end

  def show
    @photos = @product.photos
  end

  def new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def find_params
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity,:photos_attributes => [:images] )
  end
end
