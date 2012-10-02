class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.string :name
      t.integer :least_order, default: 5
      t.boolean :admin_flag, default: false
      t.boolean :view_reserv_flag, default: false
      t.boolean :view_sklad_flag, default: false

      t.timestamps
    end
  end
end
