class ApiV1::RestaurantsController < ApiController
#skip_before_filter :verify_authenticity_token
	before_action :authenticate,:except => [:index]

	def index

		long = params[:longitude] #121.6175001

		lat = params[:latitude] #25.055288

    category = params[:category]

		#@mrt = Mrt.where(latitude:lat,longitude:long)

		#@restaurants = @mrt[0].restaurants.where(category_id:category)#.shuffle[0..4]

		@restaurants = Restaurant.near([lat,long],30, :units=>:km).where(category_id:category).limit(5)

	end

	def visit #使用者可能去過的店，ios端點擊地圖上的餐廳時就post過來

		user_id = params[:user_id]

		res_id = params[:res_id]

		@favorite = Favorite.create(:user_id=>user_id,:restaurant_id=>res_id)

		render :json => { :message => "Ok"}

	end

	def no_visit #ios端使用者從去過的清單選擇沒有去過

		user_id = params[:user_id]

		res_id = params[:res_id]

		@favorite = Favorite.find_by(user_id:user_id,restaurant_id:res_id)

		@favorite = @favorite.destroy

		render :json => { :message => "Ok"}

	end

	def visit_get #ios 點擊"最近去過"清單時

		user_id = params[:user_id]

		@user = User.find_by_id(user_id)

		@visits = @user.favorites.where(status:"waiting").order("created_at DESC").limit(10)


	end

	def favorite_get

		user_id = params[:user_id]

		@user = User.find_by_id(user_id)

		@favorites = @user.favorites.where(status:"like")

	end

	def favorite_like #最近去過清單點選收藏

		user_id = params[:user_id]

		res_id = params[:res_id]

		@favorite = Favorite.find_by(user_id:user_id,restaurant_id:res_id)

		@favorite = @favorite.update(:status => "like")

		render :json => { :message => "Ok"}

	end

	def favorite_no_more #取消收藏

		user_id = params[:user_id]

		res_id = params[:res_id]

		@favorite = Favorite.find_by(user_id:user_id,restaurant_id:res_id)

		@favorite = @favorite.update(:status => "waiting")

		render :json => { :message => "Ok"}

	end


	def favorite_dislike #不想再看到的餐廳

		user_id = params[:user_id]

		res_id = params[:res_id]

		@favorite = Favorite.find_by(user_id:user_id,restaurant_id:res_id)

		@favorite = @favorite.update(:status => "dislike")

		render :json => { :message => "Ok"}

	end

	private

	def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    User.find_by(authentication_token: params[:auth_token])
  end

  def render_unauthorized
    render json: 'Bad credentials', status: 401
  end

end