class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :organization, default: 0
      t.string :name
      t.string :email
      t.text :details
      t.boolean :reserv_flag, default: false

      t.timestamps
    end
  end
end
