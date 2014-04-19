class LineItemsController < ApplicationController

  # include CurrentCart
  # before_action :set_shopping_cart, only: [:create]
  before_action :set_line_item, only: [:destroy]


  def create
    @line_item = shopping_cart.line_items.build(line_item_params)
    if @line_item.save
      redirect_to "/shopping_cart", :flash => { :success => 'You have great taste in photography.  That is one of our favorites as well. Ok, who are we kidding, we like all of them!' }
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
