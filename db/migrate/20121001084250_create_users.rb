class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
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
      t.string :work_time
      t.boolean :edit_data_flag, default: true
      t.boolean :reg_confirm_admin, default: false
      t.references :user_group, default: 1 #тобишь к юзерам прикручиваем(не к админам!)
      
      
      t.timestamps
    end
  end
end
