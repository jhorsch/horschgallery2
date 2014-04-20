class Order < ActiveRecord::Base
  # associations
  has_many :line_items, dependent: :destroy

  # validations
  validates_presence_of :first_name_ship

  # before actions
  before_save :titleize_params


  # methods
  def add_line_items_from_cart(shopping_cart)
    shopping_cart.line_items.each do |line_item|
      line_item.cart_id = nil
      line_items << line_item
    end
  end

  def titleize_params
     self.first_name_ship = first_name_ship.titleize
     self.last_name_ship = last_name_ship.titleize
     self.address1_ship = address1_ship.titleize
     self.address2_ship = address2_ship.titleize
     self.city_ship = city_ship.titleize

     self.first_name_bill = first_name_bill.titleize
     self.last_name_bill = last_name_bill.titleize
     self.address1_bill = address1_bill.titleize
     self.address2_bill = address2_bill.titleize
     self.city_bill = city_bill.titleize

     self.email = email.downcase

  end

end
