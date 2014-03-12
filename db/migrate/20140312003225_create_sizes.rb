class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string  :name
      t.decimal :product_weight
      t.decimal :box_weight
      t.integer :declared_value
      t.integer :price
      t.integer :format_id

      t.timestamps
    end
  end
end
