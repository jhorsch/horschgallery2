class CreateTieredShippings < ActiveRecord::Migration
  def change
    create_table :tiered_shippings do |t|
      t.decimal :lower
      t.decimal :upper
      t.decimal :price

      t.timestamps
    end
  end
end
