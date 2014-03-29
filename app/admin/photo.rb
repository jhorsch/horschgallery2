ActiveAdmin.register Photo do

  menu :parent => "Edit Content", :priority => 0

  config.sort_order = "created_at_desc"
  scope :active

  # FILTERS
  filter :categories, :as => :select, :collection => proc { Category.all }
  filter :id_num
  filter :artist_name

  # PERMISSIONS
  permit_params :id_num, :title, :artist_name, :year_taken, :is_active, :show_bw_conversion, :format_id, :rotating_keyword, :desc, :format

  #INDEX LAYOUTS
  # index :as => :grid, :columns => 3 do |photo|
  #   div link_to(image_tag("https://s3-us-west-2.amazonaws.com/hg-image/#{photo.id_num.downcase}.jpg"), admin_photo_path(photo))
  # end

  index do
    column  "Prod#", :id_num
    column  :title
    column  :main_category
    column  :created_at
    actions :defaults => false do |photo|
      link_to "View", admin_photo_path(photo)
    end
  end

  # SHOW PAGE
   show do |photo|
      attributes_table do
        row :is_active
        row :id_num
        row :title
        row :image do
          image_tag("https://s3-us-west-2.amazonaws.com/hg-image/#{photo.id_num.downcase}.jpg")
        end
        row :artist_name
        row :year_taken
        row :rotating_keyword
        row :desc
        row :format
        row :show_bw_conversion
      end
      # active_admin_comments
    end

    # EDIT/NEW PAGE
    form do |f|
      f.inputs "Status" do
        f.input :is_active, :label => "Photo is live?"
      end
      f.inputs "Details" do
        f.input :id_num
        f.input :title
        f.input :artist_name
        f.input :year_taken
        f.input :rotating_keyword
      end
      f.inputs "Description" do
        f.input :desc
      end
      f.inputs "Photo Options" do
        f.input :format
        f.input :show_bw_conversion
      end
      f.actions
    end


end
