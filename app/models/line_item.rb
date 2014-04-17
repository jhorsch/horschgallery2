class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :photo
  belongs_to :size
  belongs_to :mat
  belongs_to :frame


  def unit_price
    size.price + frame.price
  end

  def total_price
    unit_price * qty
  end
end
