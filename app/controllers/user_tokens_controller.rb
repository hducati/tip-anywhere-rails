# frozen_string_literal: true

# Controller responsible to generate a token and validate
class UserTokensController < ApplicationController
  def create
    token = AuthenticateUserService.execute(auth_params)

    json_response(token, :created)
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
