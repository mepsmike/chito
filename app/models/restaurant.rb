class Restaurant < ActiveRecord::Base

  # TODO: validations
  validates_presence_of :address, :tel, :name

  belongs_to :category


  has_many :favorites, :dependent => :destroy
  has_many :users, :through => :favorites

  has_many :mrt_restaurantships
  has_many :mrts, :through => :mrt_restaurantships

  geocoded_by :address


end
