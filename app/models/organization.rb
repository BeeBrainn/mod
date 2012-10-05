class Organization < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user, :user_id, :type_of_ownership,
                  :company_name, :unp, :juridical_address, 
                  :mailing_address, :contact_name, :phone_number_0,
                  :email, :work_time, :phone_number_1, :phone_number_2, :phone_number_3,
                  :phone_number_4, :phone_number_5, :phone_number_6, :phone_number_7,
                  :phone_number_8, :phone_number_9
end
