class MainCategory < ActiveRecord::Base
  has_many :categories
  has_many :photos, :through => :categories

  scope :active, -> { where(is_active: true) }

  # validates :title, :is_active, :meta_title, :meta_desc, :alt_tag, presence: true
  # validates :title, uniqueness: true
end
