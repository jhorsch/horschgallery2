class Mat < ActiveRecord::Base

  has_many :category_mats
  has_many :categories, :through => :category_mats

  def price
    0
  end

end
