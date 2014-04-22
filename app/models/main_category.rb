class MainCategory < ActiveRecord::Base
   # friendly_id gem
  extend FriendlyId
  friendly_id :title, use: :history

def should_generate_new_friendly_id?
  slug.blank? || title_changed?
end

  # associations
  has_many :categories
  has_many :photos, :through => :categories

  # scopes
  scope :active, -> { where(is_active: true) }

  # validations
  # validates :is_active, inclusion: [true, false]
  # validates :title, :meta_title, :meta_desc, :alt_tag, presence: true
  # validates :title, uniqueness: {:case_sensitive => false}

  # methods
  def self.customer_also_viewed(object)
    friendly.find(object.categories.take.main_category).photos.active.shuffle.take(5)
  end
end
