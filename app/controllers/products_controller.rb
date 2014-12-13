class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :search]
  def index
    @products = Product.all
    @girls = Girl.all

    @product = Product.new
    @photo = @product.photos.build

  end

  def show
    @photos = @product.photos
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

  def search
    if params[:q].nil?
      @products = []
    else
      @products = Product.search(params[:q]).records
    end
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :girl_id, :quantity, :avatar)
  end
end
