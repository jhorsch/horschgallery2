class StaticPagesController < ApplicationController

  def home

    @photos = Photo.where(is_active: true).sample(20)

    featured = ['4094','bw130','1424','2935','4122','2900','1423','3059','4113']
    top_gifts = ['a10','a5','a11','bw99','bw19', 'bw17']
    verticals = ['bw30','bw51','bw103','vint19','vint14','vint43']
    color_to_bw = ['2805','bw21']

    @featured = Photo.where(id_num: [featured])
    @top_gifts = Photo.where(id_num: [top_gifts])
    @verticals = Photo.where(id_num: [verticals])
    @color_to_bw = Photo.where(id_num: [color_to_bw])
    @single = Photo.where(id_num: '2910')

  end

  def photographers

  end

  def mats

  end

  def compare_sizes
  end


  def frames

    # @myphoto = pull_image('2805')

  end

  def shopping_cart

  end

  def confirmation

  end


end
