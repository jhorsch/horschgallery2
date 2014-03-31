class Photo < ActiveRecord::Base
  # belongs_to :category
  # validates :category_id, presence: true

  # has_many :photo_categories, :dependent => :destroy
  has_and_belongs_to_many :categories

  belongs_to :format
  validates :format_id, presence: true

  validates :title, presence: { presence: true, :message => "Please provide a title" }

  scope :active, -> { where(is_active: true) }


  def super_category
    self.categories.take.super_category
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

  def all_sizes
    self.format.sizes
  end

  def self.search(query)
    active.where("LOWER(title) LIKE ? OR LOWER(id_num) LIKE ? OR LOWER(id_num) LIKE ? ",
                "%#{query}%", "%#{query}", "%#{query}wf"
            )
  end
end
