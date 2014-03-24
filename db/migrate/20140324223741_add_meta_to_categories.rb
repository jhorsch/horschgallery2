class AddMetaToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :meta_title, :string
    add_column :categories, :meta_desc, :string
    add_column :categories, :alt_tag, :string
  end
end
