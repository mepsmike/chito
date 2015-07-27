class AddStatusToFavorite < ActiveRecord::Migration
  def change
    add_column :favorites, :status, :string, :default => "waiting"
  end
end
