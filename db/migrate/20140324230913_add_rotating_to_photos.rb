class AddRotatingToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :rotating_keyword, :string
  end
end
