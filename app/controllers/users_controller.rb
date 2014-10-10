class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "You have successfully signed in as #{@user.name}."
      redirect_to products_path
    else
      flash[:danger] = "Oops, something went wrong. Please fix the errors below."
      render :new
    end
  end

  def orders
    @user = User.find(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
