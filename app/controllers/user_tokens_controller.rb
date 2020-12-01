class UserTokensController < ApplicationController
  def create
    token = AuthenticateUser.new(auth_params[:email], 
      auth_params[:password]).execute

    json_response(token: token)
  end

  private
  
  def auth_params
    params.permit(:email, :password)
  end
end
