class SearchController < ApplicationController
  def index
  end

  def new
  end

  def show

        @query  = params[:search]
       @photos = Photo.search(@query).order("id_num DESC").paginate(:page => params[:page], :per_page => 12)


  end
end



