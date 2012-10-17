class ProductSize < ActiveRecord::Base
  has_many :line_items
  belongs_to :product_color
  before_destroy :ensure_not_referenced_by_any_line_item
  attr_accessible :count, :name, :price, :reserv, :number, :product_color, :product_color_id

private
  def ensure_not_referenced_by_any_line_item
  	if line_items.empty?
  	  return true
  	else
  	  errors.add(:base, "Существуют товарные позиции")
  	  return false
  	end
  end
end
