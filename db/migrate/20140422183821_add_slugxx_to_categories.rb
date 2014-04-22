class AddSlugxxToCategories < ActiveRecord::Migration
  def change

    remove_column :categories, :slug, :string
    add_column :categories, :slug, :string
    add_index :categories, :slug, unique: true
  end
end
