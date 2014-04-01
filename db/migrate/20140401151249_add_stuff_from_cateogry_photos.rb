class AddStuffFromCateogryPhotos < ActiveRecord::Migration
  def change
    add_column :categories_photos, :photo_id, :integer
    add_column :categories_photos, :category_id, :integer
  end
end
