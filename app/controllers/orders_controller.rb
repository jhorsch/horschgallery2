class OrdersController < ApplicationController

  def new
     @line_items = Cart.find_by(id: cookies[:cart_id]).line_items
     @order = Order.new
  end

  def create

     @order = Order.new(order_params)
    if @order.save
      redirect_to '/confirmation'
    else
      render 'payment'
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
    def order_params
      params.require(:orders).permit!
    end



end
