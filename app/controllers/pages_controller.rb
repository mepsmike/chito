class PagesController < ApplicationController

  before_action :check_login, :only => [ :user_profile]

  def index
    # @restaurant = Restaurant.find_by_mrt_id(params(10))
    @post = Post.new
  end

  def restaurant
    @restaurant = Restaurant.all
  end



  def mrt
    @mrt = Mrt.all
  end


  def map


    @events =Mrt.all
    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
      #address=Geocoder.coordinates(event.address)
      marker.lat event.latitude
      marker.lng event.longitude
      marker.json({ :id => event.id })
      marker.picture({
        :url => view_context.image_path("pin_2x.png"),
        :width   => 86,
        :height  => 102
      })


    end



  end

end
