class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates :order,     presence: true
  validates :product,   presence: true
  validates :quantity,  numericality: { greater_than_or_equal_to: 0 }
end
