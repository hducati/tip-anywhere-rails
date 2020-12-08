# frozen_string_literal: true

# Controller responsible to generate a token and validate
class UserTokensController < ApplicationController
  skip_before_action :authorize_request, only: :create

  def create
    auth_token = AuthenticateUserService.new(auth_params[:email], auth_params[:password]).execute

    json_response(auth_token: auth_token)
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
