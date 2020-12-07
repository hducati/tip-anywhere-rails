# frozen_string_literal: true

# Controller responsible to generate a token and validate
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
