class AddTypeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :is_residential_ship, :boolean
  end
end
