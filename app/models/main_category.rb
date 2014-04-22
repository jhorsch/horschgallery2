class MainCategory < ActiveRecord::Base
   # friendly_id gem
  include FriendlyId
  friendly_id :name, use: :slugged

  has_many :categories
  has_many :photos, :through => :categories

  scope :active, -> { where(is_active: true) }

  validates :is_active, inclusion: [true, false]
  validates :title, :meta_title, :meta_desc, :alt_tag, presence: true
  validates :title, uniqueness: {:case_sensitive => false}

  def self.customer_also_viewed(object)
    friendly.find(object.categories.take.main_category).photos.active.shuffle.take(5)
  end
end
