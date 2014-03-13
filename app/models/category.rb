class Category < ActiveRecord::Base
  has_many :photos, dependent: :destroy

  has_many :category_mats
  has_many :mats, :through => :category_mats



end
