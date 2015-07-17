class PagesController < ApplicationController

  def index
    # @restaurant = Restaurant.find_by_mrt_id(params(10))
  end

  def mrt
    @mrt = Mrt.all
  end

end
