class AddActivexxToPhotos < ActiveRecord::Migration
  def change
    change_column :photos, :is_active, :boolean, default: true
    change_column :categories, :is_active, :boolean, default: true
    change_column :main_categories, :is_active, :boolean, default: true
  end
end
