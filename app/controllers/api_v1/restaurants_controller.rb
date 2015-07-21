class ApiV1::RestaurantsController < ApiController

	def index

		# long = params[:longitude]

		# lat = params[:latitude]

		# category = Category.find(params[:category])

		# @mrt = Mrt.where(latitude:lat,longitude:long)

		# @mrt = Mrt.find(1)

		# @restaurants = @mrt.restaurants.where(category_id:2).limit(5).shuffle[0..4]

    @restaurants = Restaurant.all
	end



end