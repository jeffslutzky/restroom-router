class ReviewsController < ApplicationController

  def index
  end

  def edit
  end

  def destroy
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to root_path
    else
      # flash[:notice] = "and nobody is that interested in your business..."
      render :new
    end
  end

  def update
    @review = Review.update(review_params)
  end

  private 

  def review_params
    params.require(:review).permit(:comment, :rating, :public_park_id)
  end


end