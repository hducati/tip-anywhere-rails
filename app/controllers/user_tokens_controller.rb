class UserTokensController < ApplicationController
  def create
    [user, token] = AuthenticateUser.new(auth_params[:email], 
      auth_params[:password]).execute

    json_response([user: user, token: token], :created)
  end

  private
  
  def auth_params
    params.permit(:email, :password)
  end
end
