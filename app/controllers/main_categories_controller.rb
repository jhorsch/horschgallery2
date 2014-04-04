class MainCategoriesController < ApplicationController
  before_action :set_main_category, only: [:show, :edit, :update, :destroy]


  def index
    @main_categories = MainCategory.all
  end

  def show
    @photos = @main_category.photos.where(is_active: true)
  end


  def new
    @main_category = MainCategory.new
    # if url.includes '#'
    #     redirect_to
    # else
    #     render new
    # end
    redirect_to new
  end


  def edit
  end


  def create
    @main_category = MainCategory.new(main_category_params)

    respond_to do |format|
      if @main_category.save
        format.html { redirect_to @main_category, notice: 'Main category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @main_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @main_category.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @main_category.update(main_category_params)
        format.html { redirect_to @main_category, notice: 'Main category was successfully updated.' }
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
      format.html { redirect_to main_categories_url }
      format.json { head :no_content }
    end
  end

  private
    def set_main_category
      @main_category = MainCategory.find(params[:id])
    end

    def main_category_params
      params.require(:main_category).permit!
    end
end
