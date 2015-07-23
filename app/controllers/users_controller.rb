class UsersController < ApplicationController

  def show
    @user = current_user
    @restaurant = Restaurant.first(20)
    @mrt = Mrt.all
    @favorite = @user.restaurants
  end

end
