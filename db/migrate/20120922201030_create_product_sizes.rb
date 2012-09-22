class CreateProductSizes < ActiveRecord::Migration
  def change
    create_table :product_sizes do |t|
      t.string :name
      t.integer :price
      t.integer :count
      t.integer :reserv
      t.references :product_color

      t.timestamps
    end
    add_index :product_sizes, :product_color_id
  end
end
