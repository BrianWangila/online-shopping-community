class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :price, :price_before_discount, :discount, :rating, :products_rated, :return_policy, :shipping, :coupon_discount
end
