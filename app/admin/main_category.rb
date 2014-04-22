ActiveAdmin.register MainCategory do

  controller do
  def find_resource
    scoped_collection.friendly.find(params[:id])
  end
end


  menu :parent => "Photo Inventory", :priority => 3
  scope :active
  config.sort_order = "title_asc"


  filter :title

  permit_params :title, :super_category, :is_active, :meta_title, :meta_desc, :alt_tag, :description

  #INDEX LAYOUTS
  index do
    column :title do |main_category|
      link_to main_category.title, admin_main_category_path(main_category)
    # column :super_category
    end
  end


  # SHOW PAGE
   show do |main_category|
      attributes_table do
        row :is_active
        row :title do
          link_to main_category.title, main_category_path(main_category)
        end
        row :super_category, :collection => ['Most Popular','Chicago Cityscape','Chicago Sports','Top US Cities','Other Sports','Nature']
       row :description
        row :meta_title
        row :meta_desc
        row :alt_tag
      end
      # active_admin_comments
    end

    # EDIT/NEW PAGE
    form do |f|
      f.inputs "Status" do
        f.input :is_active, :label => "Main Category is live?"
      end
      f.inputs "Details" do
        f.input :title
        f.input :super_category, :include_blank => false, :collection => ['Most Popular','Chicago Cityscape','Chicago Sports','Top US Cities','Other Sports','Nature']
        f.input :description

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
