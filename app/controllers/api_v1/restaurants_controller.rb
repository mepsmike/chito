class ApiV1::RestaurantsController < ApiController
#skip_before_filter :verify_authenticity_token
	def index


		long = params[:longitude] #121.6175001

		lat = params[:latitude] #25.055288

    category = params[:category]

		@mrt = Mrt.where(latitude:lat,longitude:long)

		@restaurants = @mrt[0].restaurants.where(category_id:category)#.shuffle[0..4]

		# long = params[:longitude]

		# lat = params[:latitude]

		# category = Category.find(params[:category])

		# @mrt = Mrt.where(latitude:lat,longitude:long)

		# @mrt = Mrt.find(1)

		# @restaurants = @mrt.restaurants.where(category_id:2).limit(5).shuffle[0..4]


	end

end