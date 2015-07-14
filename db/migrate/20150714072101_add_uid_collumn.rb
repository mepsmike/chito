class AddUidCollumn < ActiveRecord::Migration
  def change
    add_column :users, :fb_uid, :string
    add_column :users, :image, :string
    add_column :users, :name, :string
    add_column :users, :fb_token, :string
    add_column :users, :fb_expires_at, :datetime
  end
end
