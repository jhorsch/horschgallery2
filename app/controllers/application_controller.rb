class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_shopping_cart_order

  def shopping_cart
    @shopping_cart_order
  end
  helper_method :shopping_cart



  protected

  def set_shopping_cart_order
    @shopping_cart_order = Order.find_by(id: cookies[:order_id])

    unless @shopping_cart_order
      @shopping_cart_order = Order.create
      cookies[:order_id] = @shopping_cart_order.id
    end
  end

end
