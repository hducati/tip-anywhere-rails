# frozen_string_literal: true

class CreateUserService < ApplicationService
  attr_reader :name, :birthday_date, :email, :password_digest

  def initialize(user_params = {})
    super()
    @name = user_params[:name]
    @birthday_date = user_params[:birthday_date]
    @email = user_params[:email]
    @password_digest = user_params[:password_digest]
  end

  def execute
    create_user
  end

  private

  def create_user
    user = User.create!({
                          name: name, birthday_date: birthday_date, email: email,
                          password_digest: password_digest
                        })

    return user if user
  end
end
