class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @products = []
    else
      @products = Product.search(params[:q]).records
    end
  end
end
