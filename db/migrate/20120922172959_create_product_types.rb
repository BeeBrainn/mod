class CreateProductTypes < ActiveRecord::Migration
  def change
    create_table :product_types do |t|
      t.string :name
      t.text :desc
      t.string :big_image_url
      t.string :small_image_url
      t.references :product

      t.timestamps
    end
    add_index :product_types, :product_id
  end
end
