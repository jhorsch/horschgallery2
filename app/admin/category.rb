ActiveAdmin.register Category do

  menu :parent => "Photo Inventory", :priority => 2
  scope :active
  config.sort_order = "title_asc"

  filter :main_category, :as => :select, :collection =>  MainCategory.all.order("title asc")
  filter :title

  permit_params :title, :super_category, :is_active, :meta_title, :meta_desc, :alt_tag, :description

  #INDEX LAYOUTS
  index do
    column  :title do |category|
      link_to category.title, admin_category_path(category)
    end
    column :main_category
  end

  # SHOW PAGE
   show do |category|
      attributes_table do
        row :is_active
        row :title
        row :description
        row :main_category, :include_blank => false, :as => :select, :collection =>  MainCategory.all.order("title asc")
        row :meta_title
        row :meta_desc
        row :alt_tag
      end
      # active_admin_comments
    end

    # EDIT/NEW PAGE
    form do |f|
      f.inputs "Status" do
        f.input :is_active, :label => "Category is live?"
      end
      f.inputs "Details" do
        f.input :title
        f.input :description
        f.input :main_category, :include_blank => false, :as => :select, :collection =>  MainCategory.all.order("title asc")

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
