class ChangeMrtColumn < ActiveRecord::Migration
  def change
    change_column :mrts, :latitude, :decimal
    change_column :mrts, :longitude, :decimal
  end
end
