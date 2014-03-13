class Photo < ActiveRecord::Base



  belongs_to :category
  validates :category_id, presence: true

  belongs_to :format
  validates :format_id, presence: true


  def artist
    self.artist_name.titleize
  end

  def max_price
    self.format.sizes.maximum('price')
  end

  def all_sizes
    self.format.sizes
  end




end
