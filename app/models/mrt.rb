class Mrt < ActiveRecord::Base

  # TODO: validations
  validates_presence_of :name, :address, :latitude, :longitude
  has_many :restaurants

end
