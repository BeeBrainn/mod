class ProductType < ActiveRecord::Base
  belongs_to :product
  has_many :product_colors, dependent: :destroy
  attr_accessible :desc, :name, :product, :product_id
end
