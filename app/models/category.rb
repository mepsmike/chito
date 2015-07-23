class Category < ActiveRecord::Base

  # TODO: validations
  validates_presence_of :name
  has_many :restaurants

end
