class Photo < ActiveRecord::Base
  belongs_to :category
  validates :category_id, presence: true

  belongs_to :format
  validates :format_id, presence: true

  scope :active, -> { where(is_active: true) }

  def artist
    artist_name.titleize
  end

  def max_price
    format.sizes.maximum('price')
  end

  def all_sizes
    format.sizes
  end

  def self.search(query)
    active.where("title ILIKE ? OR id_num ILIKE ? OR id_num ILIKE ? ", "%#{query}%", "%#{query}", "%#{query}wf")
  end
end
