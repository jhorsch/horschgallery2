class RemoveCategroyidFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :category_id, :integer
  end
end
