class AddTypeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :is_residential, :boolean
  end
end
