class CreateProductColors < ActiveRecord::Migration
  def change
    create_table :product_colors do |t|
      t.string :name
      t.string :desc
      t.references :product_type

      t.timestamps
    end
    add_index :product_colors, :product_type_id
  end
end
