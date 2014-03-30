class Category < ActiveRecord::Base

  has_many :photos, through: :photo_categories
  has_many :photo_categories

  belongs_to :main_category


  # has_many :photos, dependent: :destroy

  has_many :category_mats
  has_many :mats, :through => :category_mats

  scope :active, -> { where(is_active: true) }


  def self.active_category
  where(is_active: true)
  end



end
