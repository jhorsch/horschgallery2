module ApplicationHelper

def find_categories(main_category)

  Category.where(main_category: main_category, is_active: true)


end

# def pull_image(id_num)

#   Photo.where(id_num: id_num)

# end



def meta_title(page_title)
  content_for :title, page_title.to_s
end

def meta_desc(page_desc)
  content_for :meta_desc, page_desc.to_s
end

end
