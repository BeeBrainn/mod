class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_size_id, :product_size
  belongs_to :product_size
  belongs_to :cart
  belongs_to :order
  
  def total_price
  	product_size.price * quantity  	
  end
end

