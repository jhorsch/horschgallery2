class LineItemsController < ApplicationController

  # include CurrentCart
  # before_action :set_shopping_cart, only: [:create]
  before_action :set_line_item, only: [:destroy]


  def create
    @line_item = shopping_cart.line_items.build(line_item_params)
    if @line_item.save
      if shopping_cart.line_items.count == 1
        redirect_to "/shopping_cart", :flash => { :success => "We like that photograph as well.&nbsp;&nbsp;It's one of our favorites.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ok, we admit.&nbsp;&nbsp;They are all our favorites!" }
      elsif shopping_cart.line_items.count == 2
        redirect_to "/shopping_cart", :flash => { :success => "Another great choice.  You have quite the taste in photography." }
      elsif shopping_cart.line_items.count == 3
        redirect_to "/shopping_cart", :flash => { :success => "Wow, you are really starting to build quite a collection of beautiful photographs" }
      elsif shopping_cart.line_items.count == 4
        redirect_to "/shopping_cart", :flash => { :success => "xxx" }
      else
        redirect_to "/shopping_cart", :flash => { :success => "yyy" }
      end
    else
      redirect_to photo_url(@line_item.photo), notice: 'Photo was not added'
    end
  end

  def destroy
    @line_item.destroy
    redirect_to "/shopping_cart"
  end

  private

  def set_line_item
    @line_item = shopping_cart.line_items.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(
      :size_id, :mat_id, :frame_id, :convert_to_bw, :photo_id, :qty)
  end
end
