require 'rails_helper'

RSpec.describe "visit restaurant", type: :request do

  describe "POST /visit" do

    it "should restaurants list" do
      # Restaurant.create!( :name => "Foooooo",:address =>"add",:tel =>"tel",:category_id =>1 )
      # Mrt.create!(:name => "XXX",:latitude =>25.055288,:longitude=>121.6175001,:address=>"sdf")
      # Category.create!(:name => "xxx")
      # MrtRestaurantship.create!(:mrt_id =>1,:restaurant_id =>1)
      post "/api/v1/visit", :user_id => 5

      data = {
        "data" => [{
          "id" => "123",
          "name" => "Foooooo",
          "address" => "add",
          "tel" => "tel",
          "latitude" => "111",
          "longitude" => "sdf",
          "image" => "xxx"
        }]
      }
      expect( JSON.parse(response.body) ).to eq( data )
      expect(response).to have_http_status(200)

    end
  end


end