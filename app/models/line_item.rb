class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :order
  belongs_to :photo
  belongs_to :size
  belongs_to :mat
  belongs_to :frame

  before_save :determine_final_product

  def unit_price
    size.price + frame.price
  end

  def total_price
    unit_price * qty
  end

  def determine_final_product
    if size.name.last(4) == "Only"
      mat.name = 'No Mat'
      frame.name = 'No Frame'
    elsif size.name.last(3) == 'Mat'
      frame.name = 'No Frame'
    end
  end
end
