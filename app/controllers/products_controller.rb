class ProductsController < ApplicationController
before_action :search_product, only: [:index, :search]

  def index
    @products = Product.all
  end

  def search
    @results = @p.result.includes(:category)
  end

  private
  def search_product
    @p = Product.ransack(params[:q])
  end
end
