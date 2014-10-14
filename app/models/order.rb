class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
  belongs_to :user

  accepts_nested_attributes_for :order_items

  scope :sort_desc, -> { order('updated_at DESC') }

  def total
    subtotals = []
    order_items.each do |item|
      subtotals << item.subtotal
    end
    subtotals.inject(&:+)
  end
end#Order
