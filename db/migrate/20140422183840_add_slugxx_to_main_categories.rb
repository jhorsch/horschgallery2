class AddSlugxxToMainCategories < ActiveRecord::Migration
  def change
    add_column :main_categories, :slug, :string
    add_index :main_categories, :slug, unique: true
  end
end
