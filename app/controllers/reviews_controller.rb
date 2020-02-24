class ReviewsController < ApplicationController
  before_action :find_cocktail, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.cocktail = @cocktail

    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end



  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def review_params
    params.require(:review).permit(:username, :content, :rating, photos: [])
  end
end