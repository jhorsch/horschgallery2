ActiveAdmin.register Photo do

controller do
  def find_resource
    scoped_collection.friendly.find(params[:id])
  end
end

  menu :parent => "Photo Inventory", :priority => 0

  config.sort_order = "created_at_desc"
  scope :active

  # FILTERS
  filter :id_num
  filter :categories
  filter :title
  filter :artist_name
  filter :format
  filter :slug


  # PERMISSIONS
  permit_params :id_num, :title, :artist_name, :year_taken, :is_active, :show_bw_conversion, :format_id, :rotating_keyword, :desc, :featured_gallery, :camera, :film_type, :qty_sold, category_ids: []

  #INDEX LAYOUTS
  index do
    column  "Prod#", sortable: :id_num do |photo|
      link_to photo.id_num, admin_photo_path(photo)
    end
    column  "Title", sortable: :title do |photo|
      link_to photo.title, admin_photo_path(photo)
    end
    # column  :category_ids do |category|
    #   category.title
    # end
    column  :artist
    column  :format
    column  :created_at
  end

  index :as => :grid, :columns => 2 do |photo|
  div link_to(image_tag("https://s3-us-west-2.amazonaws.com/hg-image/#{photo.id_num.downcase}.jpg"), admin_photo_path(photo))
  end

  # SHOW PAGE
   show do |photo|
      attributes_table do
        row :is_active
        row :id_num do
          link_to photo.id_num, photo_path(photo)
        end
        row :image do
          image_tag("https://s3-us-west-2.amazonaws.com/hg-image/#{photo.id_num.downcase}.jpg")
        end
        row :title
        # row :category_ids, :collection => Hash[Category.all.map{|b| [b.title,b.id]}]
        row 'Categories' do |xx|
           photo.categories.map(&:title).join("<br />").html_safe
        end

        row :artist_name
        row :year_taken
        row :rotating_keyword
        row :desc
        row :format
        row :show_bw_conversion
        row :featured_gallery
        row :camera
        row :film_type
        row :id
        row :slug
        row :qty_sold
      end
      # active_admin_comments
    end

    # EDIT/NEW PAGE
    form do |f|
      f.inputs "Status" do
        f.input :is_active, :label => "Photo is live?"
      end
      f.inputs "Main Details" do
        f.input :id_num
        f.input :title
        f.input :categories, :include_blank => false,  :input_html => { :size => 20, :multiple => true, :class => "xxxx" }, :collection => Category.all.order(title: :asc)
      end
      f.inputs "Description" do
        f.input :desc
      end
      f.inputs "Photo Options" do
        f.input :format, :include_blank => false
        f.input :show_bw_conversion
      end
      f.inputs "More Details" do
        f.input :artist_name
        f.input :year_taken
        f.input :camera
        f.input :film_type
      end
      f.inputs "Misc" do
        f.input :rotating_keyword
        f.input :featured_gallery
        f.input :qty_sold


      end
      f.actions
    end


end
