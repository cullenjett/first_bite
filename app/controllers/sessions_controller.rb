class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully signed in as #{user.name}"
      redirect_to products_path
    else
      flash[:danger] = "Oops, your email or password was incorrect. Please try again."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil 
    flash[:info] = "You have successfully signed out"
    redirect_to products_path
  end
end
