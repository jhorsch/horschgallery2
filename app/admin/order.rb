ActiveAdmin.register Order do

  menu :priority => 0

 config.sort_order = "created_at_desc"
 scope :fresh
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
show :title => 'Order Information' do |order|


columns do
  column do
   panel 'Customer Information' do
    attributes_table_for order do
      row 'Order #' do
        order.id
      end
      row :status
      row 'First name' do
        order.first_name_bill
      end
      row :email do
        mail_to order.email, nil, target: '_blank'
      end
      row :phone_number do
        number_to_phone order.phone_number
      end
      row 'Is This A Gift?' do
        order.is_gift? ? 'Yes' : 'No'
      end
      row 'They found us from' do
        order.feedback_type
      end
    end
  end
  end

  column do
    panel 'Order Totals' do
      attributes_table_for order do
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
        row 'Apt#/Suite#' do
          order.address2_ship.blank? ? '.' :  order.address2_ship
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
        row 'Shipping Location' do
          order.is_residential_ship? ? 'Residential' : 'Business'
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
      row 'Apt#/Suite#' do
        order.address2_bill.blank? ? '.' :  order.address2_bill
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

div do
  panel("Photographs Purchased") do
    table_for(order.line_items) do
      if true
        column "Photograph" do |item|
          link_to(image_tag("https://s3-us-west-2.amazonaws.com/hg-image/#{item.photo.id_num.downcase}.jpg", width: '125'), admin_photo_path(item.photo))
        end
      else
        column "Photograph" do |item|
          link_to(image_tag("https://s3-us-west-2.amazonaws.com/hg-matted/#{item.photo.id_num.downcase}.jpg", width: '125'), admin_photo_path(item.photo))
        end
      end
      column "ID" do |item|
        item.photo.id_num
      end
      column "Size" do |item|
        item.size.name
      end
      column "Mat" do |item|
        item.mat.name
      end
      column "Frame" do |item|
        item.frame.name
      end
      column "Convert To B&W?" do |item|
        item.convert_to_bw? ? 'Yes' : 'No'
      end
      column 'Unit Price' do |item|
        number_to_currency(item.unit_price, precision: 0)
      end
      column :qty
      column 'Total Price' do |item|
        number_to_currency(item.total_price, precision: 0)
      end

    end
  end
end



# end show
end







# end class
end


