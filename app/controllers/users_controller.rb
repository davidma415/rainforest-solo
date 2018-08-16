class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new

    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      flash[:notice] = "User has been registered."
      redirect_to products_path
    else
      flash[:notice] = "User was not saved. Please try again."
      render :new
    end
  end
end
