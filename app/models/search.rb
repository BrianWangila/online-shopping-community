# frozen_string_literal: true

class Search < ApplicationRecord
  scope :order_by_count, -> { order(count: :desc) }
  has_many :products
  has_many :user_searches
  validates :search_term, presence: true

  after_create :crawl

  def crawl
    c = Crawler.new(search_term, id)
    c.amazon
    c.ebay
    c.jumia
  end
end
