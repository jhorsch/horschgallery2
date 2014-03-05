class AddDescToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :desc, :text
    add_column :photos, :price, :integer
    add_column :photos, :id_num, :string
    add_column :photos, :main_category, :string
    add_column :photos, :sub_category, :string



  end
end
