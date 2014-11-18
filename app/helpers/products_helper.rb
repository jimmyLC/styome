module ProductsHelper

  def render_product_photo(photo)
    if photo.present?
      image_tag(photo.images.url(:medium))
    else
      "no image"
    end
  end
end
