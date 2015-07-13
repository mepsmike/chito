class Restaurant < ActiveRecord::Base
  has_one :category
  has_one :mrt
end
