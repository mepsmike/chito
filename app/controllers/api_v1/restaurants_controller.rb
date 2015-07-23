class ApiV1::RestaurantsController < ApiController
#skip_before_filter :verify_authenticity_token
	def index

		long = params[:longitude] #121.6175001

		lat = params[:latitude] #25.055288

    category = params[:category]

		@mrt = Mrt.where(latitude:lat,longitude:long)

		@restaurants = @mrt[0].restaurants.where(category_id:category)#.shuffle[0..4]

	end

end