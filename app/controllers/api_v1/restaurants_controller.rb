class ApiV1::RestaurantsController < ApiController
#skip_before_filter :verify_authenticity_token
	def index

		long = params[:longitude] #121.6175001

		lat = params[:latitude] #25.055288

    category = params[:category]

		#@mrt = Mrt.where(latitude:lat,longitude:long)

		#@restaurants = @mrt[0].restaurants.where(category_id:category)#.shuffle[0..4]

		@restaurants = Restaurant.near([lat,long],30, :units=>:km).where(category_id:category).limit(5)

		# long = params[:longitude]

		# lat = params[:latitude]

		# category = Category.find(params[:category])

		# @mrt = Mrt.where(latitude:lat,longitude:long)

		# @mrt = Mrt.find(1)

		# @restaurants = @mrt.restaurants.where(category_id:2).limit(5).shuffle[0..4]

	end

	def visit #使用者可能去過的店，ios端點擊地圖上的餐廳時就post過來

		user_id = params[:user_id]

		res_id = params[:res_id]

		@favorite = Favorite.create(:user_id=>user_id,:restaurant_id=>res_id)

	end

	def no_visit #ios端使用者從去過的清單選擇沒有去過

		user_id = params[:user_id]

		res_id = params[:res_id]

		@favorite = Favorite.where(user_id:user_id,restaurant_id:res_id)

		@favorite = @favorite.destroy

	end

	def visit_get #ios 點擊"最近去過"清單時

		user_id = params[:user_id]

		@user = User.where(id:user_id)

		@visits = @user.favorites.where(status:"waiting")

	end

	def favorite_get

		user_id = params[:user_id]

		@user = User.where(id:user_id)

		@favorites = @user.favorites.where(status:"like")

	end

	def favorite_like #最近去過清單點選收藏

		user_id = params[:user_id]

		res_id = params[:res_id]

		@favorite = Favorite.where(user_id:user_id,restaurant_id:res_id)

		@favorite = @favorite.update(:status => "like")

	end

	def favorite_dislike #收藏清單的餐廳取消收藏

		user_id = params[:user_id]

		res_id = params[:res_id]

		@favorite = Favorite.where(user_id:user_id,restaurant_id:res_id)

		@favorite = @favorite.update(:status => "dislike")

	end

end