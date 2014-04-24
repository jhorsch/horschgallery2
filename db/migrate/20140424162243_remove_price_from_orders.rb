class RemovePriceFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :subtotal, :string
    remove_column :orders, :tax, :string
    remove_column :orders, :shipping, :string
    remove_column :orders, :grand_total, :string

    add_column :orders, :subtotal, :decimal
    add_column :orders, :tax, :decimal
    add_column :orders, :shipping, :decimal
    add_column :orders, :grand_total, :decimal

    add_column :orders, :grand_total_cents, :integer




  end
end
