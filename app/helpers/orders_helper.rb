module OrdersHelper
  def product_count(order)
    if order
      count = 0
      order.order_items.each do |order_item|
        count = count + order_item.quantity
      end
      count
    else
      0
    end
  end

  def format_date(date)
    date.strftime('%a, %B %e, %Y')
  end
end
