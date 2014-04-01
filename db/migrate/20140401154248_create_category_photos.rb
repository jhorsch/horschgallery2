class CreateCategoryPhotos < ActiveRecord::Migration
  def change
    create_table :category_photos do |t|
      t.integer :category_id
      t.integer :photo_id

      t.timestamps
    end
  end
end
