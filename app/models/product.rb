class Product < ActiveRecord::Base
  has_many :product_categories
  has_many :categories, through: :product_categories

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" },
                            default_url: "stock_product.jpg"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :title,         presence: true,
                            uniqueness: true

  validates :description,   presence: true

  validates :price,         presence: true,
                            numericality: { :greater_than_or_equal_to => 0 }
end
