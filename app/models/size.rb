class Size < ActiveRecord::Base

   belongs_to :format
   validates :format_id, presence: true

end
