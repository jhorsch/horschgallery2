class AddIsGiftToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :is_gift, :boolean, default: false
  end
end
