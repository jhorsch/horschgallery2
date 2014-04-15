ActiveAdmin.register TieredShipping do


  menu :parent => "Shipping Options", :priority => 1
  config.sort_order = "price_asc"
  filter :price

  permit_params :lower, :upper, :price

  #INDEX LAYOUTS
  index do
    column  :lower do |interval|
      number_to_currency interval.lower, precision: 0
    end
    column  :upper  do |interval|
      number_to_currency interval.upper, precision: 0
    end
    column  :price  do |interval|
      number_to_currency interval.price, precision: 2
    end
    actions
  end

  # SHOW PAGE
  show do |mat|
    attributes_table do
      row :lower
      row :upper
      row :price
    end
    # active_admin_comments
  end

  # EDIT/NEW PAGE
  form do |f|
    f.inputs "Details" do
      f.input :lower
      f.input :upper
      f.input :price
    end
    f.actions
  end

end
