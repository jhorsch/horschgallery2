class RemovePhoneFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :phone, :string
    add_column :orders, :phone_number, :string
  end
end
