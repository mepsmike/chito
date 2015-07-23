require 'rails_helper'

RSpec.describe "Auth", type: :request do

  let!(:user) {  User.create!( :email => "foo@example.org", :fb_uid => "1234" ) }

  describe "facebook" do
    it "should login by facebook access_token (not existing)" do
      fb_data = {
        "id" => "5678",
        "email" => "bar@example.org",
        "name" => "ihower"
      }

      expect(User).to receive(:get_fb_data).with("fb-token-xxxx").and_return(fb_data)

      post "/api/v1/login", :access_token => "fb-token-xxxx"

      expect(response).to have_http_status(200)

      user = User.last

      data = {
        "message" => "Ok",
        "auth_token" => user.authentication_token,
        "user_id" => user.id
      }

      expect(JSON.parse(response.body)).to eq(data)
    end


    it "should login by facebook access_token (existing)" do
      fb_data = {
        "id" => "1234",
        "email" => "foo@example.org",
        "name" => "ihower"
      }

      expect(User).to receive(:get_fb_data).with("fb-token-xxxx").and_return(fb_data)

      post "/api/v1/login", :access_token => "fb-token-xxxx"

      expect(response).to have_http_status(200)

      data = {
        "message" => "Ok",
        "auth_token" => user.authentication_token,
        "user_id" => user.id
      }

      expect(JSON.parse(response.body)).to eq(data)
    end

    it "should login failed" do
      expect(User).to receive(:get_fb_data).with("qq").and_return(nil)

      post "/api/v1/login", :access_token => "qq"

      expect(response).to have_http_status(401)
    end

  end


end