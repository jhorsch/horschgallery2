class Category < ActiveRecord::Base

   # friendly_id gem
  extend FriendlyId
  friendly_id :title, use: :history

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

  # associations
  has_many :category_photos
  has_many :photos, :through => :category_photos
  belongs_to :main_category
  has_many :category_mats
  has_many :mats, :through => :category_mats

  # validations
  validates :is_active, inclusion: [true, false]
  validates  :title, :meta_title, :meta_desc, :alt_tag, :description, :main_category_id, presence: true
  validates :title, uniqueness: {:case_sensitive => false}

  # scopes
  scope :active, -> { where(is_active: true) }

  # methods
  def self.active_category
    where(is_active: true)
  end

  def self.exclude_best_sellers
    where.not(main_category_id: [1,15,20])
  end





end
