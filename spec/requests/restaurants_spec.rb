require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /restaurants" do
    it "should restaurants list" do
      Restaurant.create!( :name => "Foooooo",:address =>"add",:tel =>"tel" )

      get "/api/v1/restaurants"

      data = {
        "data" => [{
          "name" => "Foooooo",
          "address" => "add",
          "tel" => "tel"
        }]
      }

      expect(response).to have_http_status(200)
      expect( JSON.parse(response.body) ).to eq( data )
    end
  end


end