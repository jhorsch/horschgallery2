class ChangeGrandTotalOnOrders < ActiveRecord::Migration
  def change
    change_column :orders, :grand_total, :decimal
  end
end
