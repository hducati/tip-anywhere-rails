# frozen_string_literal: true

class UserTokensController < ApplicationController
  def create
    user_token_object = AuthenticateUserService.new(params).execute

    json_response(user_token_object, :created)
  end
end
