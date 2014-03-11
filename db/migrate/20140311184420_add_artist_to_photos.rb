class AddArtistToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :artist_name, :string
    add_column :photos, :year_taken, :string
  end
end
