class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  def execute
    return [user, token] if user_credentials
  end

  private

  attr_reader :email, :password

  # verify user credentials
  def user_credentials
    user = User.find_by(email: email)

    token = JsonWebToken.encode(user_id: user.id) 
      if user && user.authenticate(password)

    return [user, token] if token

    raise(
      ExceptionHandler::AuthenticationError, 
      AppError.error_message('Wrong password/email combination')
    )
  end
end