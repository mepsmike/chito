class ApiController < ActionController::Base

  before_action :authenticate_user_from_token!

  def authenticate_user_from_token!

    if params[:auth_token].present?
      user = User.find_by_authentication_token( params[:auth_token] )
      sign_in(user, store: false) if user
    end

  end

  def add_to_favorite
    @restaurant = Restaurant.find(params[:id])
    @user = current_user
    @favorite = Favorite.new
    @favorite = @user.favorite.new(params_favorite)
    @favorite.save
  end

  private


  def params_favorite
    params.require(:favorites).permit(:user_id, :restaurant_id)
  end

end
