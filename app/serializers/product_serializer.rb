# frozen_string_literal: true

class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :price_before_discount, :discount, :shop, :image_url, :ratings, :rated_products,
             :return_policy, :shipping, :coupon_discount, :rated_products, :product_url, :price_index,:price_normal
end
