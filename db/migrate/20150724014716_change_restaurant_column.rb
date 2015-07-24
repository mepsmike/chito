class ChangeRestaurantColumn < ActiveRecord::Migration
  def change
    change_column :restaurants, :latitude, :decimal
    change_column :restaurants, :longitude, :decimal
  end
end
