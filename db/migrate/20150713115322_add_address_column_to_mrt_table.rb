class AddAddressColumnToMrtTable < ActiveRecord::Migration
  def change
  	add_column :mrts, :address, :text
  end
end
