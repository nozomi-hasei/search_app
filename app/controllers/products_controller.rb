class ProductsController < ApplicationController
  before_action :search_product, only: [:index, :search]

  def index
    @products = Product.all
    set_product_column
    set_category_column
  end

  def search
    @results = @p.result.includes(:category)
  end

  private
  def search_product
    @p = Product.ransack(params[:q])
  end

  def set_product_column
    @product_name = Product.select("name").distinct
    @product_size = Product.select("size").distinct
    @product_status = Product.select("status").distinct
  end

  def set_category_column
    @category_name = Category.select("name").distinct
  end
end
