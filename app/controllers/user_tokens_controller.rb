# frozen_string_literal: true

# UserTokens responsible to generate a token
class UserTokensController < ApplicationController
  def create
    token = AuthenticateUserService.new(auth_params).execute

    json_response(token, :created)
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end