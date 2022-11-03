# frozen_string_literal: true

class ProductsController < ApplicationController
  def show
    product = Product.find_by(id: params[:id])

    render json: product, status: :ok
  end

  def trending
    @search = Search.find_by(id: params[:search_id])

    render json: @search.products
  end

  def single
    product = @search.find_by(id: params[:id])
    render json: product
  end

  def toptrends
    render json: Search.all.order_by_count.limit(1).first.products
  end
end
