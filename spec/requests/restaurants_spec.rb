require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "POST /restaurants" do

    it "should restaurants list" do
      Restaurant.create!( :name => "Foooooo",:address =>"add",:tel =>"tel",:category_id =>1,:mrt_id=>1 )
      Mrt.create!(:name => "XXX",:latitude =>25.055288,:longitude=>121.6175001)
      Category.create!(:name => "xxx")
      post "/api/v1/restaurants", :category => 1 , :latitude => 25.055288, :longitude =>121.6175001

      data = {
        "data" => [{
          "name" => "Foooooo",
          "address" => "add",
          "tel" => "tel"
        }]
      }
      expect( JSON.parse(response.body) ).to eq( data )
      expect(response).to have_http_status(200)

    end
  end


end