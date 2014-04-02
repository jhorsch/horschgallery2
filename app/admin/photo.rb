ActiveAdmin.register Photo do

  menu :parent => "Content Management", :priority => 0

  config.sort_order = "created_at_desc"
  scope :active

  # FILTERS
  filter :categories, :as => :select, :collection =>  Category.all.order("title asc")
  filter :id_num
  filter :title
  filter :artist_name


  # PERMISSIONS
  permit_params :authenticity_token, :id, :id_num, :title, :artist_name, :year_taken, :is_active, :show_bw_conversion, :format_id, :rotating_keyword, :desc, category_ids: []

  #INDEX LAYOUTS
  index do
    column  "Prod#", :id_num
    column  :title
    column  ""
    column 'Categories' do |xx|
           photo.categories.map(&:title).join("<br />").html_safe
    end
    column  :created_at
    actions
  end

  index :as => :grid, :columns => 2 do |photo|
  div link_to(image_tag("https://s3-us-west-2.amazonaws.com/hg-image/#{photo.id_num.downcase}.jpg"), admin_photo_path(photo))
  end

  # SHOW PAGE
   show do |photo|
      attributes_table do
        row :is_active
        row :id_num
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
        f.input :categories, as: :check_boxes, :include_blank => false,  :input_html => { :size => 10, :multiple => true, :class => "xxxx" }, :collection => Category.all.order(title: :asc)


        f.input :artist_name
        f.input :year_taken
        f.input :rotating_keyword
      end
      f.inputs "Description" do
        f.input :desc
      end
      f.inputs "Photo Options" do
        f.input :format, :include_blank => false
        f.input :show_bw_conversion
      end
      f.actions
    end


end
