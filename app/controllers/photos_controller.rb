class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_page


  def index
  end

  def show
    @customer_viewed = MainCategory.customer_also_viewed(@photo)
    @rotating_keywords = Photo.rotating_keywords
    if session[:most_recent_viewed].nil?
      session[:most_recent_viewed] = []
    end
    unless session[:most_recent_viewed].include? params[:id]
      photo_id = Photo.friendly.find(params[:id]).id
      session[:most_recent_viewed] << photo_id
    end
    most_recent_viewed = setup_most_recent(session[:most_recent_viewed])
    @recently_viewed = Photo.pull_five_most_recent(most_recent_viewed)

    if request.path != photo_path(@photo)
      redirect_to @photo, status: :moved_permanently
    end



  end

  def new
    @photo = Photo.new
  end

  def edit
  end

  def create
    @photo = Photo.new(photo_params)

      if @photo.save
        redirect_to @photo, notice: 'Photo was successfully created.'
      else
         render 'new'
      end

  end

  def update
      if @photo.update(photo_params)
        redirect_to @photo, notice: 'Photo was successfully updated.'
      else
        render 'edit'
      end
  end

  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end

 def search
    @query  = params[:q]
    @photos = Photo.search(@query).paginate(:page => params[:page], :per_page => 24)
      render 'search'
 end





# helper methods for the contoller
def setup_most_recent(array)
  num_items = array.count
  array = session[:most_recent_viewed]
  if num_items >= 6
    return array[num_items-6..num_items-2]
  elsif num_items == 1
    return  nil
  else
    return array[0..num_items-2]
  end
end


  private
    def set_photo
      @photo = Photo.friendly.find(params[:id])
    end

    def photo_params
      # if current_user&& currrent_user_admin?
        params.require(:photo).permit!
      # else
        # params.require(:photo).permit(xxxx)
    end

     #404 error for invalid page
    def invalid_page
      logger.error "Attempted to access invalid photo page
        Controller: #{params[:controller]}
        Action: #{params[:action]}
        ID: #{params[:id]}"
      redirect_to error_url, notice: 'Invalid page'
    end
end
