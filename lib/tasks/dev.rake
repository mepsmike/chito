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
end