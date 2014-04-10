class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :photo
  belongs_to :size
  belongs_to :mat
  belongs_to :frame

end
