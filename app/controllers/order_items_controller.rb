class OrderItemsController < ApplicationController
  def create
    @order_item = OrderItem.new(order_item_params)
    redirect_to @order
  end

  private

  def order_item_params
    params.require(:order_item).permit(
      :user_id,
      :product_id,
      )
  end
end
