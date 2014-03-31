class AddSuperCategoryToMainCategory < ActiveRecord::Migration
  def change
    add_column :main_categories, :super_category, :string
    add_column :main_categories, :description, :text
    add_column :main_categories, :is_active, :boolean
    add_column :main_categories, :meta_title, :string
    add_column :main_categories, :meta_desc, :string
    add_column :main_categories, :alt_tag, :string
  end
end
