class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.references :user
      t.string :type_of_ownership
      t.string :company_name
      t.string :unp
      t.string :juridical_address
      t.string :mailing_address
      t.string :contact_name
      t.string :phone_number_0
      t.string :phone_number_1
      t.string :phone_number_2
      t.string :phone_number_3
      t.string :phone_number_4
      t.string :phone_number_5
      t.string :phone_number_6
      t.string :phone_number_7
      t.string :phone_number_8
      t.string :phone_number_9
      t.string :email
      t.string :work_time


      t.timestamps
    end
  end
end
