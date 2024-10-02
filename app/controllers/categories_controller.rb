class CategoriesController < ApplicationController
  before_action :set_banner_url

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params.require(:category).permit(:name, :photo))
    # ??? Cloudinary::Uploader.upload()
    if @category.save
      redirect_to category_path(@category), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, status: :see_other
  end

  private

  def set_banner_url
    @banner_image_url = helpers.image_url("food/food-ingredients-banner-img.jpg")
  end
end
