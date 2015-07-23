class YelpRestaurantIdToString < ActiveRecord::Migration
  def change
    remove_column :restaurants, :yelp_restaurant_id
    add_column :restaurants, :yelp_restaurant_id, :string
  end
end
