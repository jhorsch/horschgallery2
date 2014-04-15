class Order < ActiveRecord::Base
  has_many :line_items

  def subtotal_price
    line_items.empty? ? 0 : line_items.map(&:price).reduce(&:+)
  end

  def shipping_price
    TieredShipping.where("lower < ? AND upper >= ?", subtotal_price, subtotal_price).first.try(:price) || 0
  end

  def grand_total_price
    subtotal_price + shipping_price
  end

end
