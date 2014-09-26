class AddIndexesToOrdersAndOrderItems < ActiveRecord::Migration
  def change
    add_index :orders, :user_id, :name => 'orders_on_user_id_index'
    add_index :order_items, :order_id, :name => 'order_items_on_order_id_index'
    add_index :order_items, :product_id, :name => 'order_items_on_product_id_index'
  end
end
