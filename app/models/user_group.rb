class UserGroup < ActiveRecord::Base
  has_many :users
  attr_accessible :name, :least_order, :admin_flag, :view_reserv_flag, :view_sklad_flag
  validates :name, :uniqueness => true
end
