class ProductColor < ActiveRecord::Base
  belongs_to :product_type
  has_many :product_sizes
  attr_accessible :desc, :name, :product_type, :product_type_id
end
