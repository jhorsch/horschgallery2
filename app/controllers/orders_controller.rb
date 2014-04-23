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
    token = params[:stripeToken]
    grand_total_cents = @order.grand_total_cents


    # charge = Stripe::Charge.create(
    #     :amount => @order.grand_total_cents , # amount in cents, again
    #     :currency => "usd",
    #     :card => token,
    #     :description => @order.id
    # )
    # rescue Stripe::CardError => e
    # flash[:error] = e.message


    # if order saves and there are no credit card errors
    if @order.save_with_payment(token,grand_total_cents,@order.id)
      Cart.destroy(cookies[:cart_id])
      cookies[:cart_id] = nil
      OrderConfirmation.received(@order).deliver
      redirect_to '/confirmation'
    else
      # render new    **this isnt working
      redirect_to root_url
    end

  end

    private
    def set_line_items
      @line_items = Cart.find_by(id: cookies[:cart_id]).line_items
    end
    def order_params
      params.require(:order).permit!
    end



end
