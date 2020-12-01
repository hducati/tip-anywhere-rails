class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  def execute
    JsonWebToken.encode(user_id: user_credentials.id) if user_credentials
  end

  private

  attr_reader :email, :password

  # verify user credentials
  def user_credentials
    user = User.find_by(email: email)

    return user if user && user.authenticate(password)

    raise(ExceptionHandler::AuthenticationError, AppError.invalid_credentials)
  end
end