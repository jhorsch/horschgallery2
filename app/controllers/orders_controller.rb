class OrdersController < ApplicationController
  # before_action :set_line_items, only: :new

  def new
      # SET LINE ITEMS HERE FOR RENDER NEW
      @line_items = Cart.find_by(id: cookies[:cart_id]).line_items
      @feedback_options = Feedback.all

        # figure out difference between render and new
     if @line_items.empty?
        redirect_to root_url
     else
        @order = Order.new
        # flash[:succes] = 'Our https site is secure so your money is good here'
     end

  end


  def create

    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@shopping_cart)

    # if order saves and there are no credit card errors
    if @order.save_with_payment(params[:stripeToken],@order.grand_total_cents,@order.email)
      Cart.destroy(cookies[:cart_id])
      cookies[:cart_id] = nil
      OrderConfirmation.received(@order).deliver
      redirect_to '/confirmation'
      # render 'new'
    else
      render 'new'
      # redirect_to new_order_path
    end

    # charge = Stripe::Charge.create(
    #     :amount => @order.grand_total_cents , # amount in cents, again
    #     :currency => "usd",
    #     :card => token,
    #     :description => @order.id
    # )
    # rescue Stripe::CardError => e
    # flash[:error] = e.message

  end

    private
    def set_line_items
      @line_items = Cart.find_by(id: cookies[:cart_id]).line_items
    end
    def order_params
      params.require(:order).permit!
    end



end
