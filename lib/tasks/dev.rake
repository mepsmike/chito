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

    task :post => :environment do
        Post.delete_all
        puts"creating fake POST data"

        50.times do |p|
            p = Post.create(:name => Faker::Name.name, :email=>Faker::Internet.free_email, :title=> Faker::Team.name ,:content=>Faker::Lorem.paragraph(2))
            p.save
            puts"#{p.name} created"
        end
    end

    task :get_yelp => :environment do


        Restaurant.destroy_all
        @mrt = Mrt.all
        @category=Category.all

        #coordinates = {latitude: 25.030009, longitude: 121.472389}
        @mrt.each do |m|

            coordinates = {latitude: m.latitude, longitude: m.longitude}

            @category.each do |c|
                params = {category_filter: c.name,}
                @shops = Yelp.client.search_by_coordinates(coordinates, params)


                @shops.businesses.each_with_index do |s, index|

                    shop = Restaurant.new
                    shop.name = s.name

                    if s.try(:phone) != nil
                        shop.tel = s.phone.sub!"+886","0"
                        shop.tel.insert(2,"-")
                        shop.tel.insert(7,"-")
                    end

                    shop.category_id = c.id
                    shop.mrt_id = m.id

                    location = location.display_address

                    if s.try(:location) != nil
                        add = s.location.display_address
                        add.slice!(2)
                        shop.address = add.join(" ")
                    end

                    # shops = Restaurant.new(:name => s.name,:tel => s.phone, :category_id =>c, :mrt_id => m, :address => s.location.address.join(""))

                    shop.save!

                    puts "created Restaurant"
                end
                puts "CATEGORY DONE"
            end
            puts "MRT DONE"
        end
    end
end