# frozen_string_literal: true

# Service responsible to authenticate the user and generate a token
class AuthenticateUserService < ApplicationService
  attr_reader :email, :password

  def initialize(email, password)
    super()
    @email = email
    @password = password
  end

  def execute
    JsonWebToken.encode(user_id: user.id) if user_credentials
  end

  private

  # verify user credentials
  def user_credentials
    user = User.find_by(email: email)

    return user if user&.authenticate(password)

    raise(
      ExceptionHandler::AuthenticationError,
      Message.error_message('Wrong password/email combination')
    )
  end
end
