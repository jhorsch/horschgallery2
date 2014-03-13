class CreateCategoryMats < ActiveRecord::Migration
  def change
    create_table :category_mats do |t|
      t.integer :mat_id
      t.integer :category_id

      t.timestamps
    end
  end
end
