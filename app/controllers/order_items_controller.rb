class OrderItemsController < ApplicationController
  def create
    load_order
    @order_item = @order.order_items.find_or_initialize_by(product_id: params[:product_id])
    @order_item.quantity += 1
    @order_item.save
    flash[:success] = 'Item added to cart.'
    redirect_to :back
  end

  private

  def order_item_params
    params.require(:order_item).permit(
      :user_id,
      :product_id,
      )
  end
end
