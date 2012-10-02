class User < ActiveRecord::Base
  belongs_to :user_group
  has_many :organizations
  has_secure_password
  attr_accessible :name, :email, :password, :password_confirmation
  validates :name, :email, :presence => true
  validates :email, :uniqueness => true
end
