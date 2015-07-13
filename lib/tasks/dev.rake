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

        
        Restaurant.destroy_all
        @mrt = Mrt.first(10)
        @category=Category.all

        #coordinates = {latitude: 25.030009, longitude: 121.472389}
        @mrt.each do |m|
            
            coordinates = {latitude: m.latitude, longitude: m.longitude}
            
            @category.each do |c|
                params = {category_filter: c.name}
                @shops = Yelp.client.search_by_coordinates(coordinates, params)

                puts @shops.businesses[6]
                @shops.businesses.each_with_index do |s, index|

                    shop = Restaurant.new
                    shop.name = s.name
                    shop.tel = s.phone if s.try(:phone) != nil
                    shop.category_id = c.id
                    shop.mrt_id = m.id
                    shop.address = s.location.address.join("")


                    # shops = Restaurant.new(:name => s.name,:tel => s.phone, :category_id =>c, :mrt_id => m, :address => s.location.address.join(""))
                    puts index
                    puts shop.inspect
                    shop.save!
                    puts "created Restaurant"
                end
                puts "CATEGORY DONE"
            end
            puts "MRT DONE"
        end
    end
end