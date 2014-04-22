class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_page


  def index
  end

  def show
    @customer_viewed = Photo.customer_also_viewed(@photo.main_category)
    @rotating_keywords = Photo.rotating_keywords


    # initalize the session hash
    if session[:most_recent_viewed].nil?
      session[:most_recent_viewed] = []
    end
    # only add unique photo ids to the hash...might want to remove though
    unless session[:most_recent_viewed].include? params[:id]
      session[:most_recent_viewed] << params[:id]
    end
    # set local variable
    most_recent_viewed = session[:most_recent_viewed]
    # test whether array has more than 5 photos..if so remove the first element and reset the array
    if most_recent_viewed.count > 5
      most_recent_viewed.shift
      session[:most_recent_viewed] = most_recent_viewed
    end
    @recently_viewed = Photo.five_most_recent(most_recent_viewed)


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

  private
    def set_photo
      @photo = Photo.find_by(id: params[:id])
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
