class CartController < ApplicationController
  # PUT /cart/add
  def add
    line_item = shopping_cart.line_items.build(line_item_params)
    if line_item.save
      redirect_to "/shopping_cart", notice: "You've successfully added this item to your shopping cart"
    end
  end

  def line_item_params
    params.require(:line_item).permit(
      :size_id, :mat_id, :frame_id, :convert_to_bw, :photo_id, :qty
    )
  end

  def destroy
    @line_item = LineItem.find_by(id: params[:id])
    @line_item.destroy
    redirect_to "/shopping_cart", notice: "You've successfully deleted that line item"

  end

end
