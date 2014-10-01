class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    order_items = params[:order][:order_items_attributes]

    order_items.each do |key, value|
      order_item = OrderItem.find(value['id'])

      if value['quantity'].to_i == 0
        order_item.destroy
      else
        order_item.update_attributes(quantity: value['quantity'].to_i)
      end
    end

    flash[:success] = 'Your cart was updated.'
    redirect_to @order
  end
end
