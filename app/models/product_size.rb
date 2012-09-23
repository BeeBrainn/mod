class ProductSize < ActiveRecord::Base
  belongs_to :product_color
  attr_accessible :count, :name, :price, :reserv, :number, :product_color, :product_color_id
end
