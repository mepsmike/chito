class Post < ActiveRecord::Base

validates_presence_of :title, :content, :name, :email

end
