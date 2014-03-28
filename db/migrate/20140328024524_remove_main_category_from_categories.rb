class RemoveMainCategoryFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :main_category, :string
  end
end
