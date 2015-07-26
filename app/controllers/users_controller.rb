class UsersController < ApplicationController

  def show
    # @user = current_user
    # @restaurant = Restaurant.first(20)
    # @mrt = Mrt.all
    # @favorite = @user.restaurants


    @res =Restaurant.all
    @hash = Gmaps4rails.build_markers(@res) do |r, marker|
      #address=Geocoder.coordinates(r.address)
      marker.lat r.latitude
      marker.lng r.longitude
      marker.json({ :id => r.id })
      marker.picture({
        :url => view_context.image_path("pin_2x.png"),
        :width   => 86,
        :height  => 102
      })



    end
  end

  def mapinfo

    @res = Restaurant.find(params[:mid])


    respond_to do |format|

      format.js

    end

  end

end
