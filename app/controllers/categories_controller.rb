class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_page

  def index

  end

  def show
    @photos = @category.photos.where(is_active: true).paginate(:page => params[:page], :per_page => 24)
    @rotating_keywords = ['photo','print','picture','photograph','artwork','photography','wall-art']
    if request.path != category_path(@category)
      redirect_to @category, status: :moved_permanently
    end
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @category }
      else
        format.html { render action: 'new' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit!
    end

    def invalid_page
      logger.error "Attempted to access invalid photo page
        Controller: #{params[:controller]}
        Action: #{params[:action]}
        ID: #{params[:id]}"
      redirect_to error_url, notice: 'Invalid page'
    end


end
