class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?, :current_order

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !!current_user
  end

  def current_order
    @current_order ||= Order.find(session[:order_id]) if session[:order_id]
  end

  def load_order
    @order = Order.find(session[:order_id])
  rescue ActiveRecord::RecordNotFound
    @order = Order.create(user: current_user, status: 'unsubmitted')
    session[:order_id] = @order.id
  end

  def require_user
    unless signed_in?
      flash[:info] = "Sorry, you'll need to log in to continue."
      redirect_to sign_in_path
    end
  end

  def require_order
    unless current_order
      flash[:danger] = "You need some items in your cart to continue."
      redirect_to root_path
    end
  end
end
