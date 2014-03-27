class Photo < ActiveRecord::Base
  belongs_to :category
  validates :category_id, presence: true

  belongs_to :format
  validates :format_id, presence: true

  scope :active, -> { where(is_active: true) }

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
