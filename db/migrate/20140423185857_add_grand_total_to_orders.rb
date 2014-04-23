class AddGrandTotalToOrders < ActiveRecord::Migration
  def change
    change_column :orders, :grand_total, :decimal, precision: 2
    change_column :orders, :tax, :decimal
    change_column :orders, :shipping, :decimal
    change_column :orders, :subtotal, :decimal
  end
end
