class OrderItemsController < ApplicationController
  before_action :load_order, only: [:create]

  def create
    @order_item = @order.order_items.find_or_initialize_by(product_id: params[:product_id])
    @order_item.quantity += 1
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
