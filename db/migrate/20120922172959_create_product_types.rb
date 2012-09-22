class CreateProductTypes < ActiveRecord::Migration
  def change
    create_table :product_types do |t|
      t.string :name
      t.text :desc
      t.references :product

      t.timestamps
    end
    add_index :product_types, :product_id
  end
end
