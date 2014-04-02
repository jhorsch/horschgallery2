class CategoryPhoto < ActiveRecord::Base

  belongs_to :photo
  belongs_to :category

  # validates_presence_of :photo
  # validates_presence_of :category
end
