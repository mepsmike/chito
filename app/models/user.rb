class User < ActiveRecord::Base

  has_many :favorites
  has_many :restaurants, :through => :favorites


  # TODO: validations
  validates_presence_of :fb_token, :email
  before_create :generate_authentication_token

  def generate_authentication_token
    self.authentication_token = Devise.friendly_token
  end


  def self.get_fb_data(access_token)
    conn = Faraday.new(:url => 'https://graph.facebook.com')
    res = conn.get '/v2.4/me?fields=email', { :access_token => access_token }

    if res.status == 200
      JSON.parse( res.body )
    else
      Rails.logger.warn(res.body)
      nil
    end
  end

  def self.from_omniauth(auth_hash)
      user = where( :fb_uid => auth_hash[:uid] ).first_or_initialize
      user.name = auth_hash[:info][:name]
      user.email = auth_hash[:info][:email]
      user.image = auth_hash[:info][:image]
      user.fb_token = auth_hash[:credentials][:token]
      user.fb_expires_at = Time.at(auth_hash[:credentials][:expires_at])
      user.save!
      user

  end


end
