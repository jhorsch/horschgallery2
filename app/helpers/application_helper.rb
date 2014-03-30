module ApplicationHelper


  @myarray = ['Chicago Black & White','Chicago Vintage','Chicago Panoramas','Chicago Cityscape','Chicago Landmarks']


  def find_sub_categories(category)
    Category.where(main_category: category, is_active: true)
  end

  def find_main_categories(main_category)
    MainCategory.where(title: main_category)
  end

  def pull_image(id_num)
    Photo.where(id_num: id_num)
  end

  def meta_title(page_title)
    content_for :title, page_title.to_s
  end

  def meta_desc(page_desc)
    content_for :meta_desc, page_desc.to_s
  end

end
