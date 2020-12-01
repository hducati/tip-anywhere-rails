class UserTokensController < ApplicationController
  def create
    user_token_object = AuthenticateUser.new(auth_params[:email], 
      auth_params[:password]).execute

    json_response(user_token_object, :created)
  end

  private
  
  def auth_params
    params.permit(:email, :password)
  end
end
