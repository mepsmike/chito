class PagesController < ApplicationController

  def index
    # @restaurant = Restaurant.find_by_mrt_id(params(10))
  end

  def restaurant
    @restaurant = Restaurant.all
  end

  def user_profile
    @user = User.find_by_fb_token(params[:fb_token])
    @restaurant = Restaurant.all
    @mrt = Mrt.all
  end

  def mrt
    @mrt = Mrt.all
  end

end
