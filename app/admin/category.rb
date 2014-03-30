ActiveAdmin.register Category do

  menu :parent => "Edit Content"
  scope :active

  filter :main_category, :as => :select, :collection => proc { MainCategory.all }
  filter :title


  permit_params :title, :super_category, :is_active, :meta_title, :meta_desc, :alt_tag, :description

  #INDEX LAYOUTS
  index do
    column  :title
    column  :created_at
    actions

  end


  # SHOW PAGE
   show do |category|
      attributes_table do
        row :is_active
        row :title
        row :description
        row :main_category
        row :meta_title
        row :meta_desc
        row :alt_tag
      end
      # active_admin_comments
    end

    # EDIT/NEW PAGE
    form do |f|
      f.inputs "Status" do
        f.input :is_active, :label => "Category is live?", :input_html => { :checked => 'checked' }
      end
      f.inputs "Details" do
        f.input :title
        f.input :description
        f.input :main_category, :include_blank => false

      end
      f.inputs "Meta Information" do
        f.input :meta_title
        f.input :meta_desc
        f.input :alt_tag

      end
      f.actions
    end



  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

end
