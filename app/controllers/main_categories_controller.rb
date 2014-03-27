class MainCategoriesController < ApplicationController

  before_action :set_main_category, only: [:show, :edit, :update, :destroy]

  def index

  end


  def show

    @photos = @main_category.photos.where(is_active: true)
  end

  def new
    @main_category = MainCategory.new
  end

  def edit
  end


  def create
    @main_category = MainCategory.new(category_params)

    respond_to do |format|
      if @main_category.save
        format.html { redirect_to @main_category, notice: 'MainCategory was successfully created.' }
        format.json { render action: 'show', status: :created, location: @main_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @main_category.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @main_category.update(category_params)
        format.html { redirect_to @main_category, notice: 'MainCategory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @main_category.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @main_category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_category
      @main_category = MainCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:title)
    end



end
