# frozen_string_literal: true

class SearchesController < ApplicationController
  before_action :authorize, only: [:index,:history]

  def create
    term = params[:search_term].downcase
    search = Search.find_by(search_term: term)

    if search && search.products.length.zero?
      search.update(count: 1)
      search.crawl
    elsif search
      search.update(count: search.count + 1)
    end

    search ||= Search.create(search_term: term)

    UserSearch.create(user_id: current_user.id, search_id: search.id) if logged_in?

    render json: search.products, status: :ok
  end

  def history
    render json: current_user.searches.uniq(&:search_term).slice(0,10), status: :ok
  end


  def trends
    render json: Search.all.order_by_count.limit(12).uniq(&:search_term)
  end

  # def index
  #   render json: current_user.searches.uniq.pluck(:search_term)
  # end
end
