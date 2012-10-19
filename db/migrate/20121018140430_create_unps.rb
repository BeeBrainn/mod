class CreateUnps < ActiveRecord::Migration
  def change
    create_table :unps do |t|
      t.string :unp
      t.string :total_amount

      t.timestamps
    end
  end
end
