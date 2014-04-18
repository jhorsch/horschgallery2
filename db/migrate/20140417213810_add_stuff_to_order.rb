class AddStuffToOrder < ActiveRecord::Migration
  def change
    #Shipping
    add_column :orders, :first_name_ship, :string
    add_column :orders, :last_name_ship, :string
    add_column :orders, :address1_ship, :string
    add_column :orders, :address2_ship, :string
    add_column :orders, :city_ship, :string
    add_column :orders, :state_ship, :string
    add_column :orders, :zipcode_ship, :string

    #Billing
    add_column :orders, :first_name_bill, :string
    add_column :orders, :last_name_bill, :string
    add_column :orders, :address1_bill, :string
    add_column :orders, :address2_bill, :string
    add_column :orders, :city_bill, :string
    add_column :orders, :state_bill, :string
    add_column :orders, :zipcode_bill, :string

    #Contact
    add_column :orders, :email, :string
    add_column :orders, :confirm_email, :string
    add_column :orders, :phone, :string

    #Order Totals
    add_column :orders, :subtotal, :string
    add_column :orders, :shipping, :string
    add_column :orders, :tax, :string
    add_column :orders, :grand_total, :string
  end
end
