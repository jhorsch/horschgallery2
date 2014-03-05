module ApplicationHelper

def find_categories(main_category)

  Category.where(main_category: main_category)


end




end
