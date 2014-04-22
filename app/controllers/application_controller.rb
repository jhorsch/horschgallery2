class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  before_action :set_shopping_cart
  helper_method :shopping_cart

  def shopping_cart
    @shopping_cart
  end

  protected

  def set_shopping_cart
    @shopping_cart = Cart.find_by(id: cookies[:cart_id])
    unless @shopping_cart
       @shopping_cart = Cart.create
       cookies[:cart_id] = @shopping_cart.id
    end
  end



end
