class AddIndexToRestaurants < ActiveRecord::Migration
  def change

    add_index :restaurants, :category_id
    add_index :restaurants, :mrt_id
  end
end
