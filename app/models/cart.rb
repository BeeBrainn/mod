class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items, dependent: :destroy

  def add_product_size(product_size_id, count_to_cart)
  	current_item = line_items.find_by_product_size_id(product_size_id)
  	if current_item
  		current_item.quantity += count_to_cart
  	else
  		current_item = line_items.build(product_size_id: product_size_id)
      current_item.quantity += count_to_cart
  	end
  	current_item.save
  end

  def total_price
    line_items.to_a.sum {|item| item.total_price}
  end
end
