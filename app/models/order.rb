class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  validates_presence_of :first_name_ship

  def add_line_items_from_cart(shopping_cart)
    shopping_cart.line_items.each do |line_item|
      line_item.cart_id = nil
      line_items << line_item
    end
  end

end
