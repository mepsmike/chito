class CreateMrtRestaurantships < ActiveRecord::Migration
  def change
    create_table :mrt_restaurantships do |t|
      t.integer :mrt_id
      t.integer :restaurant_id

      t.timestamps null: false
    end
  end
end
