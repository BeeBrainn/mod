class Order < ActiveRecord::Base
  belongs_to :organization
  has_many :line_items, dependent: :destroy
  attr_accessible :details, :email, :name, :user_id, :reserv_flag
  unless @current_user
  	self.validates :name, :email, presence: true
  end

  def add_line_items_from_cart(cart)
  	cart.line_items.each do |item|
  		item.cart_id = nil
  		line_items << item
  	end  	
  end
end