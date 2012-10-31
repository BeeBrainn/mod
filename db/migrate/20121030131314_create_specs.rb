class CreateSpecs < ActiveRecord::Migration
  def change
    create_table :specs do |t|
      t.integer :number
      t.datetime :date
      t.integer :sum
      t.references :unp

      t.timestamps
    end
    add_index :specs, :unp_id
  end
end
