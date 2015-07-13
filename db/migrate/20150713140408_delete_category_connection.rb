class DeleteCategoryConnection < ActiveRecord::Migration
  def up
  	remove_column :restaurants, :category
  	remove_column :restaurants, :mrt_name
		remove_column :restaurants, :mrt_latitude
		remove_column :restaurants, :mrt_longitude

  	add_column :restaurants, :category_id, :integer
  	add_column :restaurants, :mrt_id, :integer
  end

  def down
  	remove_column :restaurants, :cateogry_id
  end

end
