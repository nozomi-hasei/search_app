class ProductsController < ApplicationController
  before_action :search_product, only: [:index, :search]

  def index
    @products = Product.all
    set_product_column
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
  end
end
