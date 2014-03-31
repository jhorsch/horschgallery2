class CreateCategoriesPhotos < ActiveRecord::Migration
  def change
    create_table :categories_photos do |t|
      t.belongs_to :category
      t.belongs_to :photo
      t.timestamps
    end
  end
end
