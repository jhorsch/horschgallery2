class DropCategoriesPhotostable < ActiveRecord::Migration
  def change
    drop_table :categories_photos
  end
end
