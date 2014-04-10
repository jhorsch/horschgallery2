class AddCameraToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :camera, :string
    add_column :photos, :film_type, :string
  end
end
