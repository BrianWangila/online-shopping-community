class AddExpireAtToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :expire_at,:datetime
  end
end
