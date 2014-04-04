class AddFeaturedGalleryToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :featured_gallery, :integer
  end
end
