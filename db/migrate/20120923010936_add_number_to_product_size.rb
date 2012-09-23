class AddNumberToProductSize < ActiveRecord::Migration
  def change
    add_column :product_sizes, :number, :int
  end
end
