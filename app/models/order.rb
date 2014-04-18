class Order < ActiveRecord::Base
  has_many :line_items

  validates_presence_of :first_name_ship

  def add_line_items_from_cart(shopping_cart)
    shopping_cart.line_items.each do |line_item|
      line_items << line_item
    end
  end

end
