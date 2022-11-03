# frozen_string_literal: true

module CrawlerHelper
  def count_stars(stars)
    s = stars.scan(/[1-5]/)
    if s[1] == '.'
      s = s.slice(0, 3)
      s.join('').to_f.round
    else
      s.first.to_i
    end
  end

  def float_price(price)
    p=price.scan(/[0-9.,]+/).first
    if p
      p.gsub(/[,]/,"").to_f
    else
      0
    end
  end

  def dollar_price(price)
    float_price(price) * 100
  end

  def calculate_price_index(price, index)
    (2 * index) + price / 10
  end
end
