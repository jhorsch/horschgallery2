ActiveAdmin.register Order do

  menu :priority => 0

 config.sort_order = "created_at_desc"
# scope :new, :processing, :shipped

 filter :last_name_bill
  filter :created_at
  filter :id
  filter :status

# permit_params :created_at, :first_name_bill, :last_name:bill
# Name  Phone Email Status  A.SubTotal  SubTotal  Shipping  Packing Tax Disc  Disc Type Total Shipped To  Gift  FeedBack

 #INDEX LAYOUTS
  index do
    column  "Order#" do |order|
      link_to order.id, admin_order_path(order)
    end

    column  'Date', :created_at
    column  'Status', :status
    column  "First Name", :first_name_bill
    column  'Email', :email
    column  'Phone', :phone_number
    column  :grand_total
    column  'Shipped To', :state_ship

  end


end
