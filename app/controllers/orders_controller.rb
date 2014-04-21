class OrdersController < ApplicationController
  before_action :set_line_items, only: :new

  def new

     if @line_items.empty?
        redirect_to root_url
     else
        @order = Order.new
        @feedback_options = Feedback.all
        # flash[:succes] = 'Our https site is secure so your money is good here'
     end

  end

  def create

     @order = Order.new(order_params)
     @order.add_line_items_from_cart(@shopping_cart)

    if @order.save
      Cart.destroy(cookies[:cart_id])
      cookies[:cart_id] = nil
      # OrderConfirmation.received(@order).deliver
      redirect_to '/confirmation'
    else
      # redirect_to new_order_path
      # render new
      redirect_to root_url

    end

    # STRIPE STUFF
     # Amount in cents
    #   @amount = 500

    #   customer = Stripe::Customer.create(
    #     :email => 'example@stripe.com',
    #     :card  => params[:stripeToken]
    #   )

    #   charge = Stripe::Charge.create(
    #     :customer    => customer.id,
    #     :amount      => @amount,
    #     :description => 'Rails Stripe customer',
    #     :currency    => 'usd'
    #   )

    # rescue Stripe::CardError => e
    #   flash[:error] = e.message
    #   redirect_to charges_path

  end

    private
    def set_line_items
      @line_items = Cart.find_by(id: cookies[:cart_id]).line_items
    end
    def order_params
      params.require(:order).permit!
    end



end
