class Restaurant < ActiveRecord::Base

  # TODO: validations
  validates_presence_of :address, :tel, :name
  belongs_to :category
  belongs_to :mrt


  geocoded_by :address


end
