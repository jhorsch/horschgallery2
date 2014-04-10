class StaticPagesController < ApplicationController

  def home
    @photos = Photo.where(is_active: true).sample(20)

    top_gifts = ['a10','a5','a11','bw99','bw19', 'bw17']
    verticals = ['bw30','bw51','bw103','vint19','vint14','vint43']
    color_to_bw = ['2805','bw21']

    @featured = Photo.where(featured_gallery: [1..12]).order(:featured_gallery)
    @top_gifts = Photo.where(id_num: [top_gifts])
    @verticals = Photo.where(id_num: [verticals])
    @color_to_bw = Photo.where(id_num: [color_to_bw])
    @single = Photo.where(id_num: '2910')
  end

  def photographers

  end

  def shopping_cart

    @line_items = Order.first.line_items
    @tiered_shippings = TieredShipping.all.order('price asc')

  end

  def confirmation

  end


end
