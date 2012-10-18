class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :product_size_id
      t.integer :cart_id
      t.integer :quantity, default: 1
      t.references :order

      t.timestamps
    end
  end
end
