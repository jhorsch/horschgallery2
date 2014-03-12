class Photo < ActiveRecord::Base



  belongs_to :category
  validates :category_id, presence: true

  belongs_to :format
  validates :format_id, presence: true



end
