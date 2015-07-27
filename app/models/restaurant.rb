class Restaurant < ActiveRecord::Base

  # TODO: validations
  validates_presence_of :address, :tel, :name, :latitude, :longitude

  belongs_to :category


  has_many :favorites, :dependent => :destroy
  has_many :users, :through => :favorites

  has_many :mrt_restaurantships
  has_many :mrts, :through => :mrt_restaurantships

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }


end
