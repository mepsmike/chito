class AddYelpRestaurantIdColumn < ActiveRecord::Migration
  def change
    add_column :restaurants, :yelp_restaurant_id, :integer
  end

end
