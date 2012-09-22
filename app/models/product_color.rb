class ProductColor < ActiveRecord::Base
  belongs_to :product_type
  attr_accessible :desc, :name, :product_type, :product_type_id
end
