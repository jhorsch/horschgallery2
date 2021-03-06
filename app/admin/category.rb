ActiveAdmin.register Category do


  controller do
  def find_resource
    scoped_collection.friendly.find(params[:id])
  end
end

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
    column :main_category do |category|
      category.main_category.title
    end
  end

  # SHOW PAGE
   show do |category|
      attributes_table do
        row :is_active
        row :title do
          link_to category.title, category_path(category)
        end
        row :description
        row :main_category, :include_blank => false, :as => :select, :collection =>  MainCategory.all.order("title asc")
        row :meta_title
        row :meta_desc
        row :alt_tag
      end

      div :class => 'myclass' do
        panel "Photos", :id => 'myid' do
          table_for category.photos do
            column "Image" do |photo|
               link_to(image_tag("https://s3-us-west-2.amazonaws.com/hg-image/#{photo.id_num.downcase}.jpg", width: '100'), edit_admin_photo_path(photo))
            end
            column "Position", :max_width => "200px" do |photo|
              photo.qty_sold
            end
          end
        end
      end




      # end show page
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
