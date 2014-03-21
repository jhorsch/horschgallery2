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

def self.search(query)

  # where('id_num LIKE ? OR title LIKE ? OR desc LIKE ?', "#{query}" ,  "#{query}%wf" , "%#{query}%")

  where(" (is_active) LIKE ? AND
          LOWER(title) LIKE ? OR
          LOWER(id_num) LIKE ? OR
          LOWER(id_num) LIKE ? ",
          't',
          "%#{query}%",
          "%#{query}",
          "%#{query}wf"
          )


  # where("LOWER(id_num) LIKE ? OR LOWER(title) LIKE ? OR LOWER(desc) LIKE ?", "%#{query.downcase}%", "%#{query.downcase}%, "%#{query.downcase}%")


end





end
