class ProductType < ActiveRecord::Base
  belongs_to :product
  attr_accessible :desc, :name, :product, :product_id
end
