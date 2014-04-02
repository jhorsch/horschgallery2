class Category < ActiveRecord::Base

  has_many :category_photos
  has_many :photos, :through => :category_photos



  belongs_to :main_category


  has_many :category_mats
  has_many :mats, :through => :category_mats

  validates :title, uniqueness: { case_sensitive: true }


  scope :active, -> { where(is_active: true) }


  def self.active_category
    where(is_active: true)
  end



end
