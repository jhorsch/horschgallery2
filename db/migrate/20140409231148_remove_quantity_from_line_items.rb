class RemoveQuantityFromLineItems < ActiveRecord::Migration
  def change
    remove_column :line_items, :quanitity, :integer
    add_column :line_items, :qty, :integer, :default => 1, :null => false
  end
end
