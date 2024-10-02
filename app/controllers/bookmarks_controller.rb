class BookmarksController < ApplicationController
  before_action :set_banner_url

  def new
    @category = Category.find(params[:category_id])
    @bookmark = Bookmark.new
  end

  def create
    @category = Category.find(params[:category_id])
    @bookmark = Bookmark.new(params.require(:bookmark).permit(:comment, :recipe_id))
    @bookmark.category = @category
    if @bookmark.save
      redirect_to category_path(@category), status: :see_other
    else
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @category = @bookmark.category
    @bookmark.destroy
    redirect_to category_path(@category), status: :see_other
  end

  private

  def set_banner_url
    @banner_image_url = helpers.image_url("food/food-ingredients-banner-img.jpg")
  end
end
