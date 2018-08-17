class ReviewsController < ApplicationController
  before_action :ensure_logged_in, except: [:show, :index]
  before_action :load_review, only: [:edit, :update, :destroy]
  before_action :load_product, only: [:create, :edit, :update, :destroy]
  before_action :ensure_user_owns_review, only: [:edit, :update, :destroy]

  def create
    @review = Review.new
    @review.comment = params[:review][:comment]
    @review.product_id = params[:product_id]
    @review.user_id = current_user.id

    if @review.save
      flash[:notice] = "Your review was saved."
      redirect_to product_url(@product)
    else
      flash[:notice] = "There was an error with your review"
      render 'products/show'
    end
  end

  def edit
  end

  def update
    @review.comment = params[:review][:comment]
    if @review.save
      flash[:notice] = "Your review has been updated"
      redirect_to product_url(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    flash[:notice] = "Your review has been successfully deleted"
    redirect_to product_url(@product)
  end

  def load_review
    @review = Review.find(params[:id])
  end

  def load_product
    @product = Product.find(params[:product_id])
  end

  def ensure_user_owns_review
    unless current_user = @review.user
      flash[:alert] = "You did not write this review, please login as the correct user"
      redirect_to new_sessions_url
    end
  end
end
