class Photo < ActiveRecord::Base

  # friendly_id gem
  include FriendlyId
  friendly_id :name, use: :slugged


  # associations
  has_many :line_items
  has_many :category_photos
  has_many :categories, :through => :category_photos
  belongs_to :format

  # friendly url

  # validations
  validates :is_active, :show_bw_conversion, inclusion: [true, false]
  validates :id_num, :title, :artist_name, :year_taken, :format_id, :desc, :rotating_keyword, :camera, :film_type, presence: true
  validates :id_num, :title, uniqueness: {:case_sensitive => false}


  # scopes
  scope :active, -> { where(is_active: true) }




  # database queries
  def self.rotating_keywords
    ['photo','print','picture','photograph','artwork','photography']
  end



  def self.search(query)
    query = query.downcase
    active.where("LOWER(title) LIKE ? OR LOWER(id_num) LIKE ?",
                "%#{query}%", "%#{query}")
  end

  def self.pull_five_most_recent(session_array)
    where(is_active: true, id: session_array).order('title asc')
  end


  # attribute formatting
  def super_category_title
    categories.take.super_category
  end

  def main_category_title
    categories.take.main_category.title
  end

  def mats
    categories.take.mats
  end

  def artist
    artist_name.titleize
  end

  def max_price
    format.sizes.maximum('price')
  end

  def max_price_size_id
    format.sizes.order('price DESC').first.try(:id)
  end

  def all_sizes
    format.sizes
  end

end
