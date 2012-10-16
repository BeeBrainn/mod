class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :total_amount, default: 0
      t.boolean :edit_data_flag, default: true
      t.boolean :reg_confirm_admin, default: false
      t.references :user_group, default: 1

      t.timestamps
    end
  end
end
