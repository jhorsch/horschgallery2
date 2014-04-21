class Photo < ActiveRecord::Base
  # belongs_to :category
  # validates :category_id, presence: true

  has_many :line_items
  has_many :category_photos
  has_many :categories, :through => :category_photos

  belongs_to :format

  validates :is_active, :show_bw_conversion, inclusion: [true, false]

  validates :id_num, :title, :artist_name, :year_taken, :format_id, :desc, :rotating_keyword, :camera, :film_type, presence: true
  validates :id_num, :title, uniqueness: {:case_sensitive => false}

  scope :active, -> { where(is_active: true) }


  def super_category_title
    self.categories.take.super_category
  end


  def main_category_title
    self.categories.take.main_category.title
  end

  def category_title

  end

  def mats
    self.categories.take.mats
  end

  def artist
    self.artist_name.titleize
  end

  def max_price
    self.format.sizes.maximum('price')
  end

  def max_price_size_id
    self.format.sizes.order('price DESC').first.try(:id)
  end

  def all_sizes
    self.format.sizes
  end

  def self.search(query)
    query = query.downcase
    active.where("LOWER(title) LIKE ? OR LOWER(id_num) LIKE ?",
                "%#{query}%", "%#{query}"
            )
  end
end
