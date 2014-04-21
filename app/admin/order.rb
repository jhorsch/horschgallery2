ActiveAdmin.register Order do

  menu :priority => 0

 config.sort_order = "created_at_desc"
 scope :new
 scope :processing
 scope :shipped
 scope :declined
 scope :returned
 # :processing, :shipped, :declined, :returned

  filter :last_name_bill
  filter :created_at
  filter :id
  filter :status

# permit_params :created_at, :first_name_bill, :last_name:bill
# Name  Phone Email Status  A.SubTotal  SubTotal  Shipping  Packing Tax Disc  Disc Type Total Shipped To  Gift  FeedBack

 #INDEX LAYOUTS
  index do

    column  'Date', :created_at
    column  "Order#" do |order|
      link_to order.id, admin_order_path(order)
    end
    column  'Status', :status
    column  :subtotal do |order|
      div :class => "option_price" do
        number_to_currency order.subtotal, precision: 2
      end
    end
    column  :shipping do |order|
      div :class => "option_price" do
        number_to_currency order.shipping, precision: 2
      end
    end
    column  :grand_total do |order|
      div :class => "option_price" do
        number_to_currency order.grand_total, precision: 2
      end
    end
    column  "First name", :first_name_bill
    column  'Email', :email do |order|
      mail_to order.email, nil, target: '_blank'
    end
    column  'Phone', :phone_number do |order|
      number_to_phone order.phone_number
    end
    column  'Shipping To', :state_ship

  end

  #SHOW PAGE

show do |order|

# order detaixxls
columns do
  column do
    attributes_table do
    row :id
    row :status
    row :email do
      mail_to order.email, nil, target: '_blank'
    end
    row :phone_number do
      number_to_phone order.phone_number
    end
     row :is_gift
     row :feedback_type
    end
  end

  column do
    attributes_table do
    row :subtotal do
      number_to_currency order.subtotal, precision: 2
    end
    row :tax do
      number_to_currency order.tax, precision: 2
    end
    row :shipping do
      number_to_currency order.shipping, precision: 2
    end
    row :grand_total do
      number_to_currency order.grand_total, precision: 2
    end
    end
  end

end

# split into shipping and billing
columns do

# shipping column
column do
panel("Shipping Details") do
# split into 2 colums
columns do
column do
attributes_table_for order do
row 'First Name' do
  order.first_name_ship
end
row 'Last Name' do
  order.last_name_ship
end
row 'Address' do
  order.address1_ship
end
row 'Apt#' do
  order.address2_ship
end
end
end
column do
attributes_table_for order do
row 'City' do
  order.city_ship
end
row 'State' do
  order.state_ship
end
row 'Zip Code' do
  order.zipcode_ship
end
row 'Is Residential' do
  order.is_residential_ship
end

end
end
end
end
end

column do
panel("Billing Details") do
# split into 2 colums
columns do
column do
attributes_table_for order do
row 'First Name' do
  order.first_name_bill
end
row 'Last Name' do
  order.last_name_bill
end
row 'Address' do
  order.address1_bill
end
row 'Apt#' do
  order.address2_bill
end
end
end
column do
attributes_table_for order do
row 'City' do
  order.city_bill
end
row 'State' do
  order.state_bill
end
row 'Zip Code' do
  order.zipcode_bill
end

end
end
end
end
end
end




# end show
end




end
