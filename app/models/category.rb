class Category < ActiveRecord::Base
  has_many :photos, dependent: :destroy

  has_many :category_mats
  has_many :mats, :through => :category_mats


  def self.active_category
  where(is_active: true)
  end

end
