class PriceNormal < ActiveRecord::Migration[7.0]
  def change
    add_column :products,:price_normal, :integer
  end
end
