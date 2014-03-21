class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]



  def index

      @photos = Photo.order("title ASC").paginate(:page => params[:page], :per_page => 24)

  end


  def show

        @customer_viewed = Photo.where(main_category: @photo.main_category, is_active: true).shuffle.take(5)
        @recently_viewed = Photo.where(is_active: true).sample(5)

         @recently_viewed = Photo.where(is_active: true).sample(5)



        if @photo.nil?
          flash.now[:alert] = "Your photo was not found"
          @photos = Photo.all
          render "index"
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

    @query  = params[:query]
    @photos = Photo.search(@query).paginate(:page => params[:page], :per_page => 24)
      render 'search'

 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title)
    end
end

# def update
#     respond_to do |format|
#       if @photo.update(photo_params)
#         format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
#         format.json { head :no_content }
#       else
#         format.html { render action: 'edit' }
#         format.json { render json: @photo.errors, status: :unprocessable_entity }
#       end
#     end
#   end
