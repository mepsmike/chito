class SessionsController < ApplicationController

  def create
    Rails.logger.debug( env["omniauth.auth"] )
    user = User.from_omniauth(auth_hash)

    reset_session
    session[:user_id] = user.id

    flash[:notice]='Login Successfully'
    redirect_to root_path
  end

  def failure
    Rails.logger.debug( env["omniauth.auth"] )

    flash[:alert]='Login failed'
    redirect_to root_path
  end

  def destroy
    reset_session

    flash[:notice]='Logout Successfully'
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

end
