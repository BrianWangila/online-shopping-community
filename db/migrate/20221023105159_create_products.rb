class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.integer :price
      t.integer :price_before_discount
      t.integer :discount
      t.integer :rating
      t.integer :products_rated
      t.string :return_policy
      t.string :shipping
      t.string :coupon_discount

      t.timestamps
    end
  end
end
