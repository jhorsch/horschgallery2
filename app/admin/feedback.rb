ActiveAdmin.register Feedback do

    menu :parent => "Misc", :priority => 1

  config.sort_order = "name_asc"
  filter :name
  permit_params :name

  #INDEX LAYOUTS
  index do
    column  :name
    actions
  end

  # SHOW PAGE
  show do |mat|
    attributes_table do
      row :name
    end
    # active_admin_comments
  end

  # EDIT/NEW PAGE
  form do |f|
    f.inputs "Details" do
      f.input :name
    end
    f.actions
  end


end
