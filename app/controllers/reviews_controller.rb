class ReviewsController < ApplicationController
  def create
    @review = Review.new
    @product = Product.find(params[:product_id])
    @review.comment = params[:review][:comment]
    @review.product_id = params[:product_id]

    if @review.save
      flash[:notice] = "Your review was saved."
      redirect_to product_url(@product)
    else
      flash[:notice] = "There was an error with your review"
      render 'products/show'
    end
  end

  def edit
    @review = Review.find(params[:id])
    @product = Product.find(params[:product_id])
  end

  def update
    @review = Review.find(params[:id])
    @product = Product.find(params[:product_id])
    @review.comment = params[:review][:comment]
    if @review.save
      flash[:notice] = "Your review has been updated"
      redirect_to product_url(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @product = Product.find(params[:product_id])
    @review.destroy
    flash[:notice] = "Your review has been successfully deleted"
    redirect_to product_url(@product)
  end
end
