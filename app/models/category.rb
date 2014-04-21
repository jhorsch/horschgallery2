class Category < ActiveRecord::Base

  has_many :category_photos
  has_many :photos, :through => :category_photos



  belongs_to :main_category


  has_many :category_mats
  has_many :mats, :through => :category_mats

  validates :is_active, inclusion: [true, false]
  validates  :title, :meta_title, :meta_desc, :alt_tag, :description, :main_category_id, presence: true
  validates :title, uniqueness: {:case_sensitive => false}


  scope :active, -> { where(is_active: true) }


  def self.active_category
    where(is_active: true)
  end



end
