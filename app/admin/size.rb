ActiveAdmin.register Size do

menu :parent => "Photo Options", :priority => 1
config.sort_order = "format_asc"
filter :format, :as => :select, :include_blank => false, :collection => Format.all
filter :name

  permit_params :title, :body, :meta_keywords, :meta_description, :excerpt, :image, category_ids: [:id]



permit_params :name, :product_weight, :box_weight, :declared_value, :price, :format_id, :product_ads_extension

#INDEX LAYOUTS
index do
  column  :name
  column  :price do |size|
    div :class => "option_price" do
      number_to_currency size.price, precision: 0
    end
  end
  column :format
  actions
end


# SHOW PAGE
 show do |mat|
    attributes_table do
      row :name
      row :format, :as => :select, :include_blank => false, :collection => Format.all
      row :price
      row :product_weight
      row :box_weight
      row :declared_value
      row :product_ads_extension
    end
    # active_admin_comments
end

# EDIT/NEW PAGE
form do |f|
   f.inputs "Details" do
      f.input :name
      f.input :format, :as => :select, :include_blank => false, :collection => Format.all

      f.input :price
  end
  f.inputs "Shipping" do
      f.input :product_weight
      f.input :box_weight
      f.input :declared_value
  end
   f.inputs "Google Product Ads" do
      f.input :product_ads_extension
  end
  f.actions
end

end
