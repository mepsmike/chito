class ReviseUserColumn < ActiveRecord::Migration
  def change
    change_column :users, :fb_token, :text
  end
end
