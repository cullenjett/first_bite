class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:success] = "You've successfully created a new product."
      redirect_to new_product_path
    else
      flash[:danger] = "Oops, something went wrong. Please fix the errors below."
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:title,
                                    :description,
                                    :price)
  end
end
