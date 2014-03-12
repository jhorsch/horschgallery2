class RemoveFormatIdFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :format_id, :string
    add_column :photos, :format_id, :integer
  end
end
