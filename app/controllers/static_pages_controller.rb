class StaticPagesController < ApplicationController

  # include CurrentCart
  # before_action :set_shopping_cart
  before_action :set_line_items, only: [:cart, :payment]

  def home
    top_gifts = ['a10','a5','a11','bw99','bw19', 'bw17']
    verticals = ['bw30','bw51','bw103','vint19','vint14','vint43']
    color_to_bw = ['2805','bw21']

    @featured = Photo.where(featured_gallery: [1..12]).order(:featured_gallery)
    @top_gifts = Photo.where(id_num: [top_gifts])
    @verticals = Photo.where(id_num: [verticals])
    @color_to_bw = Photo.where(id_num: [color_to_bw])
    @single = Photo.where(id_num: '3059')
  end

  def cart
  end

  def payment
  end


  def confirmation

  end



  private

    def set_line_items
      @line_items = Cart.find_by(id: cookies[:cart_id]).line_items
    end

end
