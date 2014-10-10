class OrdersController < ApplicationController
  before_action :require_order, only: [:submit]
  before_action :require_user, only: [:submit]

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])

    if params['update_cart']
      update_order_item_quantities
      flash[:success] = 'Your cart was updated.'
      redirect_to @order
    elsif params['empty_cart']
      delete_order
      flash[:info] = 'Your cart has been cleared out.'
      redirect_to root_path
    end
  end#update

  def submit
    if current_order.update(user: current_user, status: 'submitted')
      redirect_to order_confirmation_path
    else
      flash[:error] = 'Oops, something went wrong. Your order did not submit.'
      redirect_to :back
    end
  end

  def confirm

  end

  private

  def update_order_item_quantities
    order_items = params[:order][:order_items_attributes]

    order_items.each do |key, value|
      order_item = OrderItem.find(value['id'])
      if value['quantity'].to_i == 0
        order_item.destroy
      else
        order_item.update_attributes(quantity: value['quantity'].to_i)
      end
    end
  end

  def delete_order
    @order.destroy
    session[:order_id] = nil
  end
end
