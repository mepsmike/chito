class DeleteMrtIdColumn < ActiveRecord::Migration
  def change
    remove_column :restaurants, :mrt_id
  end
end
