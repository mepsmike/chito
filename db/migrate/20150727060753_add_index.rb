class AddIndex < ActiveRecord::Migration
  def change
    add_index :mrt_restaurantships, :mrt_id
    add_index :mrt_restaurantships, :restaurant_id
    add_index :favorites, :restaurant_id
    add_index :favorites, :user_id
  end
end
