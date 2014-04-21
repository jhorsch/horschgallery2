class RemoveConfirmFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :confirm_email, :string
  end
end
