class Mat < ActiveRecord::Base

  has_many :category_mats
  has_many :categories, :through => :category_mats


end
