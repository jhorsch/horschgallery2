class AddNumberSoldToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :qty_sold, :integer, default: 0
  end
end
