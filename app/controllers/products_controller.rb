class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :description, :inventory]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def description
    # @product_description = @product.description
    render plain: @product.description
  end

  def inventory
    render plain: @product.inventory > 0 ? "true" : "false"
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :inventory, :price)
    end
end
