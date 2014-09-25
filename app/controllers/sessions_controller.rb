class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfuly signed in as #{user.name}"
      redirect_to products_path
    else
      flash[:danger] = "Oops, your email or password was incorrect. Please try again."
      render :new
    end
  end
end
