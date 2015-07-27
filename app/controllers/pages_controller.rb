class PagesController < ApplicationController

  before_action :check_login, :only => [ :user_profile]

  def index
    # @restaurant = Restaurant.find_by_mrt_id(params(10))
    @post = Post.new
  end

  def restaurant
    @category = Category.all
    @restaurant = Restaurant.all
  end



  def mrt
    @mrt = Mrt.all
    @mrt_line = Mrt.select("DISTINCT line")


  end



end
