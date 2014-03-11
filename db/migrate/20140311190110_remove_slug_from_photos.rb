class RemoveSlugFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :slug, :string
  end
end
