class Mrt < ActiveRecord::Base

  # TODO: validations
  validates_presence_of :name, :address, :latitude, :longitude, :line
  has_many :mrt_restaurantships
  has_many :restaurants, :through => :mrt_restaurantships

end
