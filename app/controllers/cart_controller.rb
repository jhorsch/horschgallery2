class CartController < ApplicationController

  # PUT /cart/add
  def add
    line_item = shopping_cart.line_items.build(line_item_params)
    if line_item.save
      redirect_to "/shopping_cart"
    end
  end

  def destroy
    @line_item = shopping_cart.line_items.find(params[:id])
    @line_item.destroy
    redirect_to "/shopping_cart"
  end

 def line_item_params
  params.require(:line_item).permit(
    :size_id, :mat_id, :frame_id, :convert_to_bw, :photo_id, :qty
  )
 end

end
