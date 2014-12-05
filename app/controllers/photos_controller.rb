class PhotosController < ApplicationController
  before_action :find_photo, except: :create
  before_action :find_product

  def create
    @photo.build(photo_params)
    if @photo.save
      redirect_to product_path(@product)
    end
  end

  def update
    if @photo.save
      redirect_to product_path(@product)
    end
  end

  def destroy
    @photo.destroy
    redirect_to product_path(@product)
  end

  private

  def find_photo
    @photo = @product.photos
  end

  def find_product
    @product = Product.find(params[:product_id])
  end

  def photo_params
    params.require(:photo).permit(:images)
  end
end
