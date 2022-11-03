# frozen_string_literal: true

require 'uri'
require 'openssl'
require 'nokogiri'
require 'net/http'

class Crawler
  include CrawlerHelper

  def initialize(search, search_id)
    # key = '9lSwt8nLosyS3gbo5mUswDFEXIjLGAgf'
    key="tXd37busEtTlWXfseoQVmWzqDu38nW1k"

    @url_jumia = URI("https://api.webscrapingapi.com/v1?url=https%3a%2f%2fwww.jumia.co.ke%2fcatalog%2f%3fq%3d#{search}&api_key=#{key}&render_js=1&wait_until=networkidle2")
    @url_amazon = URI("https://api.webscrapingapi.com/v1?url=https%3a%2f%2fwww.amazon.com%2fs%3fk%3d#{search}&api_key=#{key}&render_js=1&wait_until=domcontentloaded")
    @url_ebay = URI("https://api.webscrapingapi.com/v1?url=https%3a%2f%2fwww.ebay.com%2fsch%2fi.html%3f_from%3dR40%26_trksid%3dp2380057.m570.l1313%26_nkw%3d#{search}&api_key=#{key}")

    @search_id = search_id
    @search=search
  end

  def response(url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request = Net::HTTP::Get.new(url)

    data(http.request(request))
  end

  def data(res)
    browser_html = res.read_body
    parsed_page = Nokogiri::HTML(browser_html)
  end

  def jumia
    articles = response(@url_jumia).xpath("//div[@class='-paxs row _no-g _4cl-3cm-shs']/article/a")
    raw = articles.map.with_index do |product, index|
      price = product.xpath(".//div[@class='prc']/text()").to_s
      product = {
        image_url: product.xpath(".//img[@class='img']").attr('data-src').to_s,
        name: product.xpath(".//div[@class='info']/h3/text()").to_s,
        price: price,
        price_before_discount: product.xpath(".//div[@class='old']/text()").to_s,
        discount: product.xpath(".//div[@class='bdg _dsct _sm']/text()").to_s,
        ratings: count_stars(product.xpath(".//div[@class='stars _s']/text()").to_s),
        rated_products: product.xpath(".//div[@class='rev']/text").to_s.scan(/\d+/).first.to_i,
        shop: 'jumia',
        price_index: calculate_price_index(float_price(price), index),
        search_id: @search_id,
        product_url: "https://www.jumia.co.ke/catalog/?q=#{@search}",
        price_normal: float_price(price)
      }
    end.slice(0, 8)
    create_products(raw)
  end

  def ebay
    cards = response(@url_ebay).xpath("//div[@class='s-item__wrapper clearfix']")
    raw = cards.map.with_index do |card, index|
      price = card.xpath(".//span[@class='s-item__price']/text()").to_s
      {
        image_url: card.xpath(".//img[@class='s-item__image-img']").attr('src').to_s,
        name: card.xpath(".//span[@role='heading']/text()").to_s,
        price: price,
        price_before_discount: card.xpath(".//span[@class='STRIKETHROUGH']/text()").to_s,
        discount: card.xpath(".//span[@class='BOLD']/text()").to_s,
        ratings: '',
        rated_products: '',
        return_policy: card.xpath(".//span[@class='s-item__free-returns s-item__freeReturnsNoFee']/text()").to_s,
        shipping: card.xpath(".//span[@class='s-item__shipping s-item__logisticsCost']/text()").to_s,
        coupon_discount: card.xpath(".//span[@class='NEGATIVE BOLD']/text()").to_s,
        shop: 'ebay',
        price_index: calculate_price_index(dollar_price(price), index),
        search_id: @search_id,
        product_url: "https://www.ebay.com/sch/i.html?_from=R40&_trksid=p2380057.m570.l1313&_nkw=#{@search}",
        price_normal: dollar_price(price)
      }
    end.slice(1, 9)
    create_products(raw)
  end

  def amazon
    articles = response(@url_amazon).xpath(".//div[@class='a-section a-spacing-base']")
    raw = articles.map.with_index do |product, index|
      price = product.xpath(".//span[@class='a-price']/span/text()").to_s
      {
        image_url: product.xpath(".//img[@class='s-image']").attr('src').to_s,
        name: product.xpath(".//span[@class='a-size-base-plus a-color-base a-text-normal']/text()").to_s,
        price: price,
        price_before_discount: product.xpath(".//span[@class='a-price a-text-price']/span[1]/text()").to_s,
        ratings: count_stars(product.xpath(".//i[@class='a-icon a-icon-star-small a-star-small-4-5 aok-align-bottom']/span/text()").to_s),
        rated_products: product.xpath(".//a[@class='a-link-normal s-underline-text s-underline-link-text s-link-style']/span/text()").to_s,
        products_sold: '',
        shop: 'amazon',
        price_index: calculate_price_index(dollar_price(price), index),
        search_id: @search_id,
        product_url:"https://www.amazon.com/s?k=#{@search}",
        price_normal: dollar_price(price)
      }
    end.slice(0, 8)
    create_products(raw)
  end

  def create_products(raw_products)
    raw_products&.map { |p| Product.create(p) }
  end
end
