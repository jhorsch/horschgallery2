class AddActiveToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :is_active, :boolean
    add_column :photos, :format_id, :string
    add_column :photos, :show_bw_conversion, :boolean
  end
end
