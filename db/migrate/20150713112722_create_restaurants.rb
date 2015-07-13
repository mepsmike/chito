
class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :tel
      t.text :address
      t.float :latitude
      t.float :longitude
      t.string :category
      t.string :time
      t.string :mrt_name
      t.float :mrt_latitude
      t.float :mrt_longitude

      t.timestamps null: false
    end

  end
end
