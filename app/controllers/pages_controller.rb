class PagesController < ApplicationController
  def home
    @products = Product.all
    @product_types = ProductType.all
    @product_colors = ProductColor.all
    @product_sizes = ProductSize.order("number ASC")
  end
end
