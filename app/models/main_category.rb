class MainCategory < ActiveRecord::Base
  has_many :categories
  has_many :photos, :through => :categories

  scope :active, -> { where(is_active: true) }

  validates :is_active, inclusion: [true, false]
  validates :title, :meta_title, :meta_desc, :alt_tag, presence: true
  validates :title, uniqueness: {:case_sensitive => false}
end
