namespace :dev do

    task :get_mrt_station => :environment do

        conn = Faraday.new(:url => 'https://raw.githubusercontent.com' )
        res = conn.get '/repeat/taipei-metro-stations/master/taipei.json'
        data = JSON.parse( res.body )
    

        
        data["features"].each do |u|
       

         mrt = Mrt.create!( :name => u["properties"]["站名"], :address => u["properties"]["地址"],:line=> u["properties"]["線名"],:latitude => u["properties"]["緯度"],:longitude => u["properties"]["經度"] )
         puts "Create Mrt_station"
         end
    end

    task :get_yelp => :environment do

        params = {  }

        #@mrt = Mrt.all
        coordinates = {latitude: 25.030009, longitude: 121.472389}
        #@mrt.each do |m|
            #coordiantes = {latitude: @mrt.latitude, longitude: @mrt.longitude}
            @shops = Yelp.client.search_by_coordinates(coordinates, params)
            
            @shops.businesses.each do |s|
                shops = Restaurant.create!(:name => s.name)
            end
        #end
    end
end