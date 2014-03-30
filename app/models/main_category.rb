class MainCategory < ActiveRecord::Base
  has_many :categories
  has_many :photos, through: :categories

  scope :active, -> { where(is_active: true) }
end
