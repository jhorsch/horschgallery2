class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    @customer_viewed = Photo.where(main_category: @photo.main_category, is_active: true).shuffle.take(5)
    @recently_viewed = Photo.where(is_active: true).sample(5)
    @rotating_keywords = ['photo','print','picture','photograph','artwork','photography','wall-art']
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
end
