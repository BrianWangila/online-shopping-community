class ChangeRatingType < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :ratings,:string, :default => 0
  end
end
