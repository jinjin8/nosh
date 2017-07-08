class ReviewsController < ApplicationController
  before_action :authorize, only: [:new, :create, :edit]

  def secret
  end

  def new
    @service = Service.find(params[:service_id])
    @review = @service.reviews.new
  end

  def create
    @service = Service.find(params[:service_id])
    @review = @service.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Your review was successfully added!"
      redirect_to service_path(@review.service)
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
    @service = @review.service
  end

  def edit
    @review = Review.find(params[:id])
    @service = @review.service
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Your review was successfully updated!"
      redirect_to service_path(@review.service)
    else
      render :edit
    end
  end

  def destroy
    @service = Review.find(params[:id]).service
    if Review.find(params[:id]).destroy
      flash[:notice] = "Review successfully deleted!"
    redirect_to service_path(@service)
    end
  end

private
  def review_params
    params.require(:review).permit(:author, :content, :user_id, :service_id)
  end
end
