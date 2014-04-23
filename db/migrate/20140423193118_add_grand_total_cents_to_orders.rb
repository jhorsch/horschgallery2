class AddGrandTotalCentsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :grand_total_cents, :integer
  end
end
