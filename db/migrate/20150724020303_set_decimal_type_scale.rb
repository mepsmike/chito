class SetDecimalTypeScale < ActiveRecord::Migration
  def change
    change_column :mrts , :latitude, :decimal, precision: 20, scale: 10
    change_column :mrts , :longitude, :decimal, precision: 20, scale: 10
    change_column :restaurants, :latitude, :decimal, precision:20, scale: 10
    change_column :restaurants, :longitude, :decimal, precision:20, scale: 10
  end
end
