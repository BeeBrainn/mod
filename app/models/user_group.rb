class UserGroup < ActiveRecord::Base
  has_many :users
  attr_accessible :name, :least_order, :admin_flag
end
