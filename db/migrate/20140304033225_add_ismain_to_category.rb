class AddIsmainToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :is_main, :boolean
  end
end
