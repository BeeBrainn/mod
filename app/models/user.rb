class User < ActiveRecord::Base
  belongs_to :user_group
  has_many :organizations
  has_secure_password
  attr_accessible :name, :email, :password, :password_confirmation,
  				  :type_of_ownership, :company_name, :unp, 
  				  :juridical_address, :mailing_address, :contact_name, 
  				  :phone_number_0, :phone_number_1, :phone_number_2, 
  				  :phone_number_3, :phone_number_4, :phone_number_5, 
  				  :phone_number_6, :phone_number_7, :phone_number_8, 
  				  :phone_number_9, :skype, :work_time, :user_group_id
  validates :name, :email, :presence => true
  validates :email, :uniqueness => true
end
